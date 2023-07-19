import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';

import '../../common/const/constants.dart';

class SetInterestList extends StatefulWidget {
  const SetInterestList({Key? key}) : super(key: key);

  @override
  State<SetInterestList> createState() => _SetInterestListState();
}

class _SetInterestListState extends State<SetInterestList> {

  List<String> selectedList = [];

  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width;


    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: containerSize,
      height: containerSize,
      child: GridView.builder(
        itemCount: CATEGORY_LIST_FOR_SIGNUP.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1/1,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),

        itemBuilder: (BuildContext context, int index) {
          return getCategoryItem(CATEGORY_LIST_FOR_SIGNUP.elementAt(index));
        },

      ),
    );
  }

  Widget getCategoryItem(String title) {
    double itemSize = (MediaQuery.of(context).size.width - 30) / 3;

    return Container(
      margin: const EdgeInsets.all(5),
      color: Colors.transparent,
      width: itemSize,
      height: itemSize,
      child: ElevatedButton(
        onPressed: () { didTapCategoryItem(title); },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                width: 1,
                color: selectedList.contains(title)
                    ? PURPLE_COLOR : Colors.transparent,
              )
          ),
          backgroundColor: selectedList.contains(title)
              ? Colors.white : GRAY_0_COLOR,
        ),
        child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: selectedList.contains(title)
                    ? PURPLE_COLOR : GRAY_2_COLOR,
              ),
              textAlign: TextAlign.center,
            )
        ),
      ),
    );
  }


  void didTapCategoryItem(String selected) {
    setState(() {
      selectedList.contains(selected)
          ? selectedList.remove(selected)
          : selectedList.add(selected);
    });
  }
}
