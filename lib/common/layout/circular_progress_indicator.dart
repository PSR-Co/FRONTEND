import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class CircularProgress extends StatefulWidget {
  const CircularProgress({super.key});

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      alignment: Alignment.center,
      child: Container(
          width: 30,
          height: 30,
          child: const CircularProgressIndicator(backgroundColor: PURPLE_COLOR, color: GRAY_0_COLOR,)),
    );
  }
}
