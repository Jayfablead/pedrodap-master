import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:sizer/sizer.dart';

class PlayerFeedback extends StatefulWidget {
  const PlayerFeedback({Key? key}) : super(key: key);

  @override
  State<PlayerFeedback> createState() => _PlayerFeedbackState();
}

class Sachen {
  String? image;
  String? name;
  double? stars;
  String? session;
  String? details;
  String? date;

  Sachen(
      this.image, this.name, this.stars, this.session, this.details, this.date);
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<Sachen> profile = [
  Sachen("assets/coach.jpg", "Christophe Galtier", 5, 'Coach', 'Positions',
      '01-02-2023'),
  Sachen("assets/coach1.jpg", "Fernando Santos", 5, 'Coach', 'Penalty Shootout',
      '03-02-2023'),
  Sachen("assets/coach.jpg", "Christophe Galtier", 3, 'Fitness Trainer',
      'Gymming', '04-02-2023'),
  Sachen("assets/tainer.jpg", "Robert Wand", 4, 'Nutritionist', 'Dieting',
      '06-02-2023'),
  Sachen("assets/coach.jpg", "Christophe Galtier", 2, 'Coach', 'Positions',
      '08-02-2023'),
  Sachen("assets/coach1.jpg", "Fernando Santos", 3, 'Coach', 'Positions',
      '10-02-2023'),
  Sachen("assets/coach.jpg", "Christophe Galtier", 4, 'Coach', 'Positions',
      '12-02-2023'),
  Sachen("assets/tainer.jpg", "Robert Wand", 5, 'Coach', 'Positions',
      '14-02-2023'),
];

class _PlayerFeedbackState extends State<PlayerFeedback> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: drawer(),
        backgroundColor: Color(0xff131313),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      // SizedBox(width: 25.w,),
                      Text(
                        "Player Feedback",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Coach Feedback : ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                  ),SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 30.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 1.h),
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                profile[index].image.toString()),
                                            radius: 4.h,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                profile[index].name.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.sp,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                profile[index]
                                                        .session
                                                        .toString() +
                                                    ' , ' +
                                                    profile[index]
                                                        .date
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.90),
                                                    fontSize: 12.sp,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.sports_handball_rounded,color: Colors.white,size: 20.sp,),
                                          SizedBox(width: 2.w,),
                                          Text(
                                            profile[index].details.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      RatingBar.builder(
                                        itemSize: 7.w,
                                        ignoreGestures: true,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding:
                                            EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        glowColor: Colors.amberAccent,
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        '"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s."',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.sp,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: profile.length,
                    ),
                  ), SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Scout Feedback : ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                  ),SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 30.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 1.h),
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                profile[index].image.toString()),
                                            radius: 4.h,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                profile[index].name.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.sp,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                profile[index]
                                                        .session
                                                        .toString() +
                                                    ' , ' +
                                                    profile[index]
                                                        .date
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.90),
                                                    fontSize: 12.sp,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.supervised_user_circle_outlined,color: Colors.white,size: 20.sp,),
                                          SizedBox(width: 2.w,),
                                          Text(
                                            profile[index].details.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      RatingBar.builder(
                                        itemSize: 7.w,
                                        ignoreGestures: true,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding:
                                            EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        glowColor: Colors.amberAccent,
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        '"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s."',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.sp,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: profile.length,
                    ),
                  ), SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Training Feedback : ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                  ),SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 30.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 1.h),
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                profile[index].image.toString()),
                                            radius: 4.h,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                profile[index].name.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.sp,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                profile[index]
                                                        .session
                                                        .toString() +
                                                    ' , ' +
                                                    profile[index]
                                                        .date
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.90),
                                                    fontSize: 12.sp,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.sports_volleyball_rounded,color: Colors.white,size: 20.sp,),
                                          SizedBox(width: 2.w,),
                                          Text(
                                            profile[index].details.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      RatingBar.builder(
                                        itemSize: 7.w,
                                        ignoreGestures: true,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding:
                                            EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        glowColor: Colors.amberAccent,
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        '"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s."',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.sp,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: profile.length,
                    ),
                  ), SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Nutritionist Feedback : ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                  ),SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    height: 30.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 1.h),
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          CircleAvatar(
                                            backgroundImage: AssetImage(
                                                profile[index].image.toString()),
                                            radius: 4.h,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                profile[index].name.toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.sp,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500),
                                              ),
                                              Text(
                                                profile[index]
                                                        .session
                                                        .toString() +
                                                    ' , ' +
                                                    profile[index]
                                                        .date
                                                        .toString(),
                                                style: TextStyle(
                                                    color: Colors.white
                                                        .withOpacity(0.90),
                                                    fontSize: 12.sp,
                                                    fontFamily: "Poppins",
                                                    fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.favorite_border,color: Colors.white,size: 20.sp,),
                                          SizedBox(width: 2.w,),
                                          Text(
                                            profile[index].details.toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp,
                                                fontFamily: "Poppins",
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      RatingBar.builder(
                                        itemSize: 7.w,
                                        ignoreGestures: true,
                                        initialRating: 3,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding:
                                            EdgeInsets.symmetric(horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        glowColor: Colors.amberAccent,
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                          setState(() {});
                                        },
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        '"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s."',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.sp,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w400),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: profile.length,
                    ),
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
