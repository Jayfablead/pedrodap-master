import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Widget/buildErrorDialog.dart';
import 'package:pedrodap/Widget/sharedpreferance.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:pedrodap/screens/profile/messagePage.dart';
import 'package:sizer/sizer.dart';

import '../../Model/allplayersmodal.dart';
import '../../Model/pendingreqModal.dart';
import '../../Model/userprofileModal.dart';
import '../../Widget/Drawer.dart';
import '../../Widget/const.dart';
import '../../Widget/videoprof.dart';
import 'myconnections.dart';

class FriendView extends StatefulWidget {
  String? uid;

  FriendView({Key? key, this.uid}) : super(key: key);

  @override
  State<FriendView> createState() => _FriendViewState();
}

List img = [
  'assets/psg.png',
];
List img1 = [
  'assets/france.png',
];
List pdi = [
  'assets/coach.jpg',
  'assets/tainer.jpg',
  'assets/tainer.jpg',
];
List pdn = [
  'Christophe Galtier',
  'Hany Ramboad',
  'Hany Ramboad',
];

List pdd = [
  'Coach',
  'Fitness trainer',
  'Nutritionist',
];

List tem = [
  'Paris Saint German',
];
List tem1 = [
  'France Fc',
];
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

List name = ['Lionel Messi', 'Cr 7', 'Suarez', 'Lewandoski'];
List time = ['3Hrs Ago', '1 Day Ago', '1 Month Ago', '2 Month Ago'];
List prof = [
  'assets/10.png',
  'assets/cr7.webp',
  'assets/suarez.jpg',
  'assets/lewa.webp'
];

bool isloading = true;

