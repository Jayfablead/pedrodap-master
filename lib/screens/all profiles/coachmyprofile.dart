import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedrodap/screens/all%20profiles/coachprofile.dart';
import 'package:pedrodap/screens/feedback/feedbackListings.dart';
import 'package:pedrodap/screens/feedback/myCoachingfeedback.dart';
import 'package:pedrodap/screens/feedback/viewcoachfeedback.dart';
import 'package:pedrodap/screens/personalprofiles/coach.dart';
import 'package:pedrodap/screens/profile/myconnections.dart';
import 'package:pedrodap/screens/profile/userprofile%20screen.dart';
import 'package:pedrodap/screens/sessions/allcoaching.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';

class MyCoachProfile extends StatefulWidget {
  const MyCoachProfile({Key? key}) : super(key: key);

  @override
  State<MyCoachProfile> createState() => _MyCoachProfileState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

List img = [
  "assets/ney.jpg",
  "assets/ney2.jpg",
  "assets/ney3.webp",
  "assets/ney1.jpg",
  "assets/ney.jpg"
];

class _MyCoachProfileState extends State<MyCoachProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        key: _scaffoldKey,
        backgroundColor: Color(0xff131313),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: Column(
                children: [
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
                        'Coach Profile',
                        style: TextStyle(
                          fontSize: 5.w,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
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
                      CircleAvatar(
                        backgroundColor: Colors.cyanAccent,
                        radius: 6.1.h,
                        child: CircleAvatar(
                          backgroundColor: Color(0xff131313),
                          radius: 5.7.h,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/coach1.jpg'),
                            radius: 7.h,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50.w,
                            child: Text(
                              'Coach',
                              style: TextStyle(
                                fontSize: 6.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
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
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.w,
                  ),
                  Text(
                    'coach.team@gmail.com',
                    style: TextStyle(
                      fontSize: 4.5.w,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Colors.cyanAccent,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Divider(
                    color: Color(0xff7a7a7a),
                  ),
                  SizedBox(height: 0.2.h),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Color(0xff262626),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            title: Column(
                              children: [
                                Text(
                                  'My Current Team',
                                  style: TextStyle(
                                    fontSize: 4.5.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Colors.cyanAccent,
                                  ),
                                ),
                                Divider(color: Colors.white70,)
                              ],
                            ),
                            content: SizedBox(
                                height: 23.h,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/psg.png'),
                                      radius: 7.h,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      'PSG',
                                      style: TextStyle(
                                        fontSize: 4.5.w,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        color: Colors.white,
                                      ),
                                    ),SizedBox(
                                      height: 1.h,
                                    ),
                                    Text(
                                      '(Paris Saint German)',
                                      style: TextStyle(
                                        fontSize: 4.5.w,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Poppins",
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 8.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(
                              Icons.people_alt_outlined,
                              color: Colors.white,
                              size: 8.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'My Current Team',
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xffffffff),
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyConnections(),
                        ),
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 8.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(
                              Icons.join_inner,
                              color: Colors.white,
                              size: 8.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'My Connections',
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xffffffff),
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PersonalCoach(),
                        ),
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 8.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(
                              Icons.person_outline_rounded,
                              color: Colors.white,
                              size: 8.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Poersonal Details',
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xffffffff),
                              ),
                            )
                          ],
                        )),
                  ),
                  SizedBox(height: 2.h),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FeedbackListings(),
                        ),
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 8.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 1.w,
                            ),
                            Icon(
                              Icons.contact_page_outlined,
                              color: Colors.white,
                              size: 8.w,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Feedback',
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xffffffff),
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
