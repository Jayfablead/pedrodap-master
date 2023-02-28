import 'package:flutter/material.dart';
import 'package:pedrodap/screens/createsessions/create%20training%20session.dart';
import 'package:pedrodap/screens/profile/mainpage2.dart';
import 'package:pedrodap/screens/view%20sessions/view%20Scouts.dart';
import 'package:pedrodap/screens/view%20sessions/view%20training.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';

class ScoutListing extends StatefulWidget {
  const ScoutListing({Key? key}) : super(key: key);

  @override
  State<ScoutListing> createState() => _ScoutListingState();
}

class Sachen {
  String? image;
  String? name;
  String? club;
  String? period;

  Sachen(this.image, this.name, this.club, this.period);
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List<Sachen> profile = [
  Sachen(
      "01-02-2023", "Camping", "Left West High Postion training", '45 Mins'),
  Sachen("05-02-2023", "Hiking", "Goal kipping Practice", '30 Mins'),
  Sachen("08-02-2023", "Swimming", "Teaching penalty Shootout", '60 Mins'),
  Sachen("10-02-2023", "Abseiling", "Teach Driblling Fast", '30 Mins'),
  Sachen(
      "15-02-2023", "Cycling", "Left West High Postion training", '45 Mins'),
  Sachen("18-02-2023", "Canoeing", "Goal kipping Practice ", '30 Mins'),

];

class _ScoutListingState extends State<ScoutListing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: drawer(),
        backgroundColor: Color(0xff131313),
        body: Container(
          padding: EdgeInsets.all(5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Scout Sessions",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ))
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                    height: 16.w,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration(
                          hintText: "Search",
                          col: Colors.white.withOpacity(0.15),
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 5.w,
                      crossAxisSpacing: 5.w,
                      crossAxisCount: 2,
                      childAspectRatio: 2.6/ 4),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: profile.length,
                  physics: ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ViewScouts()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(3.w),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white.withOpacity(0.15),
                            ),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset('assets/icons/symbol.png',height: 5.h,color: Colors.white,),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              profile[index].name.toString(),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              profile[index].club.toString(),
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "Poppins",
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Row(
                              children: [
                                Icon(Icons.calendar_month,color: Colors.white,size: 20.sp,),
                                SizedBox(width: 3.w,),

                                Text(
                                  profile[index].image.toString(),
                                  style: TextStyle(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                      color: Colors.white),
                                ),

                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ViewScouts(),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 30.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xff0DF5E3),
                                    ),
                                    borderRadius: BorderRadius.circular(20.sp)),
                                child: Text(
                                  "View",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
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

  InputDecoration inputDecoration(
      {required String hintText, required Color col, required Icon icon}) {
    return InputDecoration(
      fillColor: col,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      filled: true,
      errorStyle: const TextStyle(
        color: Colors.red,
      ),
      hintText: hintText,
      prefixIcon: icon,
      contentPadding: EdgeInsets.symmetric(vertical: 5.0),
      prefixIconColor: Colors.purple,
      hintStyle: textStyle,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.sp)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.sp)),
          borderSide: BorderSide.none),
    );
  }
}
