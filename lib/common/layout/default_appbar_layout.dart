import 'package:flutter/material.dart';

class DefaultAppBarLayout extends StatefulWidget {
  final String? titleText;
  final Widget? leftItem;
  final List<Widget>? rightItems;

  const DefaultAppBarLayout({
    required this.titleText,
    required this.leftItem,
    required this.rightItems,
    Key? key
  }) : super(key: key);

  @override
  State<DefaultAppBarLayout> createState() => _DefaultAppBarLayoutState();
}

class _DefaultAppBarLayoutState extends State<DefaultAppBarLayout> {
  final titleStyle = TextStyle(
      color: Colors.black,
      fontSize: 17
  );

  @override
  Widget build(BuildContext context) {
    return renderAppBar();
  }

  AppBar renderAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: (widget.titleText != null) ? Text(widget.titleText!, style: titleStyle,) : Text(""),
      centerTitle: true,
      leading: widget.leftItem,
      actions: widget.rightItems,
      elevation: 0,
    );
  }
}
