import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedrodap/screens/medical/MedicalFeedback.dart';
import 'package:pedrodap/screens/medical/medicalprofile.dart';
import 'package:pedrodap/screens/medical/mymedicalfeedback.dart';
import 'package:pedrodap/screens/medical/viewsession.dart';
import 'package:pedrodap/screens/others/myclients.dart';
import 'package:pedrodap/screens/personalprofiles/medical.dart';
import 'package:pedrodap/screens/profile/myconnections.dart';
import 'package:pedrodap/screens/profile/userprofile%20screen.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';
import 'mymedicals.dart';

class MyMedicalProfile extends StatefulWidget {
  const MyMedicalProfile({Key? key}) : super(key: key);

  @override
  State<MyMedicalProfile> createState() => _MyMedicalProfileState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

List img = [
  "assets/ney.jpg",
  "assets/ney2.jpg",
  "assets/ney3.webp",
  "assets/ney1.jpg",
  "assets/ney.jpg"
];

class _MyMedicalProfileState extends State<MyMedicalProfile> {
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
                        'Medical Profile',
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
                            backgroundImage: AssetImage('assets/medical.jpg'),
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
                              'Medician',
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
                    'medical.trainer@gmail.com',
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Myclients(),
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
                            Icons.people_alt_outlined,
                            color: Colors.white,
                            size: 8.w,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'My Current Clients',
                            style: TextStyle(
                              fontSize: 4.w,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              color: Color(0xffffffff),
                            ),
                          )
                        ],
                      ),
                    ),
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
                          builder: (context) => PersonalMedical(),
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
                          builder: (context) => MedicalFeedbackListings(),
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
