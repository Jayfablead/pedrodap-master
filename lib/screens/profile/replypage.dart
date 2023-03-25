import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/profileModal.dart';
import 'package:pedrodap/Widget/buildErrorDialog.dart';
import 'package:pedrodap/Widget/sharedpreferance.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';
import '../../Widget/const.dart';

class ReplyPage extends StatefulWidget {
  String? title;
  String? desc;
  String? tile;
  ReplyPage({super.key, this.desc, this.tile, this.title});

  @override
  State<ReplyPage> createState() => _ReplyPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController _reply = TextEditingController();
List msg = [
  "Or-less normal distribution of letters, as opposed to using Content.",
  "Or-less normal distribution of letters, as opposed to using Content.",
];
List time = ['10:00pm', '11:00pm'];

class _ReplyPageState extends State<ReplyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.tile.toString(),
                        style: TextStyle(
                          fontSize: 5.5.w,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Meta1',
                          color: Color(0xffffffff),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 89.w,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.title.toString(),
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Meta1',
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 89.w,
                          child: Text(
                            widget.desc.toString(),
                            maxLines: 7,
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Meta1',
                                color: Colors.grey.shade500),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 26.w, right: 3.w, top: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 2.w, top: 2.h, right: 2.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 1.h),
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(0.0)),
                                shape: BoxShape.rectangle,
                              ),
                              child: Text(
                                  "Or-less normal distribution of letters, as opposed to using Content.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Meta1',
                                      fontSize: 12.sp)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 1.w),
                              child: Text(
                                "11:33".toString(),
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Meta1',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 26.w, right: 3.w, top: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 2.w, top: 2.h, right: 2.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 1.h),
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(0.0)),
                                shape: BoxShape.rectangle,
                              ),
                              child: Text(
                                  "Or-less normal distribution of letters, as opposed to using Content.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Meta1',
                                      fontSize: 12.sp)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 1.w),
                              child: Text(
                                "11:33".toString(),
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Meta1',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 26.w, right: 3.w, top: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 2.w, top: 2.h, right: 2.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 1.h),
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(0.0)),
                                shape: BoxShape.rectangle,
                              ),
                              child: Text(
                                  "Or-less normal distribution of letters, as opposed to using Content.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Meta1',
                                      fontSize: 12.sp)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 1.w),
                              child: Text(
                                "11:33".toString(),
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Meta1',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 23.w, right: 3.w, top: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(
                                  left: 2.w, top: 2.h, right: 2.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.w, vertical: 1.h),
                              width: 85.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(0.0)),
                                shape: BoxShape.rectangle,
                              ),
                              child: Text(
                                  "Many desktop publishing packages and web page editors now use Lorem Ipsum as their description.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Meta1',
                                      fontSize: 12.sp)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 1.w),
                              child: Text(
                                "11:45".toString(),
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Meta1',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Container(
                  height: 7.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      // borderRadius: BorderRadius.only(
                      //   topRight: Radius.circular(25),
                      //   topLeft: Radius.circular(25),
                      // ),
                      color: Colors.black),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          height: 10.h,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Color.fromARGB(153, 190, 190, 190),
                            keyboardType: TextInputType.text,
                            controller: _reply,
                            decoration: InputDecoration(
                              hintText: 'Give a Reply',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 126, 126, 126)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 4.w),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            _reply.text = '';
                          },
                          icon: Icon(
                            Icons.send,
                            color: Color.fromARGB(255, 210, 210, 210),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
