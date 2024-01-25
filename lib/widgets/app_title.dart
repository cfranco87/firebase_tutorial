import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  final String title;

  const AppTitle(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override //The title has no string, creating a dynamic class
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18));
  }
}
