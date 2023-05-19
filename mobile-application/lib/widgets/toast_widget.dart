import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message, BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Color(0xff919191),
      textColor: Colors.white,
      fontSize: 15,
      timeInSecForIosWeb: 3,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER);
}
