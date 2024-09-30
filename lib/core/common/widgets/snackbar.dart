import 'package:flutter/material.dart';

void showSnackBar(BuildContext context,
    {required String label, Color? bgColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: bgColor,
    content: Text(label),
  ));
}
