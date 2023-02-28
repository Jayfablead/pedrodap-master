import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Helathreport extends StatefulWidget {
  const Helathreport({Key? key}) : super(key: key);

  @override
  State<Helathreport> createState() => _HelathreportState();
}

class _HelathreportState extends State<Helathreport> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff131313),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "Health Report",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.w,
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 3.w,right: 3.w),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15.0)),
                    height: 13.h,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 2.w,
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://icdn.football-espana.net/wp-content/uploads/2022/06/Neymar-Junior2.jpeg',
                          ),
                          radius: 5.5.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 55.w,
                              child: Text(
                                'Neymar JR.',
                                style: TextStyle(
                                  fontSize: 5.w,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),

                            Text(
                              'Neymar.jr07@gmail.com',
                              style: TextStyle(
                                fontSize: 4.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Colors.cyanAccent,
                              ),
                            ),
                            SizedBox(
                              height: 1.w,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 3.h,
                ),
                Container(
                  height: 30.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          height: 30.h,
                          width: 16.h,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 1.h,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'BLOOD',
                                    style: TextStyle(
                                      fontSize: 6.w,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    'GROUP',
                                    style: TextStyle(
                                      fontSize: 6.w,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.water_drop_outlined,
                                size: 12.w,
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'A',
                                    style: TextStyle(
                                      fontSize: 15.w,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Poppins",
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 15.w,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        height: 30.h,
                        width: 57.w,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Wieght',
                              style: TextStyle(
                                fontSize: 6.w,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Color(0xffffffff),
                              ),
                            ),
                            Text(
                              'last measurement',
                              style: TextStyle(
                                fontSize: 4.7.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xffc5c5c5),
                              ),
                            ),
                            Container(
                              height: 0.6.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey),
                              child: Row(
                                children: [
                                  Container(
                                    height: 0.6.h,
                                    width: 25.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.cyanAccent),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '89',
                                  style: TextStyle(
                                    fontSize: 13.w,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  'Kg',
                                  style: TextStyle(
                                    fontSize: 8.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w,right: 3.w),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    height: 30.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Heart Rate',
                                  style: TextStyle(
                                    fontSize: 6.w,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'last\nmeasurement',
                              style: TextStyle(
                                fontSize: 4.7.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: Color(0xffc5c5c5),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '94',
                                  style: TextStyle(
                                    fontSize: 13.w,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  'bpm',
                                  style: TextStyle(
                                    fontSize: 8.w,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Image.network(
                          'https://static.vecteezy.com/system/resources/previews/001/188/035/original/heartbeat-long-line-png.png',
                          height: 15.h,
                          width: 49.w,
                          fit: BoxFit.cover,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w,right: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        height: 18.h,
                        width: 38.w,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              'Height',
                              style: TextStyle(
                                fontSize: 6.w,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: Color(0xffffffff),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "5'10\"",
                                  style: TextStyle(
                                    fontSize: 12.w,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        height: 18.h,
                        width: 54.w,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.white,
                                  size: 6.w,
                                ),
                                SizedBox(width: 1.w,),
                                Text(
                                  'Ashthama : ',
                                  style: TextStyle(
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  "14",
                                  style: TextStyle(
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.local_fire_department_outlined,
                                  color: Colors.white,
                                  size: 6.w,
                                ),
                                SizedBox(width: 1.w,),
                                Text(
                                  'Fractures : ',
                                  style: TextStyle(
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.ac_unit,
                                  color: Colors.white,
                                  size: 5.w,
                                ),
                                SizedBox(width: 1.w,),
                                Text(
                                  'Celic Diseas : ',
                                  style: TextStyle(
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                Text(
                                  "2",
                                  style: TextStyle(
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
