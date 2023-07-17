import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultAppBarLayout extends StatefulWidget implements PreferredSizeWidget {
  final String? titleText;
  final List<Widget>? rightItems;
  final bool? isBackItemHidden;

  static const double APPBAR_HEIGHT = 50;

  const DefaultAppBarLayout({
    required this.titleText,
    this.rightItems,
    this.isBackItemHidden,
    Key? key
  }) : super(key: key);

  @override
  State<DefaultAppBarLayout> createState() => _DefaultAppBarLayoutState();

  @override
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

  /// rendering methods
  AppBar renderAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: (widget.titleText != null) ? Text(widget.titleText!, style: titleStyle,) : Text(""),
      centerTitle: true,
      leading: (widget.isBackItemHidden ?? false) ? null : renderleftItem(),
      actions: widget.rightItems,
      elevation: 0,
    );
  }

  Widget renderleftItem() {
    return Container(
      child: IconButton(
        icon: SvgPicture.asset("asset/icons/common/chevron.backward.svg"),
        onPressed: didTapBackItem,
      ),
    );
  }

  /// event methods
  void didTapBackItem() { Navigator.of(context).pop(); }
}
