import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

enum ImageType { product, review, userProfile }

class ImageService {

  /// Singleton Pattern
  static final ImageService _imageService = ImageService._();
  ImageService._();
  factory ImageService() {
    return _imageService;
  }

  Future<List<String>> uploadImageList(ImageType imageType, List<String> imgKeyList) async {
    List<String> uploadedImgDirList = [];

    for (var element in imgKeyList) {
      // 이미 업로드 된 경우 넘어감
      if (element.contains('https')) {
        uploadedImgDirList.add(element);
        continue;
      }
      String dir = await getDirectoryStr(imageType, imgKeyList.indexOf(element));
      // upload image
      File file = File(element);
      await FirebaseStorage.instance.ref(dir).putFile(file);

      // get url of uploaded image
      String url = await FirebaseStorage.instance.ref(dir).getDownloadURL();
      uploadedImgDirList.add(url);
    }
    return uploadedImgDirList;
  }

  /// helper methods
  Future<String> getDirectoryStr(ImageType imageType, int index) async {
    switch (imageType) {
      case ImageType.product:
        return "product/product-${await genRandomDirStr()}";
      case ImageType.review:
        return "review/review-${await genRandomDirStr()}";
      case ImageType.userProfile:
        return "user_profile/profile-${await genRandomDirStr()}";
    }
  }

  String getTodayStr() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    return formatter.format(now);
  }

  Future genRandomDirStr() async {
    var random = Random();

    var skipCharacter = [0x5B, 0x5C, 0x5D, 0x5E, 0x5F, 0x60]; // '+', '-', ' ', '/' 사용하지 않을 아스키 문자
    var min = 0x41;
    var max = 0x7A;
    var dat = [];
    while(dat.length <= 32) {
      var tmp = min + random.nextInt(max - min);
      if(skipCharacter.contains(tmp)) { continue; }
      dat.add(tmp);
    }
    return String.fromCharCodes(dat.cast<int>());
  }


}