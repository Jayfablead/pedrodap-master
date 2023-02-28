import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/Widget/sharedpreferance.dart';
import 'package:pedrodap/screens/all%20profiles/coachprofile.dart';
import 'package:pedrodap/screens/all%20profiles/scoutprofile.dart';
import 'package:pedrodap/screens/all%20profiles/trainerProfile.dart';
import 'package:pedrodap/screens/createsessions/createScouts.dart';
import 'package:pedrodap/screens/feedback/feedbackListings.dart';
import 'package:pedrodap/screens/feedback/myCoachingfeedback.dart';
import 'package:pedrodap/screens/feedback/myTrainingFeedbackPage.dart';
import 'package:pedrodap/screens/feedback/mynutritionFeedback.dart';
import 'package:pedrodap/screens/feedback/nutrifeedbacklisgtings.dart';
import 'package:pedrodap/screens/feedback/playerfeedbackview.dart';
import 'package:pedrodap/screens/feedback/scoutfeedbacklisting.dart';
import 'package:pedrodap/screens/feedback/trainerfeedbacklisting.dart';
import 'package:pedrodap/screens/feedback/viewcoachfeedback.dart';
import 'package:pedrodap/screens/medical/MedicalFeedback.dart';
import 'package:pedrodap/screens/medical/allSessions.dart';
import 'package:pedrodap/screens/medical/createsession.dart';
import 'package:pedrodap/screens/medical/medicalprofile.dart';
import 'package:pedrodap/screens/medical/mymedicalprofile.dart';
import 'package:pedrodap/screens/medical/mymedicals.dart';
import 'package:pedrodap/screens/profile/Chatpage.dart';
import 'package:pedrodap/screens/profile/FeedbackPage.dart';
import 'package:pedrodap/screens/sessions/allNutritions.dart';
import 'package:pedrodap/screens/sessions/allScouts.dart';
import 'package:pedrodap/screens/sessions/allcoaching.dart';
import 'package:pedrodap/screens/sessions/alltrainnigs.dart';
import 'package:pedrodap/screens/createsessions/create%20training%20session.dart';
import 'package:pedrodap/screens/createsessions/createcoaching.dart';
import 'package:pedrodap/screens/createsessions/createnutritions.dart';
import 'package:pedrodap/screens/profile/myconnections.dart';
import 'package:pedrodap/screens/profile/reqestPage.dart';
import 'package:pedrodap/screens/view%20sessions/view%20Scouts.dart';
import 'package:pedrodap/screens/view%20sessions/view%20training.dart';
import 'package:pedrodap/screens/view%20sessions/viewNutrition.dart';
import 'package:pedrodap/screens/view%20sessions/viewcoaching.dart';

import 'package:sizer/sizer.dart';

