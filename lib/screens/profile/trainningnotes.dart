import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/searchtrainmodal.dart';
import 'package:pedrodap/Model/trainingsModal.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/mainpages/trainingandnotestodo.dart';
import 'package:pedrodap/mainpages/trainingsreply.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:pedrodap/screens/others/feedpage.dart';

import 'package:sizer/sizer.dart';

import '../../Widget/buildErrorDialog.dart';
import '../../Widget/sharedpreferance.dart';
import '../../statichomepage.dart';

class TrainningNotes extends StatefulWidget {
  const TrainningNotes({Key? key}) : super(key: key);

  @override
  State<TrainningNotes> createState() => _TrainningNotesState();
}

List name = [
  'Fitness Training',
  'Dribbling',
  'Diet Plans',
  'Penalty Shootouts',
  'Passing Trainings',
];
List msg = [
  'Do Push-ups, Do Pull-ups, Do Gym Trainings,Etc ..., Do Push-ups, Do Pull-ups, Do Gym Trainings,Etc ..., Do Push-ups, Do Pull-ups, Do Gym Trainings,Etc ..., Do Push-ups, Do Pull-ups, Do Gym Trainings,Etc ..., ',
  'Go For Running, Manage Fast Speed, Etc ..., Lorem Ipsum is simply dummy text of the printing and typesetting industryLorem Ipsum is simply dummy text of the printing and typesetting industryLorem Ipsum is simply dummy text of the printing and typesetting industry',
  'Take Healthy Meals Etc ...,Lorem Ipsum is simply dummy text of the printing and typesetting industryLorem Ipsum is simply dummy text of the printing and typesetting industry',
  'Practice For Penalty Shooting,Lorem Ipsum is simply dummy text of the printing and typesetting industry .Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  'Practice For Passing & Goal Shooting,Lorem Ipsum is simply dummy text of the printing and typesetting industryLorem Ipsum is simply dummy text of the printing and typesetting industry',
];

List time = [
  '11:45 pm',
  '9:45 pm',
  '8:45 pm',
  '6:45 pm',
  '5:45 pm',
];
var islikes = false;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
bool isloading = true;
TextEditingController _search = TextEditingController();
TextEditingController _title = TextEditingController();
TextEditingController _desc = TextEditingController();

