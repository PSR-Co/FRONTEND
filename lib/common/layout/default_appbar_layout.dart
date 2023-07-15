import 'package:flutter/material.dart';

class DefaultAppBarLayout extends StatefulWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? leftItem;
  final List<Widget>? rightItems;

  static const double APPBAR_HEIGHT = 50;

  const DefaultAppBarLayout({
    required this.titleText,
    this.leftItem,
    this.rightItems,
    Key? key
  }) : super(key: key);

  @override
  State<DefaultAppBarLayout> createState() => _DefaultAppBarLayoutState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(APPBAR_HEIGHT);
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
