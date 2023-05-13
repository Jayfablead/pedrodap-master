import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:pedrodap/screens/others/feedpage.dart';
import 'package:pedrodap/screens/profile/myconnections.dart';
import 'package:pedrodap/statichomepage.dart';
import 'package:sizer/sizer.dart';

import 'Model/pendingreqModal.dart';
import 'Widget/Drawer.dart';
import 'Widget/buildErrorDialog.dart';
import 'Widget/const.dart';
import 'Widget/sharedpreferance.dart';

class PendingRequestPage extends StatefulWidget {
  const PendingRequestPage({Key? key}) : super(key: key);

  @override
  State<PendingRequestPage> createState() => _PendingRequestPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
bool isloading = true;

class _PendingRequestPageState extends State<PendingRequestPage> {
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
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FeedPage(),));
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Pending Requests',
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
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MyConnections(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white54)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Manage my network ',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Meta1',
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_right_alt_outlined,
                                  color: Colors.white,
                                  size: 22.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Pending Request :',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Meta1',
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 75.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: pending?.pendingRequests?.length == 0
                                ? Container(
                                    child: Center(
                                        child: Text(
                                      'No Pending Reqests Available',
                                      style: textStyle1,
                                    )),
                                  )
                                : ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 1.w,
                                        ),
                                        height: 12.h,
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 1.w),
                                                      height: 7.h,
                                                      width: 14.w,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(90),
                                                        child:
                                                            CachedNetworkImage(
                                                          fit: BoxFit.cover,
                                                          imageUrl: pending
                                                                  ?.pendingRequests?[
                                                                      index]
                                                                  .profilePic ??
                                                              '',
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      progress) =>
                                                                  CircularProgressIndicator(),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Image.asset(
                                                            'assets/icons/user.png',
                                                            color: Colors.white,
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
                                                      pending
                                                              ?.pendingRequests?[
                                                                  index]
                                                              .name ??
                                                          '',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Meta1',
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        acceptapi(index);
                                                        setState(() {
                                                          isloading = true;
                                                        });
                                                      },
                                                      child: Container(
                                                        height: 5.5.h,
                                                        width: 11.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white12
                                                              .withOpacity(
                                                                  0.10),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(90),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        child: Icon(
                                                          Icons.done_rounded,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 4.w,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
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
                                                                    255, 0, 0, 0),
                                                                scrollable: true,
                                                                content: Text(
                                                                  'Are You Sure You Want to Reject the Request ? This Can\'t be Undone .',
                                                                  style: TextStyle(
                                                                      fontSize: 11.sp,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                      fontFamily:
                                                                      'Meta1',
                                                                      color:
                                                                      Colors.white),
                                                                ),
                                                                actions: [
                                                                  InkWell(
                                                                    onTap: () {
                                                                      rejectapi(index);
                                                                      setState(() {
                                                                        isloading = true;
                                                                      });
                                                                      Navigator.of(
                                                                          context)
                                                                          .pop();
                                                                    },
                                                                    child: Container(
                                                                      margin: EdgeInsets
                                                                          .all(2.w),
                                                                      padding:
                                                                      EdgeInsets
                                                                          .all(1.h),
                                                                      child: Text(
                                                                        'Yes',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            13.sp,
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
                                                                          border:
                                                                          Border
                                                                              .all(
                                                                            color: Colors
                                                                                .green,
                                                                          ),
                                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Navigator.of(
                                                                          context)
                                                                          .pop();
                                                                    },
                                                                    child: Container(
                                                                      margin: EdgeInsets
                                                                          .all(1.w),
                                                                      padding:
                                                                      EdgeInsets
                                                                          .all(1.h),
                                                                      child: Text(
                                                                        'No',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                            13.sp,
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
                                                                          border:
                                                                          Border
                                                                              .all(
                                                                            color: Colors
                                                                                .red,
                                                                          ),
                                                                          borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                        );

                                                      },
                                                      child: Container(
                                                        height: 5.5.h,
                                                        width: 11.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white12
                                                              .withOpacity(
                                                                  0.10),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(90),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .redAccent),
                                                        ),
                                                        child: Icon(
                                                          Icons.close,
                                                          color:
                                                              Colors.redAccent,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: pending?.pendingRequests?.length,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
    );
  }

  pendingreqapi() {
    final Map<String, String> data = {};
    data['action'] = 'pending_request_app';
    data['uid'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().pendingreqapi(data).then((Response response) async {
          pending = PendingreqModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && pending?.status == "success") {
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

  acceptapi(int index) {
    final Map<String, String> data = {};
    data['action'] = 'accept_request_app';
    data['uid'] = pending?.pendingRequests?[index].uid ?? '';
    data['login_user_id'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().acceptreqapi(data).then((Response response) async {
          pending = PendingreqModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && pending?.status == "success") {
            pendingreqapi();
            Fluttertoast.showToast(
                msg:
                "Request Accepted",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.greenAccent,
                textColor: Colors.black,
                fontSize: 16.0);
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
    data['action'] = 'reject_request_app';
    data['uid'] = pending?.pendingRequests?[index].uid ?? '';
    data['login_user_id'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().acceptreqapi(data).then((Response response) async {
          pending = PendingreqModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && pending?.status == "success") {
            Fluttertoast.showToast(
                msg:
                "Request Rejected",
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