class _FriendViewState extends State<FriendView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userapi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isloading,
      scaffold: Scaffold(
          drawer: drawer(),
          key: _scaffoldKey,
          backgroundColor: Colors.black,
          body: isloading
              ? Container()
              : SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => MyConnections(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: Colors.white,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                height: 12.h,
                                width: 25.w,
                                padding: EdgeInsets.all(1.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: userprofile
                                            ?.userProfileDetails?.profilePic ??
                                        '',
                                    progressIndicatorBuilder:
                                        (context, url, progress) =>
                                            CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      'assets/icons/user.png',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 60.w,
                                    child: Text(
                                      userprofile?.userProfileDetails?.name ??
                                          '',
                                      maxLines: 3,
                                      style: TextStyle(
                                        fontSize: 6.w,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Meta1',
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  SizedBox(
                                    width: 50.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              userprofile?.userProfileDetails
                                                          ?.age ==
                                                      null
                                                  ? 'N/A'
                                                  : userprofile
                                                          ?.userProfileDetails
                                                          ?.age ??
                                                      '',
                                              style: TextStyle(
                                                fontSize: 6.w,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Meta1',
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                            Text(
                                              'Age',
                                              style: TextStyle(
                                                fontSize: 3.5.w,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Meta1',
                                                color: Color(0xffb4b4b4),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              (userprofile?.userProfileDetails
                                                      ?.connections)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 6.w,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Meta1',
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                            Text(
                                              'Connections',
                                              style: TextStyle(
                                                fontSize: 3.5.w,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Meta1',
                                                color: Color(0xffb4b4b4),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Divider(
                            color: Colors.white54,
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            userprofile?.userProfileDetails?.email ?? '',
                            style: TextStyle(
                              fontSize: 4.5.w,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Meta1',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side:
                                              BorderSide(color: Colors.white)),
                                      backgroundColor:
                                          Color.fromARGB(255, 0, 0, 0),
                                      scrollable: true,
                                      content: Column(
                                        children: [
                                          Text(
                                            'Are you Sure You Want To Disconnect ?',
                                            style: TextStyle(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Meta1',
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 1.h),
                                                width: 20.w,
                                                child: ElevatedButton(
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Meta1',
                                                      color: Color(0xffffffff),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    unfriendapi();
                                                    Navigator.of(context).pop();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.grey
                                                                  .withOpacity(
                                                                      0.20),
                                                          minimumSize:
                                                              Size(40.w, 5.h),
                                                          elevation: 00),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 1.h),
                                                width: 20.w,
                                                child: ElevatedButton(
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Meta1',
                                                      color: Color(0xffffffff),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors.grey
                                                              .withOpacity(
                                                                  0.20),
                                                          minimumSize:
                                                              Size(40.w, 5.h),
                                                          elevation: 00),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 9.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.10),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        size: 9.w,
                                        Icons.link_outlined,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Connected',
                                        style: TextStyle(
                                          fontSize: 4.w,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Meta1',
                                          color: Color(0xffeaeaea),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MessagePage(
                                        uid: userprofile
                                                ?.userProfileDetails?.uid ??
                                            '',
                                        image: userprofile?.userProfileDetails
                                                ?.profilePic ??
                                            '',
                                        name: userprofile
                                                ?.userProfileDetails?.name ??
                                            ''),
                                  ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 9.h,
                                  width: 25.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.10),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.white)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        size: 9.w,
                                        Icons.message_outlined,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Message',
                                        style: TextStyle(
                                          fontSize: 4.w,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Meta1',
                                          color: Color(0xffeaeaea),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Divider(
                            color: Colors.white54,
                          ),
                          userprofile?.userProfileDetails?.role == "2"
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Position : ',
                                          style: TextStyle(
                                            fontSize: 4.w,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Meta1',
                                            color: Color(0xffc7c6c6),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    Container(
                                      // height: 25.h,
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        userprofile?.userProfileDetails
                                                    ?.position ==
                                                null
                                            ? 'N/A'
                                            : userprofile?.userProfileDetails
                                                    ?.position ??
                                                '',
                                        style: textStyle,
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Ocupation : ',
                                          style: TextStyle(
                                            fontSize: 4.w,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Meta1',
                                            color: Color(0xffc7c6c6),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    Container(
                                      // height: 25.h,
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        (userprofile?.userProfileDetails
                                                    ?.role) ==
                                                '3'
                                            ? 'Coach'
                                            : (userprofile?.userProfileDetails
                                                        ?.role) ==
                                                    '5'
                                                ? 'Scouts'
                                                : (userprofile
                                                            ?.userProfileDetails
                                                            ?.role) ==
                                                        '6'
                                                    ? 'Medician'
                                                    : (userprofile
                                                                ?.userProfileDetails
                                                                ?.role) ==
                                                            '7'
                                                        ? 'Nutritionist'
                                                        : (userprofile
                                                                    ?.userProfileDetails
                                                                    ?.role) ==
                                                                '8'
                                                            ? 'Fitness Trainer'
                                                            : 'Personal Trainer',
                                        style: textStyle,
                                      ),
                                    ),
                                  ],
                                ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Experience : ',
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Meta1',
                                      color: Color(0xffc7c6c6),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Container(
                                // height: 25.h,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  userprofile?.userProfileDetails?.experience ==
                                          null
                                      ? 'N/A'
                                      : userprofile?.userProfileDetails
                                              ?.experience ??
                                          '',
                                  style: textStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Personal Details : ',
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Meta1',
                                      color: Color(0xffc7c6c6),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 1.h),
                              Container(
                                // height: 25.h,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  userprofile?.userProfileDetails?.about == null
                                      ? 'N/A'
                                      : userprofile
                                              ?.userProfileDetails?.about ??
                                          '',
                                  style: textStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.h),
                          userprofile?.userProfileDetails?.role == '2'
                              ? Column(
                                  children: [
                                    Divider(
                                      color: Colors.white54,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Current Club',
                                          style: TextStyle(
                                            fontSize: 4.w,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Meta1',
                                            color: Color(0xffc7c6c6),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 1.h),
                                    Container(
                                      height: 28.h,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 1,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                left: 1.w, right: 2.w),
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 39.4.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      ),
                                                      color: Colors.black),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(10),
                                                            topRight:
                                                                Radius.circular(
                                                                    10)),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.cover,
                                                      imageUrl: userprofile
                                                              ?.userProfileDetails
                                                              ?.currentClubImage ??
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
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                    ),
                                                    color: Color(0xff514d56),
                                                  ),
                                                  alignment: Alignment.center,
                                                  height: 6.h,
                                                  width: 39.4.w,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    2.w),
                                                        child: Text(
                                                          userprofile
                                                                  ?.userProfileDetails
                                                                  ?.clubName ??
                                                              '',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11.sp,
                                                              fontFamily:
                                                                  'Meta1',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    userprofile?.userProfileDetails
                                                ?.previousClub ==
                                            null
                                        ? Container()
                                        : Column(
                                            children: [
                                              SizedBox(height: 1.h),
                                              Divider(
                                                color: Colors.white54,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Previous Club',
                                                    style: TextStyle(
                                                      fontSize: 4.w,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Meta1',
                                                      color: Color(0xffc7c6c6),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 1.h),
                                              Container(
                                                height: 28.h,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: img1.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.w,
                                                          right: 2.w),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: 39.4.w,
                                                            decoration:
                                                                BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              10),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              10),
                                                                    ),
                                                                    color: Colors
                                                                        .black),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          10),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          10)),
                                                              child:
                                                                  CachedNetworkImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                imageUrl: userprofile
                                                                        ?.userProfileDetails
                                                                        ?.previousClubImage ??
                                                                    '',
                                                                progressIndicatorBuilder:
                                                                    (context,
                                                                            url,
                                                                            progress) =>
                                                                        CircularProgressIndicator(),
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Image.asset(
                                                                  'assets/icons/club.png',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                              ),
                                                              color: Color(
                                                                  0xff514d56),
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            height: 6.h,
                                                            width: 39.4.w,
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              2.w),
                                                                  child: Text(
                                                                    userprofile?.userProfileDetails?.previousClub ==
                                                                            null
                                                                        ? 'N/A'
                                                                        : userprofile?.userProfileDetails?.previousClub ??
                                                                            '',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: 11
                                                                            .sp,
                                                                        fontFamily:
                                                                            'Meta1',
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                    SizedBox(height: 1.h),
                                  ],
                                )
                              : Container(),
                          Divider(
                            color: Colors.white54,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "My Images : ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Meta1",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 25.h,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(1.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  // color: Colors.white.withOpacity(0.15),
                                ),
                                child: userprofile?.userProfileDetails?.images
                                            ?.length ==
                                        0
                                    ? Center(
                                        child: Text(
                                          'No Images Available',
                                          style: textStyle,
                                        ),
                                      )
                                    : GridView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: userprofile
                                            ?.userProfileDetails
                                            ?.images
                                            ?.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 1),
                                        itemBuilder: (contex, index) {
                                          return Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 1.w),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                height: 20.h,
                                                width: 60.w,
                                                fit: BoxFit.cover,
                                                imageUrl: userprofile
                                                        ?.userProfileDetails
                                                        ?.images?[index] ??
                                                    '',
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        Container(
                                                  height: 5.h,
                                                  width: 10.w,
                                                  child:
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 2.h, bottom: 2.h),
                                                  child: Center(
                                                    child: Text(
                                                      "Load Error!",
                                                      style: textStyle,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }),
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.white54,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "My Videos : ",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Meta1",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Container(
                                height: 30.h,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(1.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  // color: Colors.white.withOpacity(0.15),
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                                  height: 30.h,
                                  width: 70.w,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: userprofile?.userProfileDetails
                                                      ?.video ==
                                                  '' ||
                                              userprofile?.userProfileDetails
                                                      ?.video ==
                                                  null
                                          ? Center(
                                              child: Text(
                                                'No Video Available',
                                                style: textStyle,
                                              ),
                                            )
                                          : profplayer(
                                              video: userprofile
                                                  ?.userProfileDetails?.video,
                                            )),
                                ),
                                // child: Container(
                                //   width: 70.w,
                                //   margin: EdgeInsets.symmetric(horizontal: 1.w),
                                //   child: ClipRRect(
                                //     borderRadius: BorderRadius.circular(10),
                                //     child: Container(
                                //         height: 42.h,
                                //         width: 220.w,
                                //         child: videoplayer()),
                                //     ),
                                //   ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
    );
  }

  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: 'Meta1');

  userapi() {
    final Map<String, String> data = {};
    data['action'] = 'users_profile_details_app';
    data['uid'] = widget.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().userprofapi(data).then((Response response) async {
          userprofile = Userprofilemodal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && userData?.status == "success") {
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

  sendreqapi() {
    final Map<String, String> data = {};
    data['action'] = 'create_connection_request';
    data['login_user_id'] = userData!.userData!.uid.toString();
    data['uid'] = widget.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().sendreqapi(data).then((Response response) async {
          alldata = AllplayersModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && alldata?.status == "success") {
            Fluttertoast.showToast(
                msg: "Request Send Successfully",
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

  unfriendapi() {
    final Map<String, String> data = {};
    data['action'] = 'disconnect_user';
    data['uid'] = (userprofile?.userProfileDetails?.uid) as String;
    data['login_user_id'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().unfriendapi(data).then((Response response) async {
          pending = PendingreqModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && pending?.status == "success") {
            Fluttertoast.showToast(
                msg: "User Disconnected Successfully",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MyConnections(),
              ),
            );

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
}
