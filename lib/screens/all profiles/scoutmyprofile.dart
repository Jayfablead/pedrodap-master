import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedrodap/screens/all%20profiles/scoutprofile.dart';
import 'package:pedrodap/screens/feedback/nutrifeedbacklisgtings.dart';
import 'package:pedrodap/screens/others/mytrainees.dart';
import 'package:pedrodap/screens/personalprofiles/scout.dart';
import 'package:pedrodap/screens/profile/myconnections.dart';
import 'package:pedrodap/screens/profile/userprofile%20screen.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';
import '../../Widget/const.dart';

class MyScoutProfile extends StatefulWidget {
  const MyScoutProfile({Key? key}) : super(key: key);

  @override
  State<MyScoutProfile> createState() => _MyScoutProfileState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

List img = [
  "assets/ney.jpg",
  "assets/ney2.jpg",
  "assets/ney3.webp",
  "assets/ney1.jpg",
  "assets/ney.jpg"
];

class _MyScoutProfileState extends State<MyScoutProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      key: _scaffoldKey,
      backgroundColor: Color(0xff131313),
      body: (userData!.userData!.role == "5")
          ? SingleChildScrollView(
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
                            'Scout Profile',
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
                                backgroundImage: AssetImage('assets/scout.jpg'),
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
                                  userData!.userData!.name.toString(),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                        userData!.userData!.email.toString(),
                        style: TextStyle(
                          fontSize: 4.5.w,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                          color: Colors.cyanAccent,
                        ),
                      ),

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
                      //         fontFamily: "Poppins",
                      //         color: Color(0xffeaeaea),
                      //       ),
                      //     ),
                      //     SizedBox(height: 1.h),
                      //     Text(
                      //       'neymar.jr@gmail.com',
                      //       style: TextStyle(
                      //         fontSize: 4.w,
                      //         fontWeight: FontWeight.w600,
                      //         fontFamily: "Poppins",
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
                      //                     fontFamily: "Poppins",
                      //                     color: Color(0xffffffff),
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   'Posts',
                      //                   style: TextStyle(
                      //                     fontSize: 3.5.w,
                      //                     fontWeight: FontWeight.w500,
                      //                     fontFamily: "Poppins",
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
                      //                     fontFamily: "Poppins",
                      //                     color: Color(0xffffffff),
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   'Following',
                      //                   style: TextStyle(
                      //                     fontSize: 3.5.w,
                      //                     fontWeight: FontWeight.w500,
                      //                     fontFamily: "Poppins",
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
                      //                     fontFamily: "Poppins",
                      //                     color: Color(0xffffffff),
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   'Followers',
                      //                   style: TextStyle(
                      //                     fontSize: 3.5.w,
                      //                     fontWeight: FontWeight.w500,
                      //                     fontFamily: "Poppins",
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
                      //             border: Border.all(color: Colors.cyanAccent)),
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
                      //                 fontFamily: "Poppins",
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
                      //             border: Border.all(color: Colors.cyanAccent)),
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
                      //                 fontFamily: "Poppins",
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
                      //     //         fontFamily: "Poppins",
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
                      //     //         fontFamily: "Poppins",
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
                      //     //         fontFamily: "Poppins",
                      //     //         color: Color(0xffeaeaea),
                      //     //       ),
                      //     //     ),
                      //     //   ),
                      //     // ),
                      //   ],
                      // ),
                      SizedBox(height: 1.h),
                      Divider(
                        color: Color(0xff7a7a7a),
                      ),
                      SizedBox(height: 0.2.h),

                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Mytrainees(),
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
                                  'My Current Trainies',
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
                              builder: (context) => PersonalScout(),
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
                              builder: (context) => NutriFeedbackListings(),
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
            )
          : Container(),
    );
  }
}