import '../screens/all profiles/coachmyprofile.dart';
import '../screens/all profiles/nutritionistmyprofile.dart';
import '../screens/all profiles/nutritionistprofile.dart';
import '../screens/all profiles/scoutmyprofile.dart';
import '../screens/all profiles/trainermyprofile.dart';
import '../screens/feedback/myScoutfeedbackPage.dart';
import '../screens/profile/coachprofile.dart';
import '../screens/profile/listingpage.dart';
import '../screens/profile/loginpage.dart';
import '../screens/profile/mainpage.dart';
import '../screens/profile/mainpage2.dart';
import '../screens/profile/myprofile.dart';
import '../screens/profile/userprofile screen.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    double widthDrawer = MediaQuery.of(context).size.width * 0.75;
    return SafeArea(
      child: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: widthDrawer,
          color: Color(0xff131313),
          child: ListView(
            //padding: EdgeInsets.all(2.w),
            children: [
              Container(
                height: 10.h,
                padding: EdgeInsets.all(1.w),
                width: widthDrawer,
                // color: Colors.black.withOpacity(0.3),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/splash2.jpg"))
                    // image: NetworkImage(
                    //     'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
                    ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 9.w,
                        backgroundImage: NetworkImage(
                            "https://icdn.football-espana.net/wp-content/uploads/2022/06/Neymar-Junior2.jpeg")),
                    SizedBox(
                      width: 7.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          userData!.userData!.name.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(userData!.userData!.email.toString(),
                            style: TextStyle(
                                color: Colors.cyanAccent,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Pages",
                    style: TextStyle(
                      fontSize: 3.5.w,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Color(0xffb2b2b2),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 2.5.h,
              // ),
              // Row(
              //   children: [
              //     SizedBox(
              //       width: 5.w,
              //     ),
              //     InkWell(
              //       onTap: () {
              //         Navigator.of(context).push(
              //             MaterialPageRoute(builder: (context) => mainpage()));
              //       },
              //       child: Container(
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(10),
              //             color: Colors.white.withOpacity(0.15)),
              //         width: 67.w,
              //         height: 6.h,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Row(
              //               children: [
              //                 SizedBox(
              //                   width: 1.w,
              //                 ),
              //                 Icon(
              //                   Icons.contact_page,
              //                   color: Colors.white,
              //                 ),
              //                 SizedBox(
              //                   width: 2.w,
              //                 ),
              //                 Text("Main Page1",
              //                     style: TextStyle(
              //                       fontSize: 4.w,
              //                       fontWeight: FontWeight.w500,
              //                       fontFamily: "Poppins",
              //                       color: Colors.white,
              //                     )),
              //               ],
              //             ),
              //             Icon(
              //               Icons.chevron_right_rounded,
              //               color: Colors.white,
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 1.5.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => mainpage2(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Main Page",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FeedBackPage(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Send Feedback",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FeedbackListings(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Feedback Listing",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PlayerFeedback(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Player Feedback",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(
                color: Colors.white54,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 3.5.w,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Color(0xffb2b2b2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("My Profile",
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 33.w,
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Userprofile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.people_alt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("User Profile",
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 30.w,
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyScoutListingPage(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("My Scout",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyCoachingFeedbackPage(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("My Coach",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyTrainingFeedbackPage(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("My Training",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyNutritionFeedbackPage(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("My Nutritionist",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyMedicalPage(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("My Medical",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(
                color: Colors.white54,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Others",
                    style: TextStyle(
                      fontSize: 3.5.w,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Color(0xffb2b2b2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => listingpage()));
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.pages_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("All Players",
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 33.w,
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReqestPage(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person_add_alt_1_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("My Request",
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 30.w,
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyConnections(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.person_add_alt_1_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "My Connections",
                            style: TextStyle(
                              fontSize: 4.w,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 21.w,
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatPage(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.chat_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("Chat",
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 43.w,
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(
                color: Colors.white54,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Scouts",
                      style: TextStyle(
                        fontSize: 3.5.w,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Color(0xffb2b2b2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ScoutListing(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("All Sessions",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateScouts(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Create Scout Session",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ScoutFeedbackListings(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Scout Feedback",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ScoutProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Scout Profile",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyScoutProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("My Profile",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(
                color: Colors.white54,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Coaching",
                      style: TextStyle(
                        fontSize: 3.5.w,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Color(0xffb2b2b2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CoachListing(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("All Sessions",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateCoaching(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Create Coching Session",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CoachProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Coach Profile",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyCoachProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("My Profile",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(
                color: Colors.white54,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Training",
                      style: TextStyle(
                        fontSize: 3.5.w,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Color(0xffb2b2b2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TrainingsListing(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("All Sessions",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateTraining(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Create Training Session",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TrainerFeedbackListings(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Training Feedback",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TrainerProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Trainer Profile",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyTrainerProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("My Profile",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(
                color: Colors.white54,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Nutritionist",
                      style: TextStyle(
                        fontSize: 3.5.w,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Color(0xffb2b2b2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NutriListing(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("All Sessions",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateNutritionist(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Create Nutri Session",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NutriFeedbackListings(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Nutritionist Feedback",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NutritionistProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Nutritionist Profile",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyNutritionistProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("My Profile",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(
                color: Colors.white54,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Medical",
                      style: TextStyle(
                        fontSize: 3.5.w,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Poppins",
                        color: Color(0xffb2b2b2),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MedicalListings(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("All Sessions",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CreateMedical(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Create Medical Session",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MedicalFeedbackListings(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Medical Feedback",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MedicalProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("Medical Profile",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyMedicalProfile(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Container(
                        width: 66.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.contact_page_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text("My Profile",
                                    style: TextStyle(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Divider(
                color: Colors.white54,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 3.5.w,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                      color: Color(0xffb2b2b2),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.2.h,
              ),
              InkWell(
                onTap: () async {
                  await SaveDataLocal.clearUserData();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => loginpage(),
                    ),
                  );
                },
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 6.w,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.logout_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "Logout",
                            style: TextStyle(
                              fontSize: 4.w,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600);
}
