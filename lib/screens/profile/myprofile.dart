import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pedrodap/Model/UserModal.dart';
import 'package:pedrodap/Model/profileModal.dart';
import 'package:pedrodap/Widget/buildErrorDialog.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/Widget/sharedpreferance.dart';
import 'package:pedrodap/Widget/videoprof.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/screens/profile/updateprofile.dart';
import 'package:pedrodap/screens/profile/userprofile%20screen.dart';
import 'package:pedrodap/video.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../../Model/connectedModal.dart';
import '../../Widget/Drawer.dart';
import '../../provider/authprovider.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

List img = [
  "assets/ney.jpg",
  "assets/ney2.jpg",
  "assets/ney3.webp",
  "assets/ney1.jpg",
  "assets/ney.jpg"
];
TextEditingController _about = TextEditingController();
TextEditingController _CurrTeam = TextEditingController();
TextEditingController _prevclub = TextEditingController();
TextEditingController _exp = TextEditingController();
TextEditingController _position = TextEditingController();
bool isloading = true;
late VideoPlayerController _controller;
bool isPlay = false;

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isloading = true;
    connectionsapi();
    playerapi();
  }

  bool isloading = true;

  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isloading,
      scaffold: Scaffold(
        drawer: drawer(),
        key: _scaffoldKey,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: isloading
            ? Container()
            : WillPopScope(
                onWillPop: dialog,
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w, right: 4.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Profile',
                                style: TextStyle(
                                  fontSize: 5.w,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Meta1",
                                  color: Color(0xffeaeaea),
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
                          SizedBox(height: 3.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                height: 12.h,
                                width: 25.w,
                                padding: EdgeInsets.all(1.w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(90),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: profiledata
                                            ?.viewProfileDetails?.profilePic ??
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
                              // CircleAvatar(
                              //   backgroundColor: Colors.white,
                              //   radius: 6.1.h,
                              //   child: CircleAvatar(
                              //     backgroundColor: Color(0xff131313),
                              //     radius: 5.7.h,
                              //     child: CircleAvatar(
                              //       backgroundColor: Colors.transparent,
                              //       backgroundImage: NetworkImage(
                              //         profiledata!.viewProfileDetails!.profilePic
                              //            ?? '',
                              //       ),
                              //       radius: 7.h,
                              //     ),
                              //   ),
                              // ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 50.w,
                                    child: Text(
                                      profiledata?.viewProfileDetails?.name ==
                                              null
                                          ? 'N/A'
                                          : profiledata
                                                  ?.viewProfileDetails?.name ??
                                              '',
                                      style: TextStyle(
                                        fontSize: 6.w,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Meta1",
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.w,
                                  ),
                                  Container(
                                    width: 62.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              (connections?.totalConnectedUser)
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 6.w,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Meta1",
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                            Text(
                                              'Connections',
                                              style: TextStyle(
                                                fontSize: 3.5.w,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Meta1",
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
                                              profiledata?.viewProfileDetails
                                                          ?.age ==
                                                      null
                                                  ? 'N/A'
                                                  : profiledata
                                                          ?.viewProfileDetails
                                                          ?.age ??
                                                      '',
                                              style: TextStyle(
                                                fontSize: 6.w,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Meta1",
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                            Text(
                                              'Age',
                                              style: TextStyle(
                                                fontSize: 3.5.w,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Meta1",
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
                            height: 3.w,
                          ),
                          Text(
                            profiledata?.viewProfileDetails?.email == null
                                ? 'N/A'
                                : profiledata?.viewProfileDetails?.email ?? '',
                            style: TextStyle(
                              fontSize: 4.5.w,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Meta1",
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Center(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(
                                        builder: (context) => EditProfile(
                                            about: profiledata!.viewProfileDetails!.about ??
                                                '',
                                            email: profiledata!.viewProfileDetails!.email ??
                                                '',
                                            name: profiledata!.viewProfileDetails!.name ??
                                                '',
                                            exp: profiledata!
                                                    .viewProfileDetails!
                                                    .experience ??
                                                '',
                                            age: profiledata!.viewProfileDetails!.age ??
                                                '',
                                            pos: profiledata!
                                                    .viewProfileDetails!
                                                    .position ??
                                                '',
                                            profile: profiledata!
                                                    .viewProfileDetails!
                                                    .profilePic ??
                                                '',
                                            videos: profiledata?.viewProfileDetails?.video == '' ||
                                                    profiledata?.viewProfileDetails?.video == null
                                                ? null
                                                : profiledata?.viewProfileDetails?.video),
                                      ),
                                    );
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        'Edit Profile',
                                        style: textStyle,
                                      )))),
                          SizedBox(height: 1.h),

                          Divider(
                            color: Color(0xff7a7a7a),
                          ),
                          SizedBox(height: 0.2.h),
                          userData!.userData!.role == '2'
                              ? Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.sports_baseball_outlined,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          "Current Club : ",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Meta1",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp),
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        SizedBox(width: 40.w,
                                          child: Text(
                                            profiledata?.viewProfileDetails
                                                        ?.currentClub ==
                                                    null
                                                ? 'N/A'
                                                : profiledata?.viewProfileDetails
                                                        ?.currentClub ??
                                                    '',
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Meta1",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.sports_baseball_outlined,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          "Previous Club : ",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Meta1",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13.sp),
                                        ),
                                        SizedBox(
                                          width: 4.w,
                                        ),
                                        SizedBox(width: 40.w,
                                          child: Text(
                                            profiledata?.viewProfileDetails
                                                        ?.previousClub ==
                                                    null
                                                ? 'N/A'
                                                : profiledata?.viewProfileDetails
                                                        ?.previousClub ??
                                                    '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Meta1",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                )
                              : Container(),

                          Row(
                            children: [
                              Icon(
                                Icons.person_outline,
                                color: Colors.white,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                "Experince : ",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Meta1",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp),
                              ),
                              SizedBox(
                                width: 12.3.w,
                              ),
                              Text(
                                profiledata?.viewProfileDetails?.experience ==
                                        null
                                    ? 'N/A'
                                    : profiledata
                                            ?.viewProfileDetails?.experience ??
                                        '',
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
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.personal_injury_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                userData?.userData?.role == '2'
                                    ? "Position : "
                                    : "Ocupation :",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Meta1",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp),
                              ),
                              SizedBox(
                                width: 17.w,
                              ),
                              Text(
                                profiledata?.viewProfileDetails?.position ==
                                        null
                                    ? 'N/A'
                                    : profiledata
                                            ?.viewProfileDetails?.position ??
                                        '',
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
                            height: 3.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.info_outline_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 2.w),
                                  Text(
                                    "My Bio : ",
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
                                height: 0.5.h,
                              ),
                              Divider(
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child:
                                    profiledata?.viewProfileDetails?.about == ''
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                top: 2.h, bottom: 2.h),
                                            child: Text(
                                              'N/A',
                                              style: textStyle,
                                            ),
                                          )
                                        : Padding(
                                            padding: EdgeInsets.only(
                                                top: 2.h, bottom: 2.h),
                                            child: Text(
                                              profiledata?.viewProfileDetails
                                                      ?.about ??
                                                  '',
                                              style: textStyle,
                                            ),
                                          ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 2.w),
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
                                child: profiledata?.viewProfileDetails?.images
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
                                        itemCount: profiledata
                                            ?.viewProfileDetails
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
                                                imageUrl: profiledata
                                                        ?.viewProfileDetails
                                                        ?.images?[index] ??
                                                    '',
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        Container(height: 5.h,width: 10.w,
                                                          child: CircularProgressIndicator(
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

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.video_camera_back_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 2.w),
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
                                      child: profiledata?.viewProfileDetails
                                                      ?.video ==
                                                  '' ||
                                              profiledata?.viewProfileDetails
                                                      ?.video ==
                                                  null
                                          ? Center(
                                              child: Text(
                                                'No Video Available',
                                                style: textStyle,
                                              ),
                                            )
                                          : profplayer(
                                              video: profiledata
                                                  ?.viewProfileDetails?.video,
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
                ),
              ),
      ),
    );
  }

  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: "Meta1");

  TextStyle textStyle1 =
      TextStyle(color: Colors.grey, fontSize: 12.sp, fontFamily: "Meta1");

  void loadvideo() {
    setState(() {});
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
              _about.text = profiledata?.viewProfileDetails?.about ?? '';
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

  Future<bool> dialog() async {
    back();
    return await false;
  }

  void back() {
    Navigator.of(context).pop();
  }
}

//======================================== crousals for follower ==============================================

// Column(
//   children: [
//     CircleAvatar(
//       backgroundImage: NetworkImage(
//         'https://icdn.football-espana.net/wp-content/uploads/2022/06/Neymar-Junior2.jpeg',
//       ),
//       radius: 7.h,
//     ),
//     SizedBox(height: 2.h),
//     Text(
//       'Neymar JR.',
//       style: TextStyle(
//         fontSize: 8.w,
//         fontWeight: FontWeight.w600,
//         fontFamily: "Meta1",
//         color: Color(0xffeaeaea),
//       ),
//     ),
//     SizedBox(height: 1.h),
//     Text(
//       'neymar.jr@gmail.com',
//       style: TextStyle(
//         fontSize: 4.w,
//         fontWeight: FontWeight.w600,
//         fontFamily: "Meta1",
//         color: Color(0xff0DF5E3),
//       ),
//     ),
//     SizedBox(height: 2.h),
//     Container(
//         alignment: Alignment.center,
//         height: 10.h,
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(0.15),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '28',
//                   style: TextStyle(
//                     fontSize: 7.w,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "Meta1",
//                     color: Color(0xffffffff),
//                   ),
//                 ),
//                 Text(
//                   'Posts',
//                   style: TextStyle(
//                     fontSize: 3.5.w,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "Meta1",
//                     color: Color(0xffb4b4b4),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '69',
//                   style: TextStyle(
//                     fontSize: 7.w,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "Meta1",
//                     color: Color(0xffffffff),
//                   ),
//                 ),
//                 Text(
//                   'Following',
//                   style: TextStyle(
//                     fontSize: 3.5.w,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "Meta1",
//                     color: Color(0xffb4b4b4),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   '1.5B',
//                   style: TextStyle(
//                     fontSize: 7.w,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "Meta1",
//                     color: Color(0xffffffff),
//                   ),
//                 ),
//                 Text(
//                   'Followers',
//                   style: TextStyle(
//                     fontSize: 3.5.w,
//                     fontWeight: FontWeight.w500,
//                     fontFamily: "Meta1",
//                     color: Color(0xffb4b4b4),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         )),
//   ],
// ),
// SizedBox(height: 2.h),
// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceAround,
//   children: [
//     InkWell(
//       onTap: () {},
//       child: Container(
//         alignment: Alignment.center,
//         height: 9.h,
//         width: 35.w,
//         decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.10),
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(color: Colors.white)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               size: 9.w,
//               Icons.person_outline_rounded,
//               color: Colors.white,
//             ),
//             Text(
//               'View Profile',
//               style: TextStyle(
//                 fontSize: 4.w,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: "Meta1",
//                 color: Color(0xffeaeaea),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//     InkWell(
//       onTap: () {},
//       child: Container(
//         alignment: Alignment.center,
//         height: 9.h,
//         width: 35.w,
//         decoration: BoxDecoration(
//             color: Colors.white.withOpacity(0.10),
//             borderRadius: BorderRadius.circular(15),
//             border: Border.all(color: Colors.white)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               size: 7.w,
//               Icons.mode_edit_outline_outlined,
//               color: Colors.white,
//             ),
//             SizedBox(
//               height: 0.5.h,
//             ),
//             Text(
//               'Edit',
//               style: TextStyle(
//                 fontSize: 4.w,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: "Meta1",
//                 color: Color(0xffeaeaea),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//     // InkWell(
//     //   onTap: () {},
//     //   child: Container(
//     //     alignment: Alignment.center,
//     //     height: 6.h,
//     //     width: 34.w,
//     //     decoration: BoxDecoration(
//     //       color: Colors.grey.withOpacity(0.05),
//     //       borderRadius: BorderRadius.circular(30),
//     //       border: Border.all(
//     //         color: Color(0xff0DF5E3),
//     //       ),
//     //     ),
//     //     child: Text(
//     //       'Connect',
//     //       style: TextStyle(
//     //         fontSize: 4.w,
//     //         fontWeight: FontWeight.w500,
//     //         fontFamily: "Meta1",
//     //         color: Color(0xffeaeaea),
//     //       ),
//     //     ),
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: () {
//     //     Navigator.of(context).push(
//     //       MaterialPageRoute(
//     //         builder: (context) => ChatPage(),
//     //       ),
//     //     );
//     //   },
//     //   child: Container(
//     //     alignment: Alignment.center,
//     //     height: 6.h,
//     //     width: 30.w,
//     //     decoration: BoxDecoration(
//     //       color: Colors.grey.withOpacity(0.05),
//     //       borderRadius: BorderRadius.circular(30),
//     //       border: Border.all(
//     //         color: Color(0xff0DF5E3),
//     //       ),
//     //     ),
//     //     child: Text(
//     //       'Message',
//     //       style: TextStyle(
//     //         fontSize: 4.w,
//     //         fontWeight: FontWeight.w500,
//     //         fontFamily: "Meta1",
//     //         color: Color(0xffeaeaea),
//     //       ),
//     //     ),
//     //   ),
//     // ),
//     // InkWell(
//     //   onTap: () {
//     //     Navigator.of(context).push(
//     //       MaterialPageRoute(
//     //         builder: (context) => Helathreport(),
//     //       ),
//     //     );
//     //   },
//     //   child: Container(
//     //     alignment: Alignment.center,
//     //     height: 6.h,
//     //     width: 27.w,
//     //     decoration: BoxDecoration(
//     //       color: Colors.grey.withOpacity(0.05),
//     //       borderRadius: BorderRadius.circular(30),
//     //       border: Border.all(
//     //         color: Color(0xff0DF5E3),
//     //       ),
//     //     ),
//     //     child: Text(
//     //       'Health',
//     //       style: TextStyle(
//     //         fontSize: 4.w,
//     //         fontWeight: FontWeight.w500,
//     //         fontFamily: "Meta1",
//     //         color: Color(0xffeaeaea),
//     //       ),
//     //     ),
//     //   ),
//     // ),
//   ],
// ),
