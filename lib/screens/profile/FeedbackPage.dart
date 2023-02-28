import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pedrodap/screens/profile/viewfeedBack.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<String> _Sessions = [
  "Positions",
  "Captain",
  "Manager",
  "Players",
  "Health",
  "Trainings",
  "Medical",

];
String? _selectedSession;
List<String> _quality = [
  'Very Bad',
  'Bad',
  'Normal',
  'Good',
  'Very Good',
  'Great',
];
String? _selectedQuality;
List<String> _players = [
  'Cr7',
  'Lionel Messi',
  'Neymar',
  'Lewandoski',
  'Suarez',
  'MBappe'
];
double _rating = 3;
String? _selectedPlayer;
TextEditingController _feedback = TextEditingController();

class _FeedBackPageState extends State<FeedBackPage> {
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
            padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                        )),
                    // SizedBox(width: 25.w,),
                    Text(
                      "Send Feedback",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ))
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  height: 35.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Session : ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: Colors.white.withOpacity(0.15),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.5.h),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                offset: Offset(0, 0),
                                dropdownDecoration: BoxDecoration(
                                    border: Border.all(color: Colors.cyanAccent),
                                    borderRadius: BorderRadius.circular(14),
                                    // color: Colors.white.withOpacity(0.15),
                                    color: Color(0xff131313)),
                                hint: Row(
                                  children: [
                                    Icon(
                                      Icons.people_alt_outlined,
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      'Choose Session',
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontFamily: "Poppins",
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                                // Not necessary for Option 1
                                value: _selectedSession,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedSession = newValue!;
                                  });
                                },

                                items: _Sessions.map((session) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      session,
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontFamily: "Poppins",
                                          fontSize: 12.sp),
                                    ),
                                    value: session,
                                  );
                                }).toList(),
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
                          Text(
                            "Select Player : ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: Colors.white.withOpacity(0.15),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.5.h),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                offset: Offset(0, 0),
                                dropdownDecoration: BoxDecoration(
                                    border: Border.all(color: Colors.cyanAccent),
                                    borderRadius: BorderRadius.circular(14),
                                    // color: Colors.white.withOpacity(0.15),
                                    color: Color(0xff131313)),
                                hint: Row(
                                  children: [
                                    Icon(
                                      Icons.person_outline_rounded,
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      'Choose Player',
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontFamily: "Poppins",
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                                // Not necessary for Option 1
                                value: _selectedPlayer,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedPlayer = newValue!;
                                  });
                                },

                                items: _players.map((player) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      player,
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontFamily: "Poppins",
                                          fontSize: 12.sp),
                                    ),
                                    value: player,
                                  );
                                }).toList(),
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
                          Text(
                            "Select Player Quality : ",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.sp),
                              color: Colors.white.withOpacity(0.15),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 0.5.h),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                offset: Offset(0, 0),
                                dropdownDecoration: BoxDecoration(
                                    border: Border.all(color: Colors.cyanAccent),
                                    borderRadius: BorderRadius.circular(14),
                                    // color: Colors.white.withOpacity(0.15),
                                    color: Color(0xff131313)),
                                hint: Row(
                                  children: [
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.grey.shade500,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Text(
                                      'Choose Player Quality',
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontFamily: "Poppins",
                                          fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                                // Not necessary for Option 1
                                value: _selectedQuality,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedQuality = newValue!;
                                  });
                                },

                                items: _quality.map((quality) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      quality,
                                      style: TextStyle(
                                          color: Colors.grey.shade500,
                                          fontFamily: "Poppins",
                                          fontSize: 12.sp),
                                    ),
                                    value: quality,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Give Feedback : ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: 12.h,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white.withOpacity(0.15),
                      ),
                      child: TextField(controller: _feedback,
                        maxLines: 3,
                        cursorColor: Colors.white,
                        style: textStyle,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 1.5.h),
                            hintText: 'Feedback',
                            hintStyle: textStyle1),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ratings : ",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 8.h,
                          width: 70.w,
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white.withOpacity(0.15),
                          ),
                          child: RatingBar.builder(
                            initialRating: _rating,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            glowColor: Colors.amberAccent,
                            onRatingUpdate: (rating) {
                              print(rating);
                              setState(() {
                                _rating = rating;
                              });
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 8.h,
                          width: 20.w,
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white.withOpacity(0.15),
                          ),
                          child: Text(
                            '${_rating} ☆',
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                InkWell(onTap: ()async{
                  print('hy');


                },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.cyanAccent),
                    height: 7.h,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Submit",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.normal,
                          fontSize: 15.sp),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: "Poppins");

  TextStyle textStyle1 =
      TextStyle(color: Colors.grey, fontSize: 12.sp, fontFamily: "Poppins");
}
