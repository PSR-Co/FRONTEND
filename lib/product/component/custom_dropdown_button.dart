import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:psr/common/const/colors.dart';
import 'package:psr/common/const/constants.dart';

class CustomDropdownButton extends StatefulWidget {
  final double width;

  const CustomDropdownButton({
    required this.width,
    Key? key
  }) : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  bool isFolded = true;
  String? selectedCategory;

  String _dropdownValue = '상품 카테고리를 선택해주세요.';

  // 드롭박스.
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  static const double _dropdownHeight = 45;

  // 드롭다운 생성.
  void _createOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _customDropdown();
      Overlay.of(context)?.insert(_overlayEntry!);
    }
  }

  // 드롭다운 해제.
  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _overlayEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _removeOverlay(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: InkWell(
            onTap: () {
              setState(() {
                isFolded ? _createOverlay() : _removeOverlay();
                isFolded = !isFolded;
              });
            },
            child: CompositedTransformTarget(
              link: _layerLink,
              child: Container(
                width: widget.width,
                height: _dropdownHeight,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: PURPLE_COLOR.withOpacity(0.5),
                  ),
                  borderRadius: isFolded
                      ? BorderRadius.circular(14)
                      : BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                          bottomRight: Radius.zero,
                          bottomLeft: Radius.zero,
                        ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 선택값.
                    Text(
                      _dropdownValue,
                      style: TextStyle(
                        fontSize: 14,
                        height: 22 / 16,
                        color: (selectedCategory == null) ? GRAY_1_COLOR : GRAY_4_COLOR
                      ),
                    ),

                    // 아이콘.
                    Icon(
                      (isFolded) ? Icons.arrow_drop_down_outlined : Icons.arrow_drop_up_outlined,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 드롭다운.
  OverlayEntry _customDropdown() {
    return OverlayEntry(
      maintainState: true,
      builder: (context) => Positioned(
        width: widget.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: const Offset(0, _dropdownHeight),
          child: Material(
            color: Colors.white,
            child: Container(
              height: 45.0 * (CATEGORY.length-1),
              decoration: BoxDecoration(
                border: Border.all(color: PURPLE_COLOR.withOpacity(0.5)),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
              child: ListView.separated(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: CATEGORY.length,
                itemBuilder: (context, index) {
                  return CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    pressedOpacity: 1,
                    minSize: 0,
                    onPressed: () {
                      setState(() {
                        _dropdownValue = CATEGORY.elementAt(index);
                        selectedCategory = CATEGORY.elementAt(index);
                        isFolded = true;
                      });
                      _removeOverlay();
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        CATEGORY.elementAt(index),
                        style: TextStyle(
                          fontSize: 14,
                          height: 22 / 16,
                          color: GRAY_4_COLOR,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: GRAY_1_COLOR.withOpacity(0.5),
                    height: 20,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}