class _TrainningNotesState extends State<TrainningNotes> {
  @override
  void initState() {
    super.initState();
    playerapi();
    _search.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isloading,
      scaffold: Scaffold(
        drawer: const drawer(),
        key: _scaffoldKey,
        backgroundColor: Colors.black,
        body: isloading
            ? Container()
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FeedPage(),
                                    ));
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Training & Notes',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Meta1',
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        searchBox(),
                        _search.text == ''
                            ? alltrainings!.allTrainingsAndNotes == null
                                ? Container(
                                    height: 70.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'No Trainings Available',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Meta1',
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 66.h,
                                    child: ListView.builder(
                                      itemCount: alltrainings
                                          ?.allTrainingsAndNotes?.length,
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
                                                  SizedBox(
                                                    width: 87.w,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          alltrainings!
                                                              .allTrainingsAndNotes![
                                                                  index]
                                                              .title
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Meta1',
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          alltrainings!
                                                              .allTrainingsAndNotes![
                                                                  index]
                                                              .time
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
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
                                                  ),
                                                  const Divider(
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 89.w,
                                                    child: Text(
                                                      alltrainings!
                                                          .allTrainingsAndNotes![
                                                              index]
                                                          .description
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
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  const Divider(
                                                    color: Colors.white,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      SizedBox(
                                                        width: 25.w,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(
                                                                MaterialPageRoute(
                                                                  builder: (context) => TrainingReplyPage(
                                                                      time: alltrainings!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .time,
                                                                      tid: alltrainings!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      tile:
                                                                          'Trainings & Notes',
                                                                      title: alltrainings!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .title
                                                                          .toString(),
                                                                      desc: alltrainings!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .description
                                                                          .toString()),
                                                                ),
                                                              );
                                                            },
                                                            icon: Row(
                                                              children: [
                                                                Icon(
                                                                  size: 22.sp,
                                                                  Icons
                                                                      .reply_all_rounded,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                SizedBox(
                                                                  width: 1.5.w,
                                                                ),
                                                                Text(
                                                                  'Reply',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Meta1',
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 4.h,
                                                        width: 0.1.w,
                                                      ),
                                                      SizedBox(
                                                        width: 25.w,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(
                                                                MaterialPageRoute(
                                                                  builder: (context) => Trainingnotespagetodo(
                                                                      time: alltrainings!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .time,
                                                                      tid: alltrainings!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      tile:
                                                                          "Trainings & Notes",
                                                                      title: alltrainings!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .title
                                                                          .toString(),
                                                                      desc: alltrainings!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .description
                                                                          .toString()),
                                                                ),
                                                              );
                                                            },
                                                            icon: Row(
                                                              children: [
                                                                Icon(
                                                                  size: 20.sp,
                                                                  Icons
                                                                      .today_outlined,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                SizedBox(
                                                                  width: 1.5.w,
                                                                ),
                                                                Text(
                                                                  'To-Do',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Meta1',
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ],
                                                            )),
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
                            : searchtraining?.allTrainingsAndNotes?.length == 0
                                ? Container(
                                    height: 70.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'No Trainings Available By This Title',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Meta1',
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 70.h,
                                    child: ListView.builder(
                                      itemCount: searchtraining
                                          ?.allTrainingsAndNotes?.length,
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
                                                  SizedBox(
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
                                                          searchtraining
                                                                  ?.allTrainingsAndNotes?[
                                                                      index]
                                                                  .title ??
                                                              "",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Meta1',
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        Text(
                                                          searchtraining!
                                                              .allTrainingsAndNotes![
                                                                  index]
                                                              .time
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 10.sp,
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
                                                  ),
                                                  const Divider(
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 89.w,
                                                    child: Text(
                                                      searchtraining!
                                                          .allTrainingsAndNotes![
                                                              index]
                                                          .description
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
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  const Divider(
                                                    color: Colors.white,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      SizedBox(
                                                        width: 25.w,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(
                                                                MaterialPageRoute(
                                                                  builder: (context) => TrainingReplyPage(
                                                                      time: searchtraining!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .time,
                                                                      tid: searchtraining!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      tile:
                                                                          'Trainings & Notes',
                                                                      title: searchtraining!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .title
                                                                          .toString(),
                                                                      desc: searchtraining!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .description
                                                                          .toString()),
                                                                ),
                                                              );
                                                            },
                                                            icon: Row(
                                                              children: [
                                                                Icon(
                                                                  size: 22.sp,
                                                                  Icons
                                                                      .reply_all_rounded,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                SizedBox(
                                                                  width: 1.5.w,
                                                                ),
                                                                Text(
                                                                  'Reply',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Meta1',
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ],
                                                            )),
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        height: 4.h,
                                                        width: 0.1.w,
                                                      ),
                                                      SizedBox(
                                                        width: 25.w,
                                                        child: IconButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(
                                                                MaterialPageRoute(
                                                                  builder: (context) => Trainingnotespagetodo(
                                                                      time: searchtraining!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .time,
                                                                      tid: searchtraining!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .id
                                                                          .toString(),
                                                                      tile:
                                                                          "Trainings & Notes",
                                                                      title: searchtraining!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .title
                                                                          .toString(),
                                                                      desc: searchtraining!
                                                                          .allTrainingsAndNotes![
                                                                              index]
                                                                          .description
                                                                          .toString()),
                                                                ),
                                                              );
                                                            },
                                                            icon: Row(
                                                              children: [
                                                                Icon(
                                                                  size: 20.sp,
                                                                  Icons
                                                                      .today_outlined,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                SizedBox(
                                                                  width: 1.5.w,
                                                                ),
                                                                Text(
                                                                  'To-Do',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Meta1',
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ],
                                                            )),
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
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 1.h),
                            width: 90.w,
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
                                    'Add Trainings & Notes',
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
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 0, 0),
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
                                            color:
                                                Colors.grey.withOpacity(0.20),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextField(
                                            style:
                                                TextStyle(color: Colors.white),
                                            controller: _title,
                                            decoration: InputDecoration(
                                                hintText: 'Title',
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
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
                                            color:
                                                Colors.grey.withOpacity(0.20),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: TextField(
                                            style:
                                                TextStyle(color: Colors.white),
                                            controller: _desc,
                                            decoration: InputDecoration(
                                                hintText: 'Description',
                                                hintStyle: TextStyle(
                                                    color: Colors.white),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 1.h),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2.w),
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
                                              if (_title.text == '' ||
                                                  _desc.text == '') {
                                                Fluttertoast.showToast(
                                                    msg: "Please add all Data",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor: Colors.red,
                                                    textColor: Colors.black,
                                                    fontSize: 11.sp);
                                              } else {
                                                addtrainingapi();
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.grey
                                                    .withOpacity(0.20),
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
                ),
              ),
      ),
    );
  }

  playerapi() {
    final Map<String, String> data = {};
    data['action'] = 'all_trainings_and_notes_app';
    data['player_id'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().trainingapi(data).then((Response response) async {
          alltrainings = TrainingModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && alltrainings?.status == "success") {
            setState(() {
              isloading = false;
            });



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

  addtrainingapi() {
    final Map<String, String> data = {};
    data['action'] = 'add_training_and_notesdt';
    data['player_id'] = userData!.userData!.uid.toString();
    data['title'] = _title.text.trim().toString();
    data['training_info'] = _desc.text.trim().toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().addtrainingapi(data).then((Response response) async {
          alltrainings = TrainingModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && alltrainings?.status == "success") {
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: "Training Added Successfully",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 11.sp);
            playerapi();
            _title.text = '';
            _desc.text = '';
            setState(() {
              isloading = false;
            });



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
    data['action'] = 'search_training_and_notes_app';
    data['player_id'] = userData!.userData!.uid.toString();
    data['search_title'] = _search.text.trim().toString();
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().searchtrainapi(data).then((Response response) async {
          searchtraining =
              SearchtrainModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              searchtraining?.status == "success") {
            print(searchtraining!.allTrainingsAndNotes!.length);
            setState(() {
              isloading = false;
            });



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
