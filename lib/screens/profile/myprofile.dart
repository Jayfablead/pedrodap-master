import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pedrodap/Model/UserModal.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/screens/profile/userprofile%20screen.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';

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

class _MyProfileState extends State<MyProfile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _CurrTeam.text = userData!.userData!.clubName.toString();
    _prevclub.text = 'Arsenal';
    _exp.text = '12 yrs';
    _position.text = 'Left Forward';
    _about.text =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.';
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      key: _scaffoldKey,
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SingleChildScrollView(
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
                      backgroundColor: Colors.white,
                      radius: 6.1.h,
                      child: CircleAvatar(
                        backgroundColor: Color(0xff131313),
                        radius: 5.7.h,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://icdn.football-espana.net/wp-content/uploads/2022/06/Neymar-Junior2.jpeg',
                          ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '18',
                                    style: TextStyle(
                                      fontSize: 6.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    'Connections',
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
                                    userData!.userData!.age.toString(),
                                    style: TextStyle(
                                      fontSize: 6.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    'Age',
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
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 1.h),
                Divider(
                  color: Color(0xff7a7a7a),
                ),
                SizedBox(height: 0.2.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Text(
                      userData!.userData!.clubName.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                  ],
                ),

                // SizedBox(
                //   height: 1.h,
                // ),
                // Container(
                //   height: 7.h,
                //   width: MediaQuery.of(context).size.width,
                //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15.0),
                //     color: Colors.white.withOpacity(0.15),
                //   ),
                //   child: TextField(
                //     readOnly: true,
                //     controller: _CurrTeam,
                //     keyboardType: TextInputType.emailAddress,
                //     cursorColor: Colors.white,
                //     style: textStyle,
                //     decoration: InputDecoration(
                //         border: InputBorder.none,
                //         focusedBorder: InputBorder.none,
                //         hintText: 'Enter Your Current Club Name ',
                //         hintStyle: textStyle1),
                //   ),
                // ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      'Arsenal',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // Container(
                //   height: 7.h,
                //   width: MediaQuery.of(context).size.width,
                //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15.0),
                //     color: Colors.white.withOpacity(0.15),
                //   ),
                //   child: TextField(
                //     readOnly: true,
                //     controller: _prevclub,
                //     keyboardType: TextInputType.emailAddress,
                //     cursorColor: Colors.white,
                //     style: textStyle,
                //     decoration: InputDecoration(
                //         border: InputBorder.none,
                //         focusedBorder: InputBorder.none,
                //         hintText: 'Enter Your Last Club Name ',
                //         hintStyle: textStyle1),
                //   ),
                // ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_4_outlined,
                      color: Colors.white,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      "Experince : ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    Text(
                      '12 Yrs',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // Container(
                //   height: 7.h,
                //   width: MediaQuery.of(context).size.width,
                //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15.0),
                //     color: Colors.white.withOpacity(0.15),
                //   ),
                //   child: TextField(
                //     readOnly: true,
                //     controller: _exp,
                //     keyboardType: TextInputType.emailAddress,
                //     cursorColor: Colors.white,
                //     style: textStyle,
                //     decoration: InputDecoration(
                //         border: InputBorder.none,
                //         focusedBorder: InputBorder.none,
                //         hintText: 'Enter Your Experince ',
                //         hintStyle: textStyle1),
                //   ),
                // ),
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
                      "Position : ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                    SizedBox(
                      width: 17.w,
                    ),
                    Text(
                      'Coach',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // Container(
                //   height: 7.h,
                //   width: MediaQuery.of(context).size.width,
                //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(15.0),
                //     color: Colors.white.withOpacity(0.15),
                //   ),
                //   child: TextField(
                //     readOnly: true,
                //     controller: _position,
                //     keyboardType: TextInputType.emailAddress,
                //     cursorColor: Colors.white,
                //     style: textStyle,
                //     decoration: InputDecoration(
                //         border: InputBorder.none,
                //         focusedBorder: InputBorder.none,
                //         hintText: 'Enter Your Position ',
                //         hintStyle: textStyle1),
                //   ),
                // ),
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
                          "Player Bio : ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 14.h,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white.withOpacity(0.15),
                      ),
                      child: TextField(
                        readOnly: true,
                        controller: _about,
                        maxLines: 4,
                        cursorColor: Colors.white,
                        style: textStyle,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 1.5.h),
                            hintText: 'Tell us Who Are You',
                            hintStyle: textStyle1),
                      ),
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
    );
  }

  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: "Poppins");

  TextStyle textStyle1 =
      TextStyle(color: Colors.grey, fontSize: 12.sp, fontFamily: "Poppins");
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