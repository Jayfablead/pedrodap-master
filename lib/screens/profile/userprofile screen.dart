import 'dart:convert';

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
import 'package:pedrodap/screens/profile/reqestPage.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';
import '../../Widget/const.dart';

class Userprofile extends StatefulWidget {
  String? udid;
  Userprofile({Key? key, this.udid}) : super(key: key);

  @override
  State<Userprofile> createState() => _UserprofileState();
}

List img = [
  'assets/psg.png',
  'assets/france.png',
  'assets/rmd.png',
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
  'France Fc',
  'Real Madrid Fc',
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
    singleplayerapi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      scaffold: Scaffold(
        drawer: drawer(),
        key: _scaffoldKey,
        backgroundColor: Color(0xff131313),
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
                            CircleAvatar(
                              backgroundColor: Colors.cyanAccent,
                              radius: 6.1.h,
                              child: CircleAvatar(
                                backgroundColor: Color(0xff131313),
                                radius: 5.7.h,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/prof.jpg',
                                  ),
                                  radius: 5.5.h,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '28',
                                  style: TextStyle(
                                    fontSize: 6.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  'Posts',
                                  style: TextStyle(
                                    fontSize: 3.5.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Color(0xffb4b4b4),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '69',
                                  style: TextStyle(
                                    fontSize: 6.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  'Following',
                                  style: TextStyle(
                                    fontSize: 3.5.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Color(0xffb4b4b4),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2.3B',
                                  style: TextStyle(
                                    fontSize: 6.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  'Followers',
                                  style: TextStyle(
                                    fontSize: 3.5.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Color(0xffb4b4b4),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 0.7.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              fetchplayermodal!.players!.name.toString(),
                              style: TextStyle(
                                fontSize: 6.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xffffffff),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 4.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Colors.cyanAccent,
                                  ),
                                ),
                                Text(
                                  'Teams',
                                  style: TextStyle(
                                    fontSize: 3.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Color(0xffb4b4b4),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 2.h),
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
                                    border:
                                        Border.all(color: Colors.cyanAccent)),
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
                                        fontFamily: "Poppins",
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
                                    builder: (context) => Helathreport(),
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
                                    border:
                                        Border.all(color: Colors.cyanAccent)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      size: 9.w,
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Health',
                                      style: TextStyle(
                                        fontSize: 4.w,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        color: Color(0xffeaeaea),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MessagePage(
                                      name: 'Kylin Mbappe',
                                      photo: 'assets/prof.jpg',
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
                                    border:
                                        Border.all(color: Colors.cyanAccent)),
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
                                        fontFamily: "Poppins",
                                        color: Color(0xffeaeaea),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // InkWell(
                            //   onTap: () {},
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     height: 6.h,
                            //     width: 34.w,
                            //     decoration: BoxDecoration(
                            //       color: Colors.grey.withOpacity(0.05),
                            //       borderRadius: BorderRadius.circular(30),
                            //       border: Border.all(
                            //         color: Color(0xff0DF5E3),
                            //       ),
                            //     ),
                            //     child: Text(
                            //       'Connect',
                            //       style: TextStyle(
                            //         fontSize: 4.w,
                            //         fontWeight: FontWeight.w500,
                            //         fontFamily: "Poppins",
                            //         color: Color(0xffeaeaea),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.of(context).push(
                            //       MaterialPageRoute(
                            //         builder: (context) => ChatPage(),
                            //       ),
                            //     );
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     height: 6.h,
                            //     width: 30.w,
                            //     decoration: BoxDecoration(
                            //       color: Colors.grey.withOpacity(0.05),
                            //       borderRadius: BorderRadius.circular(30),
                            //       border: Border.all(
                            //         color: Color(0xff0DF5E3),
                            //       ),
                            //     ),
                            //     child: Text(
                            //       'Message',
                            //       style: TextStyle(
                            //         fontSize: 4.w,
                            //         fontWeight: FontWeight.w500,
                            //         fontFamily: "Poppins",
                            //         color: Color(0xffeaeaea),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // InkWell(
                            //   onTap: () {
                            //     Navigator.of(context).push(
                            //       MaterialPageRoute(
                            //         builder: (context) => Helathreport(),
                            //       ),
                            //     );
                            //   },
                            //   child: Container(
                            //     alignment: Alignment.center,
                            //     height: 6.h,
                            //     width: 27.w,
                            //     decoration: BoxDecoration(
                            //       color: Colors.grey.withOpacity(0.05),
                            //       borderRadius: BorderRadius.circular(30),
                            //       border: Border.all(
                            //         color: Color(0xff0DF5E3),
                            //       ),
                            //     ),
                            //     child: Text(
                            //       'Health',
                            //       style: TextStyle(
                            //         fontSize: 4.w,
                            //         fontWeight: FontWeight.w500,
                            //         fontFamily: "Poppins",
                            //         color: Color(0xffeaeaea),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          fetchplayermodal!.players!.email.toString(),
                          style: TextStyle(
                            fontSize: 4.5.w,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: Colors.cyanAccent,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Divider(
                          color: Colors.white54,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Joined Clubs',
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xffc7c6c6),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Color(0xff0DF5E3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Container(
                          height: 24.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: img.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 1.w, right: 2.w),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 39.4.w,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          color:
                                              Colors.white.withOpacity(0.15)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        child: Image.asset(
                                          img[index],
                                          height: 18.h,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        color: Color(0xff514d56),
                                      ),
                                      alignment: Alignment.center,
                                      height: 6.h,
                                      width: 39.4.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            fetchplayermodal!.players!.clubName
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.sp,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Personal Details',
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xffc7c6c6),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Color(0xff0DF5E3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1.h),
                        Container(
                          height: 25.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: pdi.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(left: 1.w, right: 2.w),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Image.asset(pdi[index],
                                          height: 19.h,
                                          width: 39.4.w,
                                          fit: BoxFit.cover),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                        ),
                                        color: Color(0xff514d56),
                                      ),
                                      alignment: Alignment.center,
                                      height: 6.h,
                                      width: 39.4.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            pdn[index],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.sp,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "(${pdd[index]})",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 11.sp,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Game Actions',
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xffc7c6c6),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Color(0xff0DF5E3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          height: 24.5.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
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
                                fontFamily: "Poppins",
                                color: Color(0xffc7c6c6),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Color(0xff0DF5E3),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 1.h),
                          height: 24.5.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
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
              ),
      ),
      isLoading: isloading,
    );
  }

  singleplayerapi() {
    final Map<String, String> data = {};
    data['action'] = 'players_view_details_app';
    data['uid'] = widget.udid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().fetchplayersApi(data).then((Response response) async {
          fetchplayermodal =
              Fetchplayermodal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && userData?.status == "success") {
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);

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
