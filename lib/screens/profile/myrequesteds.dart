import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/ReqModal.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:pedrodap/screens/profile/myconnections.dart';
import 'package:pedrodap/screens/profile/reqsteduserprof.dart';
import 'package:pedrodap/screens/profile/userprofile%20screen.dart';
import 'package:pedrodap/statichomepage.dart';
import 'package:sizer/sizer.dart';

import '../../Model/pendingreqModal.dart';
import '../../Widget/Drawer.dart';
import '../../Widget/buildErrorDialog.dart';
import '../../Widget/const.dart';
import '../../Widget/sharedpreferance.dart';

class MyRequested extends StatefulWidget {
  const MyRequested({Key? key}) : super(key: key);

  @override
  State<MyRequested> createState() => _MyRequestedState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
bool isloading = true;

class _MyRequestedState extends State<MyRequested> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pendingreqapi();
  }

  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isloading,
      scaffold: Scaffold(
          drawer: drawer(),
          key: _scaffoldKey,
          backgroundColor: Colors.black,
          body: isloading
              ? Container()
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 3.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StaticHomePage(),
                                    ));
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'My Requests',
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 90.h,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: reqsts?.allRequestedUsers?.length == 0
                                  ? Container(
                                      child: Center(
                                          child: Text(
                                        'No Reqests Sented',
                                        style: textStyle1,
                                      )),
                                    )
                                  : ListView.builder(
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => RqstdUser(
                                                    uid: reqsts
                                                            ?.allRequestedUsers?[
                                                                index]
                                                            .uid ??
                                                        ''),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 1.w,
                                            ),
                                            height: 12.h,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      1.w),
                                                          height: 7.h,
                                                          width: 14.w,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90),
                                                            child:
                                                                CachedNetworkImage(
                                                              fit: BoxFit.cover,
                                                              imageUrl: reqsts
                                                                      ?.allRequestedUsers?[
                                                                          index]
                                                                      .profilePic ??
                                                                  '',
                                                              progressIndicatorBuilder:
                                                                  (context, url,
                                                                          progress) =>
                                                                      CircularProgressIndicator(),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Image.asset(
                                                                'assets/icons/user.png',
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        // CircleAvatar(
                                                        //     radius: 8.w,
                                                        //     backgroundImage:
                                                        //         NetworkImage(pending!
                                                        //             .pendingRequests![
                                                        //                 index]
                                                        //             .profilePic
                                                        //             .toString())),
                                                        SizedBox(
                                                          width: 4.w,
                                                        ),
                                                        Text(
                                                          reqsts
                                                                  ?.allRequestedUsers?[
                                                                      index]
                                                                  .name ??
                                                              '',
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Meta1',
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ],
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              AlertDialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            scrollable: true,
                                                            content: Text(
                                                              'Are You Sure You Want to Cancel the Request ? This Can\'t be Undone .',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Meta1',
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            actions: [
                                                              InkWell(
                                                                onTap: () {
                                                                  rejectapi(
                                                                      index);
                                                                  setState(() {
                                                                    isloading =
                                                                        true;
                                                                  });
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(2
                                                                              .w),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(1
                                                                              .h),
                                                                  child: Text(
                                                                    'Yes',
                                                                    style: TextStyle(
                                                                        fontSize: 13
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Meta1',
                                                                        color: Colors
                                                                            .green),
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Colors
                                                                              .black,
                                                                          border: Border
                                                                              .all(
                                                                            color:
                                                                                Colors.green,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(1
                                                                              .w),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(1
                                                                              .h),
                                                                  child: Text(
                                                                    'No',
                                                                    style: TextStyle(
                                                                        fontSize: 13
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Meta1',
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Colors
                                                                              .black,
                                                                          border: Border
                                                                              .all(
                                                                            color:
                                                                                Colors.red,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      icon: Icon(
                                                        CupertinoIcons
                                                            .person_badge_minus,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount:
                                          reqsts?.allRequestedUsers?.length,
                                    )),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }

  pendingreqapi() {
    final Map<String, String> data = {};
    data['action'] = 'all_requested_users';
    data['login_user_id'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().allreqstuserapi(data).then((Response response) async {
          reqsts = ReqModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && reqsts?.status == "success") {
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            isloading = false;
          }
        });
      } else {
        setState(() {
          isloading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

  rejectapi(int index) {
    final Map<String, String> data = {};
    data['action'] = 'delete_requested_users';
    data['uid'] = reqsts?.allRequestedUsers?[index].uid ?? '';
    data['login_user_id'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().acceptreqapi(data).then((Response response) async {
          pending = PendingreqModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && pending?.status == "success") {
            Fluttertoast.showToast(
                msg: "Request Canceled",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            pendingreqapi();
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            isloading = false;
          }
        });
      } else {
        setState(() {
          isloading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

  TextStyle textStyle = TextStyle(
      color: Colors.grey.shade500, fontSize: 12.sp, fontFamily: 'Meta1');
  TextStyle textStyle1 = TextStyle(
      color: Colors.grey.shade400, fontSize: 14.sp, fontFamily: 'Meta1');
}
