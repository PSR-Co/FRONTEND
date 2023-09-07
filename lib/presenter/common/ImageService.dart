import 'dart:io';

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
      String dir = getDirectoryStr(imageType, imgKeyList.indexOf(element));
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
  String getDirectoryStr(ImageType imageType, int index) {
    switch (imageType) {
      case ImageType.product:
        return "product/product-${getTodayStr()}-$index";
      case ImageType.review:
        return "review/review-${getTodayStr()}-$index";
      case ImageType.userProfile:
        return "user_profile/profile-${getTodayStr()}-$index";
    }
  }

  String getTodayStr() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyyMMdd');
    return formatter.format(now);
  }

}