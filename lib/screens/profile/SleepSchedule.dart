import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:pedrodap/Model/sleepsearchmodal.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/Widget/color.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/loader.dart';
import 'package:sizer/sizer.dart';

import '../../Model/sleepmodal.dart';
import '../../Widget/buildErrorDialog.dart';
import '../../Widget/sharedpreferance.dart';
import '../../provider/authprovider.dart';

class SleepSchedule extends StatefulWidget {
  const SleepSchedule({super.key});

  @override
  State<SleepSchedule> createState() => _SleepScheduleState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController _time = TextEditingController();
TextEditingController _title = TextEditingController();
TextEditingController _desc = TextEditingController();
TextEditingController _search = TextEditingController();
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
bool isloading = true;
bool switchvalue = true;
int? selind;

class _SleepScheduleState extends State<SleepSchedule> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playerapi();

  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isloading,
      scaffold: Scaffold(
        drawer: drawer(),
        key: _scaffoldKey,
        backgroundColor: Colors.black,
        body: isloading
            ? Container()
            : Stack(
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
                          searchBox(),
                          _search.text == ''
                              ? allsleep!.sleepScheduleDetails == null
                                  ? Container(
                                      height: 70.h,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'No Schedules Available',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'Meta1',
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 72.h,
                                      child: ListView.builder(
                                        itemCount: allsleep!
                                            .sleepScheduleDetails!.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3.h),
                                              child: Container(
                                                padding: EdgeInsets.all(3.w),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.white),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 89.w,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            allsleep!
                                                                .sleepScheduleDetails![
                                                                    index]
                                                                .noteTitle
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Meta1',
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                CupertinoIcons
                                                                    .timer,
                                                                color: Colors
                                                                    .white,
                                                                size: 16.sp,
                                                              ),
                                                              SizedBox(
                                                                width: 1.w,
                                                              ),
                                                              Text(
                                                                allsleep!
                                                                    .sleepScheduleDetails![
                                                                        index]
                                                                    .createTime
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.90)),
                                                              ),
                                                            ],
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
                                                        allsleep!
                                                            .sleepScheduleDetails![
                                                                index]
                                                            .note
                                                            .toString(),
                                                        maxLines: 7,
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: 'Meta1',
                                                            color: Colors
                                                                .grey.shade500),
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Colors.white,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Reminder : ',
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Meta1',
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .timer,
                                                              color:
                                                                  Colors.white,
                                                              size: 16.sp,
                                                            ),
                                                            SizedBox(
                                                              width: 1.w,
                                                            ),
                                                            Text(
                                                              allsleep!
                                                                  .sleepScheduleDetails![
                                                                      index]
                                                                  .time
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      'Meta1',
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.90)),
                                                            ),
                                                          ],
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
                                    )
                              : searchsleep!
                                          .sleepScheduleDetails!.length ==
                                      0
                                  ? Container(
                                      height: 70.h,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'No Schedules Available By This Title',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'Meta1',
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 60.h,
                                      child: ListView.builder(
                                        itemCount: searchsleep!
                                            .sleepScheduleDetails!.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 3.h),
                                              child: Container(
                                                padding: EdgeInsets.all(3.w),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.white),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 89.w,
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            searchsleep!
                                                                .sleepScheduleDetails![
                                                                    index]
                                                                .noteTitle
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'Meta1',
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                CupertinoIcons
                                                                    .timer,
                                                                color: Colors
                                                                    .white,
                                                                size: 16.sp,
                                                              ),
                                                              SizedBox(
                                                                width: 1.w,
                                                              ),
                                                              Text(
                                                                searchsleep!
                                                                    .sleepScheduleDetails![
                                                                        index]
                                                                    .createTime
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.90)),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Colors.white,
                                                    ),
                                                    SizedBox(
                                                      width: 80.w,
                                                      child: Text(
                                                        searchsleep!
                                                            .sleepScheduleDetails![
                                                                index]
                                                            .note
                                                            .toString(),
                                                        maxLines: 7,
                                                        style: TextStyle(
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: 'Meta1',
                                                            color: Colors
                                                                .grey.shade500),
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Colors.white,
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Reminder : ',
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  'Meta1',
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .timer,
                                                              color:
                                                                  Colors.white,
                                                              size: 16.sp,
                                                            ),
                                                            SizedBox(
                                                              width: 1.w,
                                                            ),
                                                            Text(
                                                              searchsleep!
                                                                  .sleepScheduleDetails![
                                                                      index]
                                                                  .time
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      11.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      'Meta1',
                                                                  color: Colors
                                                                      .white
                                                                      .withOpacity(
                                                                          0.90)),
                                                            ),
                                                          ],
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
                      width: 90.w,
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
                          _time.text = '';
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
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: InkWell(
                                        onTap: () =>
                                            Navigator.of(context).pop(),
                                        child: Icon(
                                          CupertinoIcons.clear,
                                          color: Colors.white,
                                          size: 15.sp,
                                        )),
                                  ),
                                  SizedBox(
                                    height: 2.h,
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
                                      controller: _title,
                                      decoration: InputDecoration(
                                          hintText: 'Title',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
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
                                          hintText: 'Description',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
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
                                          hintText: '  Time',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 1.h),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
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
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                side: BorderSide(
                                                    color: Colors.white)),
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
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 1.h),
                                                      width: 20.w,
                                                      child: ElevatedButton(
                                                        child: Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Meta1',
                                                            color: Color(
                                                                0xffffffff),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          addseep();
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors.grey
                                                                        .withOpacity(
                                                                            0.20),
                                                                minimumSize:
                                                                    Size(40.w,
                                                                        5.h),
                                                                elevation: 00),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 1.h),
                                                      width: 20.w,
                                                      child: ElevatedButton(
                                                        child: Text(
                                                          'No',
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Meta1',
                                                            color: Color(
                                                                0xffffffff),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.20),
                                                                minimumSize:
                                                                    Size(40.w,
                                                                        5.h),
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
                                          primary:
                                              Colors.grey.withOpacity(0.20),
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
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.20),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {
          searchapi();
        },
        style: TextStyle(color: Colors.white, fontFamily: 'Meta1'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white, fontFamily: 'Meta1'),
        ),
      ),
    );
  }

  searchapi() {
    final Map<String, String> data = {};
    data['action'] = 'sleep_schedule_search_app';
    data['player_id'] = userData!.userData!.uid.toString();
    data['search_title'] = _search.text.trim().toString();
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().SearchFitnessapi(data).then((Response response) async {
          searchsleep = SleepsearchModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              searchfitness?.status == "success") {
            print(alltrainings!.allTrainingsAndNotes!.length);
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {
              isloading = false;
            });
          }
        });
      } else {
        setState(() {
          isloading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

  void timepicker() async {
    final TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) {
      setState(() {
        _time.text = time.format(context);
        print(_time.text);
      });
    }
  }

  playerapi() {
    final Map<String, String> data = {};
    data['action'] = 'sleep_schedule_details_app';
    data['player_id'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().sleepapi(data).then((Response response) async {
          allsleep = SleepModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && allsleep?.status == "success") {
            print(allsleep!.sleepScheduleDetails![0].reminders);
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
            print(userData!.userData!.uid);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {
              isloading = false;
            });
          }
        });
      } else {
        setState(() {
          isloading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

  addseep() {
    final Map<String, String> data = {};
    data['action'] = 'add_sleep_schedule_app';
    data['player_id'] = userData!.userData!.uid.toString();
    data['time'] = _time.text.trim().toString();
    data['note_title'] = _title.text.trim().toString();
    data['note'] = _desc.text.trim().toString();
    data['reminder'] = "1";

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().addsleepapi(data).then((Response response) async {
          allsleep = SleepModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && allsleep?.status == "success") {

           _title.text == '' || _desc.text == '' || _time.text == ''? Fluttertoast.showToast(
             msg: 'Please Add Values',
             toastLength: Toast.LENGTH_SHORT,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.black,
             textColor: Colors.white,
             fontSize: 11.sp,
           ):
           playerapi();
           Fluttertoast.showToast(
             msg: 'Schedule Added Successfully',
             toastLength: Toast.LENGTH_SHORT,
             timeInSecForIosWeb: 1,
             backgroundColor: Colors.black,
             textColor: Colors.white,
             fontSize: 11.sp,
           );
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
            print(userData!.userData!.uid);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {
              isloading = false;
            });
          }
        });
      } else {
        setState(() {
          isloading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }
}
