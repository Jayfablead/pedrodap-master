import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/allplayersmodal.dart';
import 'package:pedrodap/Model/filtermodal.dart';
import 'package:pedrodap/Model/playermodal.dart';
import 'package:pedrodap/Model/searchusersmodal.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/Widget/buildErrorDialog.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/Widget/sharedpreferance.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/pendingReqestsPage.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:pedrodap/screens/profile/Chatpage.dart';
import 'package:pedrodap/screens/profile/DiscoverPage.dart';
import 'package:pedrodap/screens/profile/SleepSchedule.dart';
import 'package:pedrodap/screens/profile/listingpage.dart';
import 'package:pedrodap/screens/profile/messagePage.dart';
import 'package:pedrodap/screens/profile/trainningnotes.dart';
import 'package:pedrodap/screens/profile/userprofile%20screen.dart';
import 'package:sizer/sizer.dart';

import '../../Model/clubidmodal.dart';
import '../../Model/profileModal.dart';
import 'viewnutrition.dart';

class mainpage2 extends StatefulWidget {
  const mainpage2({Key? key}) : super(key: key);

  @override
  State<mainpage2> createState() => _mainpage2State();
}

class sachen1 {
  String? image;
  String? name;
  String? club;

  sachen1(this.image, this.name, this.club);
}

class Sachen {
  String? image;
  String? name;

  Sachen(this.image, this.name);
}

