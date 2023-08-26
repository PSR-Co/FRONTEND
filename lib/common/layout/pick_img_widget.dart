import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../const/colors.dart';

// TODO: mutable 클래스로 변경함으로써 메모리 이슈가 있을 수 있음 -> imgKeyList를 final로 선언할 수 있는 로직 구상하기
class PickImgView extends StatefulWidget {

  final bool isEditing;
  List<String>? imgKeyList = [];

  PickImgView({
    required this.isEditing,
    required this.imgKeyList,
    Key? key
  }) : super(key: key);

  @override
  State<PickImgView> createState() => _PickImgViewState();
}

class _PickImgViewState extends State<PickImgView> {
  List<String> imgKeyList = [];

  @override
  void initState() {
    if(widget.imgKeyList != null) {
      imgKeyList = widget.imgKeyList!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return renderPickImgListView();
  }

  Widget renderPickImgListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imgKeyList.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (imgKeyList.isNotEmpty && index < imgKeyList.length) {
                return Container(
                  width: 90,
                  height: 90,
                  padding: const EdgeInsets.all(5),
                  child: (widget.imgKeyList!.elementAt(index).contains('https'))
                      ? Image.network(widget.imgKeyList!.elementAt(index))
                      : Image.file(File(widget.imgKeyList!.elementAt(index)),),
                  // child:
                );
              } else {
                return SizedBox(
                  width: 90,
                  height: 90,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (widget.isEditing)
                        ? () { didTapPickImgButton(imgKeyList.length); }
                        : null,
                      icon: SvgPicture.asset('asset/icons/shopping/pick_img_icon_${imgKeyList.length}.svg',)
                  ),
                );
              }
            },
            // children: renderImgListView(),
          ),
        ),
        FittedBox(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 3),
            child: const Text(
                '상품과 무관한 사진을 첨부하면 노출 제한 처리 될 수 있습니다. \n사진 첨부시 개인 정보가 노출되지 않게 유의해주세요.',
                style: TextStyle(
                  fontSize: 11,
                  color: GRAY_1_COLOR,
                )
            ),
          ),
        )
      ],
    );
  }

  /// event methods
  void didTapPickImgButton(int length) async {
    if (length < 5) {
      var picker = ImagePicker();
      var image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          imgKeyList.add(image.path);
          widget.imgKeyList!.add(image.path);
        });
      }
    } else {
      Fluttertoast.showToast(
          msg: '사진은 최대 5개까지 첨부할 수 있습니다.',
          gravity: ToastGravity.BOTTOM
      );
    }

  }
}
