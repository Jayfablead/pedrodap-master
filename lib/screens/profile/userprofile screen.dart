import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/fetchplayermodal.dart';
import 'package:pedrodap/Widget/buildErrorDialog.dart';
import 'package:pedrodap/Widget/sharedpreferance.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:pedrodap/screens/profile/Chatpage.dart';
import 'package:pedrodap/screens/profile/healthreportScreen.dart';
import 'package:pedrodap/screens/profile/messagePage.dart';
import 'package:pedrodap/screens/profile/DiscoverPage.dart';
import 'package:sizer/sizer.dart';

import '../../Model/userprofileModal.dart';
import '../../Widget/Drawer.dart';
import '../../Widget/const.dart';

class Userprofile extends StatefulWidget {
  String? uid;

  Userprofile({Key? key, this.uid}) : super(key: key);

  @override
  State<Userprofile> createState() => _UserprofileState();
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

class _UserprofileState extends State<Userprofile> {
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
                                  Navigator.of(context).pop(context);
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
                                    imageUrl: userprofile!
                                        .userProfileDetails!.profilePic
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
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 60.w,
                                    child: Text(
                                      userprofile!.userProfileDetails!.name
                                          .toString(),
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
                                              '18',
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
                                              '18',
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
                            userprofile!.userProfileDetails!.email.toString(),
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
                                onTap: () {},
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
                                        Icons.join_inner,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        'Connect',
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
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MessagePage(
                                        image: userprofile!
                                            .userProfileDetails!.profilePic
                                            .toString(),
                                        name: userprofile!
                                            .userProfileDetails!.name
                                            .toString(),
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
                                        Icons.chat_outlined,
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
                            height: 0.5.h,
                          ),
                          userprofile!.userProfileDetails!.role == '2'
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
                                                      imageUrl: userprofile!
                                                          .userProfileDetails!
                                                          .currentClubImage
                                                          .toString(),
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
                                                          userprofile!
                                                              .userProfileDetails!
                                                              .clubName
                                                              .toString(),
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
                                    SizedBox(height: 1.h),
                                    Divider(
                                      color: Colors.white54,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Previous Club',
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
                                        itemCount: img1.length,
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
                                                      imageUrl: userprofile!
                                                          .userProfileDetails!
                                                          .previousClubImage
                                                          .toString(),
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
                                                          userprofile!.userProfileDetails!
                                                                      .previousClub ==
                                                                  null
                                                              ? 'N/A'
                                                              : userprofile!
                                                                  .userProfileDetails!
                                                                  .previousClub
                                                                  .toString(),
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
                                    SizedBox(height: 1.h),
                                  ],
                                )
                              : Container(),
                          Divider(
                            color: Colors.white54,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              userprofile!.userProfileDetails!.about == null
                                  ? 'N/A'
                                  : userprofile!.userProfileDetails!.about
                                      .toString(),
                              style: textStyle,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          Divider(
                            color: Colors.white54,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Game Actions',
                                style: TextStyle(
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Meta1',
                                  color: Color(0xffc7c6c6),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 1.h),
                            height: 29.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset('assets/ney1.jpg'));
                                },
                                itemCount: 1),
                          ),
                          SizedBox(height: 1.h),
                          Divider(
                            color: Colors.white54,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Highlights',
                                style: TextStyle(
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Meta1',
                                  color: Color(0xffc7c6c6),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 1.h),
                            height: 29.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset('assets/ney2.jpg'));
                                },
                                itemCount: 1),
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
}
