import 'package:flutter/cupertino.dart';

import '../const/colors.dart';

class Division extends StatefulWidget {
  const Division({super.key});

  @override
  State<Division> createState() => _DivisionState();
}

class _DivisionState extends State<Division> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.0,
      color: GRAY_0_COLOR,
      margin: EdgeInsets.only(bottom: 10.0),
    );
  }
}