class _mainpage2State extends State<mainpage2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Sachen> data = [
    Sachen("assets/icons/coach (1).png", "Connect"),
    Sachen("assets/icons/coach.png", "Training"),
    Sachen("assets/icons/hospital.png", "Health"),
    Sachen("assets/icons/sleeping.png", "Sleep"),
  ];
  List<Sachen> data1 = [
    Sachen("assets/icons/coach (1).png", "Connect"),
    Sachen("assets/icons/players.png", "Discover"),
    Sachen("assets/icons/message.png", "Message"),
    Sachen("assets/icons/add-friend.png", "Requests"),
  ];
  int _current = 1;
  int agesel = 0;
  List age = [
    'below 18',
    '19 to 22',
    '23 to 27',
    '28 to 35',
    '36 to 40',
    'above 40',
  ];
  List ocupation = [
    'Coach',
    'Scouts',
    'Medicals',
    'Nutritionists',
    'Fitness Instructors',
    'Personal Trainers',
    'Player'
  ];
  List club = [
    'Brentford Academy',
    'Psg',
    'Al-Nasir',
    'Fc Barcelona',
    'Real Madrid',
    'Arsenal',
    'Manchester Utd',
  ];
  int selfilter = 0;
  int selRole = 0;
  int selClub = 0;
  int selectindex1 = 0;
  CarouselController _controller = CarouselController();

  TextEditingController _search = TextEditingController();
  bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(userData!.userData!.email);
    playerapi();
    profile();
    searchapi();
    clubsapi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      scaffold: Scaffold(
        key: _scaffoldKey,
        drawer: drawer(),
        backgroundColor: Colors.black,
        body: isloading
            ? Container()
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pedro",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Meta1',
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    _scaffoldKey.currentState?.openDrawer();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  )),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "Hello " +
                            (profiledata?.viewProfileDetails?.name ?? '') +
                            ' !!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontFamily: 'Meta1',
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        "Welcome to Pedro",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13.sp,
                            fontFamily: 'Meta1',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            height: 6.h,
                            width: 13.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: profiledata!
                                    .viewProfileDetails!.profilePic
                                    .toString(),
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
                          // CircleAvatar(
                          //     radius: 6.w,
                          //     backgroundImage: NetworkImage(
                          //         "https://icdn.football-espana.net/wp-content/uploads/2022/06/Neymar-Junior2.jpeg")),
                          searchBox(),
                          PopupMenuButton(
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                        child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          selfilter = 1;
                                        });
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 60.h,
                                              width: 80.w,
                                              child: AlertDialog(
                                                  backgroundColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      side: BorderSide(
                                                          color: Colors.white)),
                                                  title: Text(
                                                    'Select Age',
                                                    style: textStyle1,
                                                  ),
                                                  content: SizedBox(
                                                    height: 30.h,
                                                    width: 70.w,
                                                    child: GridView.builder(
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              childAspectRatio:
                                                                  10 / 5,
                                                              crossAxisCount:
                                                                  2),
                                                      itemCount: age.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              agesel = index;
                                                              filterapi();
                                                            });
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    2.w),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1.w),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Text(
                                                              age[index],
                                                              style: textStyle,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )),
                                            );
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Age',
                                            style: textStyle,
                                          ),
                                          SizedBox(
                                            height: 0.7.h,
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    )),
                                    PopupMenuItem(
                                        child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          selfilter = 2;
                                        });
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 60.h,
                                              width: 80.w,
                                              child: AlertDialog(
                                                  backgroundColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      side: BorderSide(
                                                          color: Colors.white)),
                                                  title: Text(
                                                    'Select Occupation',
                                                    style: textStyle1,
                                                  ),
                                                  content: SizedBox(
                                                    height: 30.h,
                                                    width: 70.w,
                                                    child: GridView.builder(
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              childAspectRatio:
                                                                  9 / 5,
                                                              crossAxisCount:
                                                                  2),
                                                      itemCount:
                                                          ocupation.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            selRole = index;
                                                            filterapi();
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    2.w),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.w),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Text(
                                                              ocupation[index],
                                                              style: textStyle,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )),
                                            );
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Occupation',
                                            style: textStyle,
                                          ),
                                          SizedBox(
                                            height: 0.7.h,
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    )),
                                    PopupMenuItem(
                                        child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        clubsapi();
                                        setState(() {
                                          selfilter = 3;
                                        });
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              height: 60.h,
                                              width: 80.w,
                                              child: AlertDialog(
                                                  backgroundColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      side: BorderSide(
                                                          color: Colors.white)),
                                                  title: Text(
                                                    'Select Club',
                                                    style: textStyle1,
                                                  ),
                                                  content: SizedBox(
                                                    height: 30.h,
                                                    width: 70.w,
                                                    child: GridView.builder(
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                              childAspectRatio:
                                                                  9 / 5,
                                                              crossAxisCount:
                                                                  2),
                                                      itemCount: cludid
                                                          ?.allClubsFetch
                                                          ?.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            selClub = index;
                                                            filterapi();
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            margin:
                                                                EdgeInsets.all(
                                                                    2.w),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.w),
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .white),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Text(
                                                              cludid
                                                                      ?.allClubsFetch?[
                                                                          index]
                                                                      .name ??
                                                                  ''
                                                                      '',
                                                              style: textStyle,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  )),
                                            );
                                          },
                                        );
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Club',
                                            style: textStyle,
                                          ),
                                          SizedBox(
                                            height: 0.7.h,
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(color: Colors.white)),
                              icon: Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                              color: Colors.black)
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      selfilter == 0
                          ? _search == ''
                              ? SizedBox(
                                  height: 48.h,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: alldata?.allUsers?.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: SingleChildScrollView(
                                          child: Container(
                                            height: 90.w,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h),
                                            width: 70.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(5.w),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0))),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      1.w),
                                                          height: 10.h,
                                                          width: 20.w,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90),
                                                            child:
                                                                CachedNetworkImage(
                                                              fit: BoxFit.cover,
                                                              imageUrl: alldata
                                                                      ?.allUsers?[
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
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                alldata
                                                                        ?.allUsers?[
                                                                            index]
                                                                        .name ??
                                                                    '',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                height: 0.8.h,
                                                              ),
                                                              alldata?.allUsers?[index]
                                                                          .clubName ==
                                                                      null
                                                                  ? Container()
                                                                  : Column(
                                                                      children: [
                                                                        Text(
                                                                          alldata?.allUsers?[index].clubName ??
                                                                              '',
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              fontSize: 12.sp,
                                                                              fontWeight: FontWeight.w400,
                                                                              fontFamily: 'Meta1',
                                                                              color: Colors.white),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              0.8.h,
                                                                        ),
                                                                      ],
                                                                    ),
                                                              Text(
                                                                alldata?.allUsers?[index].position ==
                                                                        null
                                                                    ? 'N/A'
                                                                    : alldata
                                                                            ?.allUsers?[index]
                                                                            .position ??
                                                                        '',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Colors
                                                                        .white),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(5.w),
                                                    decoration: BoxDecoration(
                                                        // color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20.0))),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '${alldata?.allUsers?[index].connections ?? ''}',
                                                              style: TextStyle(
                                                                fontSize: 6.w,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Meta1',
                                                                color: Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                            Text(
                                                              'Connections',
                                                              style: TextStyle(
                                                                fontSize: 3.5.w,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Meta1',
                                                                color: Color(
                                                                    0xffb4b4b4),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .join_inner,
                                                                color: Colors
                                                                    .white,
                                                                size: 19.sp,
                                                              ),
                                                              Text(
                                                                'Connect',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      3.5.w,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      'Meta1',
                                                                  color: Color(
                                                                      0xffb4b4b4),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Userprofile(
                                                              uid: alldata
                                                                  ?.allUsers?[
                                                                      index]
                                                                  .uid,
                                                            ),
                                                          ));
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50.w,
                                                      height: 6.h,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.white,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.sp)),
                                                      child: Text(
                                                        "View Profile",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Colors.white,
                                                            fontFamily: 'Meta1',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : searchuser?.allUsers?.length == 0
                                  ? Container(
                                      alignment: Alignment.center,
                                      height: 48.h,
                                      child: Text(
                                        'No User Available',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'Meta1',
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 48.h,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: searchuser?.allUsers?.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {},
                                            child: SingleChildScrollView(
                                              child: Container(
                                                height: 90.w,
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 2.w),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2.h),
                                                width: 70.w,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(5.w),
                                                        decoration: BoxDecoration(
                                                            color: Colors.black,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0))),
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          1.w),
                                                              height: 10.h,
                                                              width: 20.w,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            90),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  imageUrl: searchuser
                                                                          ?.allUsers?[
                                                                              index]
                                                                          .profilePic ??
                                                                      '',
                                                                  progressIndicatorBuilder: (context,
                                                                          url,
                                                                          progress) =>
                                                                      CircularProgressIndicator(),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/icons/user.png',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    searchuser
                                                                            ?.allUsers?[index]
                                                                            .name ??
                                                                        '',
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize: 16
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontFamily:
                                                                            'Meta1',
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.8.h,
                                                                  ),
                                                                  searchuser?.allUsers?[index]
                                                                              .clubName ==
                                                                          null
                                                                      ? Container()
                                                                      : Column(
                                                                          children: [
                                                                            Text(
                                                                              searchuser?.allUsers?[index].clubName ?? '',
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, fontFamily: 'Meta1', color: Colors.white),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 0.8.h,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                  Text(
                                                                    searchuser?.allUsers?[index].position ==
                                                                            null
                                                                        ? 'N/A'
                                                                        : searchuser?.allUsers?[index].position ??
                                                                            '',
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: TextStyle(
                                                                        fontSize: 12
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Meta1',
                                                                        color: Colors
                                                                            .white),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(5.w),
                                                        decoration:
                                                            BoxDecoration(
                                                                // color: Colors.black,
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            20.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            20.0))),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  '${searchuser?.allUsers?[index].connections ?? ''}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        6.w,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Color(
                                                                        0xffffffff),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Connections',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        3.5.w,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Color(
                                                                        0xffb4b4b4),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            InkWell(
                                                              onTap: () {},
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .join_inner,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 19.sp,
                                                                  ),
                                                                  Text(
                                                                    'Connect',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          3.5.w,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontFamily:
                                                                          'Meta1',
                                                                      color: Color(
                                                                          0xffb4b4b4),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Userprofile(
                                                                  uid: searchuser
                                                                      ?.allUsers?[
                                                                          index]
                                                                      .uid,
                                                                ),
                                                              ));
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: 50.w,
                                                          height: 6.h,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.sp)),
                                                          child: Text(
                                                            "View Profile",
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Meta1',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                          : isloading?Container():filter?.searchData?.length == 0
                              ? Container(
                                  alignment: Alignment.center,
                                  height: 48.h,
                                  child: Text(
                                    'No User Available',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: 'Meta1',
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 48.h,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: filter?.searchData?.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: SingleChildScrollView(
                                          child: Container(
                                            height: 90.w,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.h),
                                            width: 70.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(5.w),
                                                    decoration: BoxDecoration(
                                                        color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0))),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      1.w),
                                                          height: 10.h,
                                                          width: 20.w,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        90),
                                                            child:
                                                                CachedNetworkImage(
                                                              fit: BoxFit.cover,
                                                              imageUrl: filter
                                                                      ?.searchData?[
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
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                filter
                                                                        ?.searchData?[
                                                                            index]
                                                                        .name ??
                                                                    '',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                height: 0.8.h,
                                                              ),
                                                              filter?.searchData?[index]
                                                                          .clubName ==
                                                                      null
                                                                  ? Container()
                                                                  : Column(
                                                                      children: [
                                                                        Text(
                                                                          filter?.searchData?[index].clubName ??
                                                                              '',
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              fontSize: 12.sp,
                                                                              fontWeight: FontWeight.w400,
                                                                              fontFamily: 'Meta1',
                                                                              color: Colors.white),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              0.8.h,
                                                                        ),
                                                                      ],
                                                                    ),
                                                              Text(
                                                                filter?.searchData?[index].occupation ==
                                                                        null
                                                                    ? 'N/A'
                                                                    : filter?.searchData?[index]
                                                                            .occupation ??
                                                                        '',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Colors
                                                                        .white),
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.all(5.w),
                                                    decoration: BoxDecoration(
                                                        // color: Colors.black,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20.0))),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              '${filter?.searchData?[index].connections ?? ''}',
                                                              style: TextStyle(
                                                                fontSize: 6.w,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Meta1',
                                                                color: Color(
                                                                    0xffffffff),
                                                              ),
                                                            ),
                                                            Text(
                                                              'Connections',
                                                              style: TextStyle(
                                                                fontSize: 3.5.w,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontFamily:
                                                                    'Meta1',
                                                                color: Color(
                                                                    0xffb4b4b4),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .join_inner,
                                                                color: Colors
                                                                    .white,
                                                                size: 19.sp,
                                                              ),
                                                              Text(
                                                                'Connect',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      3.5.w,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      'Meta1',
                                                                  color: Color(
                                                                      0xffb4b4b4),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    Userprofile(
                                                              uid: filter
                                                                  ?.searchData?[
                                                                      index]
                                                                  .uid,
                                                            ),
                                                          ));
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50.w,
                                                      height: 6.h,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: Colors.white,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20.sp)),
                                                      child: Text(
                                                        "View Profile",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: Colors.white,
                                                            fontFamily: 'Meta1',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )

                      // old crousel

                      // selfilter == 0 ?
                      //
                      //
                      // CarouselSlider(
                      //   carouselController: _controller,
                      //   items: filter?.searchData?.map((item) {
                      //     return GestureDetector(
                      //       onTap: () {
                      //         // Navigator.of(context).push(MaterialPageRoute(
                      //         //     builder: (context) => Userprofile(udid: ,)));
                      //       },
                      //       child: SingleChildScrollView(
                      //         child: Container(
                      //           padding:
                      //           EdgeInsets.symmetric(vertical: 2.h),
                      //           width: MediaQuery.of(context).size.width,
                      //           decoration: BoxDecoration(
                      //               border: Border.all(
                      //                 color: Colors.grey,
                      //               ),
                      //               borderRadius:
                      //               BorderRadius.circular(20.0)),
                      //           child: SingleChildScrollView(
                      //             child: Column(
                      //               children: [
                      //                 Container(
                      //                   padding: EdgeInsets.all(5.w),
                      //                   decoration: BoxDecoration(
                      //                       color: Colors.black,
                      //                       borderRadius:
                      //                       BorderRadius.only(
                      //                           topLeft:
                      //                           Radius.circular(
                      //                               20.0),
                      //                           topRight:
                      //                           Radius.circular(
                      //                               20.0))),
                      //                   child: Row(
                      //                     children: [
                      //                       Container(
                      //                         margin:
                      //                         EdgeInsets.symmetric(
                      //                             horizontal: 1.w),
                      //                         height: 10.h,
                      //                         width: 20.w,
                      //                         child: ClipRRect(
                      //                           borderRadius:
                      //                           BorderRadius.circular(
                      //                               90),
                      //                           child: CachedNetworkImage(
                      //                             fit: BoxFit.cover,
                      //                             imageUrl: item
                      //                                 .profilePic
                      //                                 .toString(),
                      //                             progressIndicatorBuilder:
                      //                                 (context, url,
                      //                                 progress) =>
                      //                                 CircularProgressIndicator(),
                      //                             errorWidget: (context,
                      //                                 url, error) =>
                      //                                 Image.asset(
                      //                                   'assets/icons/user.png',
                      //                                   color: Colors.white,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       SizedBox(
                      //                         width: 5.w,
                      //                       ),
                      //                       Expanded(
                      //                         child: Column(
                      //                           crossAxisAlignment:
                      //                           CrossAxisAlignment
                      //                               .start,
                      //                           children: [
                      //                             Text(
                      //                               item.name.toString(),
                      //                               maxLines: 2,
                      //                               overflow: TextOverflow
                      //                                   .ellipsis,
                      //                               style: TextStyle(
                      //                                   fontSize: 16.sp,
                      //                                   fontWeight:
                      //                                   FontWeight
                      //                                       .bold,
                      //                                   fontFamily:
                      //                                   'Meta1',
                      //                                   color:
                      //                                   Colors.white),
                      //                             ),
                      //                             SizedBox(
                      //                               height: 0.8.h,
                      //                             ),
                      //                             item.clubName == null
                      //                                 ? Container()
                      //                                 : Column(
                      //                               children: [
                      //                                 Text(
                      //                                   item.clubName
                      //                                       .toString(),
                      //                                   maxLines: 2,
                      //                                   overflow:
                      //                                   TextOverflow
                      //                                       .ellipsis,
                      //                                   style: TextStyle(
                      //                                       fontSize: 12
                      //                                           .sp,
                      //                                       fontWeight:
                      //                                       FontWeight
                      //                                           .w400,
                      //                                       fontFamily:
                      //                                       'Meta1',
                      //                                       color: Colors
                      //                                           .white),
                      //                                 ),
                      //                                 SizedBox(
                      //                                   height:
                      //                                   0.8.h,
                      //                                 ),
                      //                               ],
                      //                             ),
                      //
                      //                           ],
                      //                         ),
                      //                       )
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 Container(
                      //                   padding: EdgeInsets.all(5.w),
                      //                   decoration: BoxDecoration(
                      //                     // color: Colors.black,
                      //                       borderRadius:
                      //                       BorderRadius.only(
                      //                           bottomLeft:
                      //                           Radius.circular(
                      //                               20.0),
                      //                           bottomRight:
                      //                           Radius.circular(
                      //                               20.0))),
                      //                   child: Row(
                      //                     crossAxisAlignment:
                      //                     CrossAxisAlignment.start,
                      //                     mainAxisAlignment:
                      //                     MainAxisAlignment
                      //                         .spaceEvenly,
                      //                     children: [
                      //                       Column(
                      //                         mainAxisAlignment:
                      //                         MainAxisAlignment
                      //                             .center,
                      //                         children: [
                      //                           Text(
                      //                             item.connections
                      //                                 .toString(),
                      //                             style: TextStyle(
                      //                               fontSize: 6.w,
                      //                               fontWeight:
                      //                               FontWeight.w500,
                      //                               fontFamily: 'Meta1',
                      //                               color:
                      //                               Color(0xffffffff),
                      //                             ),
                      //                           ),
                      //                           Text(
                      //                             'Connections',
                      //                             style: TextStyle(
                      //                               fontSize: 3.5.w,
                      //                               fontWeight:
                      //                               FontWeight.w500,
                      //                               fontFamily: 'Meta1',
                      //                               color:
                      //                               Color(0xffb4b4b4),
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       InkWell(
                      //                         onTap: () {},
                      //                         child: Column(
                      //                           mainAxisAlignment:
                      //                           MainAxisAlignment
                      //                               .center,
                      //                           children: [
                      //                             Icon(
                      //                               Icons.join_inner,
                      //                               color: Colors.white,
                      //                               size: 19.sp,
                      //                             ),
                      //                             Text(
                      //                               'Connect',
                      //                               style: TextStyle(
                      //                                 fontSize: 3.5.w,
                      //                                 fontWeight:
                      //                                 FontWeight.w500,
                      //                                 fontFamily: 'Meta1',
                      //                                 color: Color(
                      //                                     0xffb4b4b4),
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 SizedBox(
                      //                   height: 2.h,
                      //                 ),
                      //                 GestureDetector(
                      //                   onTap: () {
                      //                     Navigator.push(
                      //                         context,
                      //                         MaterialPageRoute(
                      //                           builder: (context) =>
                      //                               Userprofile(
                      //                                 uid: item.uid,
                      //                               ),
                      //                         ));
                      //                   },
                      //                   child: Container(
                      //                     alignment: Alignment.center,
                      //                     width: 50.w,
                      //                     height: 6.h,
                      //                     decoration: BoxDecoration(
                      //                         border: Border.all(
                      //                           color: Colors.white,
                      //                         ),
                      //                         borderRadius:
                      //                         BorderRadius.circular(
                      //                             20.sp)),
                      //                     child: Text(
                      //                       "View Profile",
                      //                       style: TextStyle(
                      //                           fontSize: 14.sp,
                      //                           color: Colors.white,
                      //                           fontFamily: 'Meta1',
                      //                           fontWeight:
                      //                           FontWeight.bold),
                      //                     ),
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   }).toList(),
                      //   options: CarouselOptions(
                      //     onPageChanged: (index, reason) {
                      //       setState(() {
                      //         _current = index;
                      //       });
                      //     },
                      //     height: 48.h,
                      //     enlargeCenterPage: true,
                      //     autoPlay: false,
                      //     // aspectRatio: 16 / 9,
                      //     autoPlayCurve: Curves.fastOutSlowIn,
                      //     enableInfiniteScroll: true,
                      //     autoPlayAnimationDuration:
                      //     Duration(milliseconds: 500),
                      //     viewportFraction: 0.8,
                      //   ),
                      // ),
                      ,
                      SizedBox(
                        height: 2.h,
                      ),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         "Search For?",
                      //         style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 18.sp,
                      //             fontFamily: 'Meta1',
                      //             fontWeight: FontWeight.w600),
                      //         textAlign: TextAlign.center,
                      //       ),
                      //       // TextButton(
                      //       //     onPressed: () {
                      //       //       // click();
                      //       //     },
                      //       //     child: Text(
                      //       //       "Show all",
                      //       //       style: TextStyle(
                      //       //           color: Colors.white,
                      //       //           fontSize: 12.sp,
                      //       //            fontFamily: 'Meta1',
                      //       //           fontWeight: FontWeight.w600),
                      //       //     ))
                      //     ],
                      //   ),
                      // ),

                      userData!.userData!.role == '2'
                          ? Container(
                              height: 10.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 5.w, top: 2.h),
                              decoration: BoxDecoration(
                                  // gradient: LinearGradient(
                                  //   begin: Alignment.topLeft,
                                  //   end: Alignment.bottomRight,
                                  //   colors: [
                                  //     Color(0xff514d56),
                                  //     Color(0xff252525),
                                  //   ],
                                  // )
                                  ),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectindex1 = index;
                                        });
                                        index == 0
                                            ? Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    DiscoverPage(),
                                              ))
                                            : index == 1
                                                ? Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        TrainningNotes(),
                                                  ))
                                                : index == 2
                                                    ? Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            ViewNutrition(),
                                                      ))
                                                    : Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            SleepSchedule(),
                                                      ));
                                      },
                                      child: Container(
                                        width: 22.w,
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 8.5.w,
                                                width: 22.w,
                                                alignment: Alignment.center,
                                                margin:
                                                    EdgeInsets.only(right: 5.w),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w,
                                                    vertical: 0.h),
                                                child: Image.asset(
                                                    data[index]
                                                        .image
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                    height: 9.w,
                                                    width: 8.7.w,
                                                    color:
                                                        Colors.grey.shade200)),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              margin:
                                                  EdgeInsets.only(right: 4.w),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.w,
                                                  vertical: 0.h),
                                              child: Text(
                                                data[index].name.toString(),
                                                maxLines: 4,
                                                style: TextStyle(
                                                    color: Colors.grey.shade200,
                                                    fontSize: 10.sp,
                                                    fontFamily: 'Meta1',
                                                    fontWeight:
                                                        FontWeight.normal),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          : Container(
                              height: 12.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(left: 5.w, top: 2.h),
                              decoration: BoxDecoration(),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectindex1 = index;
                                        });
                                        index == 0
                                            ? Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    DiscoverPage(),
                                              ))
                                            : index == 1
                                                ? Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        mainpage2(),
                                                  ))
                                                : index == 2
                                                    ? Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatPage(),
                                                      ))
                                                    : Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                        builder: (context) =>
                                                            PendingRequestPage(),
                                                      ));
                                      },
                                      child: Container(
                                        width: 22.w,
                                        child: Column(
                                          children: [
                                            Container(
                                                height: 9.w,
                                                width: 22.w,
                                                alignment: Alignment.center,
                                                margin:
                                                    EdgeInsets.only(right: 5.w),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 1.w,
                                                    vertical: 0.h),
                                                child: Image.asset(
                                                    data1[index]
                                                        .image
                                                        .toString(),
                                                    fit: BoxFit.fill,
                                                    height: 8.w,
                                                    width: 8.w,
                                                    color:
                                                        Colors.grey.shade200)),
                                            SizedBox(
                                              height: 0.7.h,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              margin:
                                                  EdgeInsets.only(right: 4.w),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.w,
                                                  vertical: 0.h),
                                              child: Text(
                                                data1[index].name.toString(),
                                                maxLines: 4,
                                                style: TextStyle(
                                                    color: Colors.grey.shade200,
                                                    fontSize: 10.sp,
                                                    fontFamily: 'Meta1',
                                                    fontWeight:
                                                        FontWeight.normal),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                    ],
                  ),
                ),
              ),
      ),
      isLoading: isloading,
    );
  }

  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: 'Meta1');
  TextStyle textStyle1 =
      TextStyle(color: Colors.white, fontSize: 13.sp, fontFamily: 'Meta1');

  Widget searchBox() {
    return Container(
      width: 60.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.20),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {
          searchapi();
        },
        style: TextStyle(color: Colors.white, fontFamily: 'Meta1'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white, fontFamily: 'Meta1'),
        ),
      ),
    );
  }

  searchapi() {
    final Map<String, String> data = {};
    data['action'] = 'search_users_app';
    data['uid'] = userData!.userData!.uid.toString();
    data['search_keyword'] = _search.text.trim().toString();
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().searchuserapi(data).then((Response response) async {
          searchuser = searchUsersModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              searchtodotraining?.status == "success") {
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {
              isloading = false;
            });
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

  playerapi() {
    final Map<String, String> data = {};
    data['action'] = 'all_users_app';
    data['uid'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().allplayersapi(data).then((Response response) async {
          alldata = AllplayersModal.fromJson(json.decode(response.body));
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

  profile() {
    final Map<String, String> data = {};
    data['action'] = 'view_profile_details';
    data['uid'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().profileapi(data).then((Response response) async {
          profiledata = ProfileModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && userData?.status == "success") {
            print('======================' +
                profiledata!.viewProfileDetails!.about!);
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
            print(userData!.userData!.uid);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {
              isloading = false;
            });
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

  clubsapi() {
    print('Clubs');

    final Map<String, String> data = {};
    // data['email'] = _email.text.trim().toString();
    // data['password'] = _pass.text.trim().toString();
    data['action'] = 'all_clubs_for_signup';

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().clubsnameapi(data).then((Response response) async {
          cludid = Clubidmodal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && cludid?.status == "success") {
            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      }
    });
  }

  filterapi() {
    final Map<String, String> data = {};
    data['action'] = 'searchFilterApp';
    data['uid'] = userData!.userData!.uid.toString();
    data['type'] = selfilter == 1
        ? 'age'
        : selfilter == 2
            ? 'occupation'
            : 'club';
    data['search_val'] = selfilter == 1
        ? (agesel == 0
            ? '18'
            : agesel == 1
                ? '19'
                : agesel == 2
                    ? '23'
                    : agesel == 3
                        ? '28'
                        : agesel == 4
                            ? '36'
                            : '40')
        : selfilter == 2
            ? (selRole == 0)
                ? "3"
                : (selRole == 1)
                    ? "5"
                    : (selRole == 2)
                        ? "6"
                        : (selRole == 3)
                            ? "7"
                            : (selRole == 4)
                                ? "8"
                                : (selRole == 5)
                                    ? "9"
                                    : "2"
            : cludid?.allClubsFetch?[selClub].uid ?? '';

    checkInternet().then((internet) async {

      if (internet) {
        authprovider().filterapi(data).then((Response response) async {
          setState(() {
            isloading = true;
          });
          filter = Filtermodal.fromJson(json.decode(response.body));
          print(response.statusCode);
          if (response.statusCode == 200 && filter?.status == "success") {

            Navigator.pop(context);

            print(userData?.status);
            setState(() {
              isloading= false;
            });
          } else {
            setState(() {
            isloading = false;
            });
          }
        });
      }
    });
  }
// click() {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         titlePadding: EdgeInsets.only(bottom: 0.h),
//         // insetPadding: EdgeInsets.zero,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10.0))),
//         title: Container(
//           padding: EdgeInsets.only(left: 3.w, right: 0.w),
//           decoration: BoxDecoration(
//               color: Colors.black,
//               // color: Color(0xffb4776e6),
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(10.0),
//                   topLeft: Radius.circular(10.0))),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Search For?",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                      fontFamily: 'Meta1'),
//               ),
//               IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   icon: Icon(
//                     Icons.close,
//                     color: Colors.white,
//                   ))
//             ],
//           ),
//         ),
//         contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
//         content: Container(
//           color: Colors.grey.shade800,
//           padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
//           // height: 38.h,
//           child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   mainAxisSpacing: 2.w,
//                   crossAxisSpacing: 2.w,
//                   crossAxisCount: 3,
//                   childAspectRatio: 3 / 4),
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemCount: data.length,
//               physics: ScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Container(
//                   padding: EdgeInsets.all(2.w),
//                   width: MediaQuery.of(context).size.width,
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 12.w,
//                         width: 12.w,
//                         child: Image.asset(
//                           data[index].image.toString(),
//                           color: Colors.white,
//                         ),
//                       ),
//                       // CircleAvatar(
//                       //   backgroundColor: Colors.transparent,
//                       //     radius: 5.w,
//                       //     backgroundImage: AssetImage(
//                       //       data[index].image.toString(),
//                       //     )),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       Text(
//                         data[index].name.toString(),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                             fontSize: 10.sp,
//                             fontWeight: FontWeight.bold,
//                              fontFamily: 'Meta1',
//                             color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//         ),
//       );
//     },
//   );
// }
}

// ============================== Bottom NavigationBar incase if need ===================

// bottomNavigationBar: Stack(children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.w),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(30),
//               child: BottomAppBar(
//                 color: Colors.black,
//                 shape: CircularNotchedRectangle(), //shape of notch
//                 notchMargin:
//                     20, //notche margin between floating button and bottom appbar
//                 child: SizedBox(
//                   height: 7.h,
//                   child: Row(
//                     //children inside bottom appbar
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       SizedBox(
//                         width: 1.h,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.home,
//                           color: Colors.white,
//                           size: 3.h,
//                         ),
//                         onPressed: () {},
//                       ),
//                       SizedBox(
//                         width: 2.h,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.chat_outlined,
//                           color: Colors.white,
//                           size: 3.h,
//                         ),
//                         onPressed: () {},
//                       ),
//                       SizedBox(
//                         width: 3.h,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.person,
//                           color: Colors.white,
//                           size: 3.5.h,
//                         ),
//                         onPressed: () {},
//                       ),
//                       SizedBox(
//                         width: 1.h,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ]),
