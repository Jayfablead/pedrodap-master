import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedrodap/screens/profile/loginpage.dart';
import 'package:pedrodap/screens/profile/myprofile.dart';
import 'package:sizer/sizer.dart';

DoneDialog(BuildContext context, String title, String contant,
    {VoidCallback? callback, String? buttonname}) {
  Widget okButton = TextButton(
    child: Container(
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white),
      child: Center(
        child: Text(buttonname ?? 'OK',
            // textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                decorationColor: Colors.black,
                fontFamily: 'poppins')),
      ),
    ),
    onPressed: () {
      // if (callback == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => loginpage(),
        ),
      );
      // } else {

      // }
    },
  );

  if (Platform.isAndroid) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      titlePadding: EdgeInsets.only(left: 5.w, top: 3.w),
      contentPadding: EdgeInsets.only(top: 0.0, bottom: 0.0, left: 20.0),
      title: Text(title,
          style: const TextStyle(
              color: Colors.white,
              decorationColor: Colors.black,
              fontFamily: 'poppins')),
      content: Text(contant,
          style: const TextStyle(
              color: Colors.white,
              decorationColor: Colors.black,
              fontFamily: 'poppins')),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  if (Platform.isIOS) {
    CupertinoAlertDialog cupertinoAlertDialog = CupertinoAlertDialog(
      title: Text(title,
          style: const TextStyle(
              color: Colors.white,
              decorationColor: Colors.black,
              fontFamily: 'poppins')),
      content: Text(contant,
          style: const TextStyle(
              color: Colors.white,
              decorationColor: Colors.black,
              fontFamily: 'poppins')),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
            data: ThemeData(
                dialogBackgroundColor: Colors.black,
                dialogTheme: DialogTheme(backgroundColor: Colors.black)),
            child: cupertinoAlertDialog);
      },
    );
  }
  // show the dialog
}
