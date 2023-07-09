import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  final String board_name;
  const BoardScreen({required this.board_name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(board_name),
      ),
    );
  }
}
