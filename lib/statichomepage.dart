import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/pendingReqestsPage.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:pedrodap/screens/profile/Chatpage.dart';
import 'package:pedrodap/screens/profile/DiscoverPage.dart';
import 'package:pedrodap/screens/profile/Nutri.dart';
import 'package:pedrodap/screens/profile/SleepSchedule.dart';
import 'package:pedrodap/screens/profile/healthreportScreen.dart';
import 'package:pedrodap/screens/profile/mainpage2.dart';
import 'package:pedrodap/screens/profile/myconnections.dart';
import 'package:pedrodap/screens/profile/myprofile.dart';
import 'package:pedrodap/screens/profile/trainningnotes.dart';
import 'package:pedrodap/screens/profile/viewnutrition.dart';
import 'package:sizer/sizer.dart';

import 'Model/connectedModal.dart';
import 'Model/profileModal.dart';
import 'Widget/buildErrorDialog.dart';
import 'Widget/const.dart';
import 'Widget/sharedpreferance.dart';

class StaticHomePage extends StatefulWidget {
  const StaticHomePage({super.key});

  @override
  State<StaticHomePage> createState() => _StaticHomePageState();
}

class Sachen {
  String? image;
  String? name;

  Sachen(this.image, this.name);
}

class _StaticHomePageState extends State<StaticHomePage> {
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
  int selectindex1 = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isloading = true;
  Timer? _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
    //
    //
    //   connectionsapi();
    //   playerapi();
    // });
    connectionsapi();
    playerapi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isloading,
      scaffold: Scaffold(
        key: _scaffoldKey,
        drawer: const drawer(),
        backgroundColor: Colors.black,
        body: isloading
            ? Container()
            : SingleChildScrollView(
                child: Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70.w,
                            child: Text(
                              'Hello ' + userData!.userData!.name.toString(),
                              maxLines: 2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Meta1',
                                  fontSize: 24.sp),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu_rounded,
                                size: 22.sp,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Age',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Meta',
                                    fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Text(
                                profiledata?.viewProfileDetails?.age == null
                                    ? 'N/A'
                                    : profiledata?.viewProfileDetails?.age ??
                                        '' + ' yrs old',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Meta',
                                    fontSize: 13.sp),
                              ),
                            ],
                          ),
                          userData!.userData!.role == '2'
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Container(
                                      height: 4.h,
                                      width: 0.2.w,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Club',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: 'Meta',
                                              fontSize: 11.sp),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Text(
                                          userData!.userData!.clubName == null
                                              ? 'N/A'
                                              : userData!.userData!.clubName
                                                  .toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Meta',
                                              fontSize: 13.sp),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyProfile(),
                              )),
                              child: Image.asset(
                                'assets/human1.png',
                                height: 65.h,
                                width: MediaQuery.of(context).size.width,
                              ),
                            ),
                            Positioned(
                              top: 5.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => MyConnections(),
                                      ));
                                    },
                                    child: Text(
                                      'Connections',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Meta',
                                          fontSize: 11.sp),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    (connections?.totalConnectedUser)
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Meta',
                                        fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 22.w,
                                        color: Colors.grey,
                                        height: 0.2.h,
                                      ),
                                      Container(
                                        transform: new Matrix4.identity()
                                          ..rotateZ(30 * 3.1415927 / 180),
                                        width: 14.w,
                                        color: Colors.grey,
                                        height: 0.2.h,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                              top: 16.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => ChatPage(),
                                      ));
                                    },
                                    child: Text(
                                      'Messages',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'Meta',
                                          fontSize: 11.sp),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    (profiledata
                                            ?.viewProfileDetails?.messagesCount)
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Meta',
                                        fontSize: 12.sp),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 16.5.w,
                                        color: Colors.grey,
                                        height: 0.2.h,
                                      ),
                                      Container(
                                        transform: Matrix4.identity()
                                          ..rotateZ(30 * 3.1415927 / 180),
                                        width: 14.w,
                                        color: Colors.grey,
                                        height: 0.2.h,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      userData!.userData!.role == '2'
                          ? Container(
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
                                                height: 9.w,
                                                width: 22.w,
                                                alignment: Alignment.center,
                                                margin:
                                                    EdgeInsets.only(right: 5.w),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 1.w,
                                                    vertical: 0.h),
                                                child: Image.asset(
                                                    data[index]
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
                )),
              ),
      ),
    );
  }

  connectionsapi() {
    final Map<String, String> data = {};
    data['action'] = 'connected_users';
    data['uid'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().Connectionsapi(data).then((Response response) async {
          connections = ConnectedModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && connections?.status == "success") {
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

  playerapi() {
    final Map<String, String> data = {};
    data['action'] = 'view_profile_details';
    data['uid'] = userData?.userData?.uid ?? '';

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().profileapi(data).then((Response response) async {
          profiledata = ProfileModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && userData?.status == "success") {
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
            print(userData?.userData?.uid);

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
}
