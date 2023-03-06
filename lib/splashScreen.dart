import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pedrodap/screens/profile/loginpage.dart';
import 'package:pedrodap/screens/profile/mainpage2.dart';
import 'package:sizer/sizer.dart';

import 'Widget/const.dart';
import 'Widget/sharedpreferance.dart';

class splashscreen2 extends StatefulWidget {
  const splashscreen2({Key? key}) : super(key: key);
  @override
  State<splashscreen2> createState() => _splashscreen2State();
}

class _splashscreen2State extends State<splashscreen2> {
  void initState() {
    super.initState();
    getdata();
    Timer(
      const Duration(seconds: 3),
      () => (userData == null)
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => loginpage()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => mainpage2())),
    );
  }

  getdata() async {
    userData = await SaveDataLocal.getDataFromLocal();
    setState(() {
      userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff131313),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            alignment: Alignment.center,
            height: double.infinity.h,
            width: double.infinity.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30.h,
                  width: 90.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Lottie.asset('assets/logo.json'),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "PEDRO",
                  style: TextStyle(
                      letterSpacing: 2.sp,
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "A Football Community App",
                  style: TextStyle(
                      letterSpacing: 2.sp,
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
