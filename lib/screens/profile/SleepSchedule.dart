import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/Widget/color.dart';
import 'package:sizer/sizer.dart';

class SleepSchedule extends StatefulWidget {
  const SleepSchedule({super.key});

  @override
  State<SleepSchedule> createState() => _SleepScheduleState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController _time = TextEditingController();
TextEditingController _title = TextEditingController();
TextEditingController _desc = TextEditingController();
List name = [
  'After Workout',
  'After dinner',
  'Night',
];
List msg = [
  'Go to Sleep After Daily workout,Etc ...,',
  'Go to Sleep after Dinner, Etc ...,',
  'Take Late Night nap, Etc ...,',
];
// List prof = [
//   'assets/10.png',
//   'assets/cr7.webp',
//   'assets/suarez.jpg',
// ];
List time = [
  '11:45 am',
  '9:45 pm',
  '10:20 pm',
];
List rem = [
  '12:00 pm',
  '10:10 pm',
  '6:00 am',
];

class _SleepScheduleState extends State<SleepSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
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
                          Navigator.of(context).pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Sleep Schedule',
                        style: TextStyle(
                          fontSize: 5.5.w,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Meta1',
                          color: Color(0xffffffff),
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
                  Container(
                    height: 80.h,
                    child: ListView.builder(
                      itemCount: time.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 3.h),
                            child: Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 89.w,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          name[index],
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Meta1',
                                              color: Colors.white),
                                        ),
                                        Text(
                                          time[index],
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Meta1',
                                              color: Colors.white
                                                  .withOpacity(0.90)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 89.w,
                                    child: Text(
                                      msg[index],
                                      maxLines: 7,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Meta1',
                                          color: Colors.grey.shade500),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.white,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Reminder Time : ',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Meta1',
                                            color: Colors.white),
                                      ),
                                      Text(
                                        rem[index],
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Meta1',
                                            color:
                                                Colors.white.withOpacity(0.90)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 1.h),
              width: 60.w,
              child: ElevatedButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                    Text(
                      'Add Reminder',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Meta1',
                        color: Color(0xffffffff),
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white)),
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      scrollable: true,
                      content: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 20,
                              right: 5,
                              left: 5,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: _title,
                              decoration: InputDecoration(
                                  hintText: 'Add a Title',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 20,
                              right: 5,
                              left: 5,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              controller: _desc,
                              decoration: InputDecoration(
                                  hintText: 'Add a Description',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 20,
                              right: 5,
                              left: 5,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.20),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              readOnly: true,
                              onTap: () {
                                timepicker();
                              },
                              style: TextStyle(color: Colors.white),
                              controller: _time,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    CupertinoIcons.calendar_badge_plus,
                                    color: Colors.white,
                                  ),
                                  hintText: '  Add Time',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: InputBorder.none),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 1.h),
                            width: 30.w,
                            child: ElevatedButton(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  Text(
                                    'Add',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Meta1',
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        side: BorderSide(color: Colors.white)),
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 0, 0),
                                    scrollable: true,
                                    content: Column(
                                      children: [
                                        Text(
                                          'Do You Want A Reminder ?',
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Meta1',
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 1.h),
                                              width: 20.w,
                                              child: ElevatedButton(
                                                child: Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Meta1',
                                                    color: Color(0xffffffff),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.grey
                                                        .withOpacity(0.20),
                                                    minimumSize:
                                                        Size(40.w, 5.h),
                                                    elevation: 00),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 1.h),
                                              width: 20.w,
                                              child: ElevatedButton(
                                                child: Text(
                                                  'No',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Meta1',
                                                    color: Color(0xffffffff),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.grey
                                                        .withOpacity(0.20),
                                                    minimumSize:
                                                        Size(40.w, 5.h),
                                                    elevation: 00),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey.withOpacity(0.20),
                                  minimumSize: Size(40.w, 7.h),
                                  elevation: 00),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey.withOpacity(0.20),
                  minimumSize: Size(60.w, 7.h),
                  elevation: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void timepicker() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context, //context of current state
    );

    if (pickedTime != null) {
      print(pickedTime.format(context)); //output 10:51 PM
      DateTime parsedTime =
          DateFormat.jm().parse(pickedTime.format(context).toString());
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
      String formattedTime = DateFormat('HH:mm').format(parsedTime);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      _time.text = formattedTime;
    } else {
      print("Time is not selected");
    }
  }
}
