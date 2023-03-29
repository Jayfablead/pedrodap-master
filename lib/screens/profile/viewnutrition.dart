import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/searchnutriModal.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/Widget/buildErrorDialog.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/Widget/sharedpreferance.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/screens/profile/Nutri.dart';
import 'package:pedrodap/screens/profile/fitnessProgramme.dart';
import 'package:pedrodap/screens/profile/messagePage.dart';
import 'package:pedrodap/screens/profile/nutri1.dart';
import 'package:pedrodap/screens/profile/nutrireplupage.dart';
import 'package:pedrodap/screens/profile/replypage.dart';
import 'package:sizer/sizer.dart';

import '../../Model/nutrimodal.dart';
import '../../provider/authprovider.dart';

class ViewNutrition extends StatefulWidget {
  const ViewNutrition({Key? key}) : super(key: key);

  @override
  State<ViewNutrition> createState() => _ViewNutritionState();
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
List prof = [
  'assets/10.png',
  'assets/cr7.webp',
  'assets/suarez.jpg',
  'assets/lewa.webp',
  'assets/10.png',
];
List time = [
  '11:45 pm',
  '9:45 pm',
  '8:45 pm',
  '6:45 pm',
  '5:45 pm',
];
var islikes = false;
bool isloading = true;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController _search = TextEditingController();

class _ViewNutritionState extends State<ViewNutrition> {
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
            : SingleChildScrollView(
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
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nutrition & Health',
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Meta1',
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        searchBox(),
                        _search.text == ''
                            ? allnutri!.allNutritionAndHealthDetails == null
                                ? Container(
                                    height: 70.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'No Nutrition Data Available',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Meta1',
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 80.h,
                                    child: ListView.builder(
                                      itemCount: allnutri!
                                          .allNutritionAndHealthDetails!.length,
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
                                                          allnutri!
                                                              .allNutritionAndHealthDetails![
                                                                  index]
                                                              .taskTitle
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
                                                          allnutri!
                                                              .allNutritionAndHealthDetails![
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
                                                  Divider(
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 89.w,
                                                    child: Text(
                                                      allnutri!
                                                          .allNutritionAndHealthDetails![
                                                              index]
                                                          .taskDesc
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
                                                  Divider(
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
                                                                  builder:
                                                                      (context) =>
                                                                          NutriReplyPage(
                                                                    time: allnutri!
                                                                        .allNutritionAndHealthDetails![
                                                                            index]
                                                                        .time
                                                                        .toString(),
                                                                    tile:
                                                                        "Nutrition & Health",
                                                                    title: allnutri!
                                                                        .allNutritionAndHealthDetails![
                                                                            index]
                                                                        .taskTitle
                                                                        .toString(),
                                                                    desc: allnutri!
                                                                        .allNutritionAndHealthDetails![
                                                                            index]
                                                                        .taskDesc
                                                                        .toString(),
                                                                    tid: allnutri!
                                                                        .allNutritionAndHealthDetails![
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                  ),
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
                                                                  builder:
                                                                      (context) =>
                                                                          Nutri(
                                                                    time: allnutri!
                                                                        .allNutritionAndHealthDetails![
                                                                            index]
                                                                        .time
                                                                        .toString(),
                                                                    tile:
                                                                        "Nutrition & Health",
                                                                    title: allnutri!
                                                                        .allNutritionAndHealthDetails![
                                                                            index]
                                                                        .taskTitle
                                                                        .toString(),
                                                                    desc: allnutri!
                                                                        .allNutritionAndHealthDetails![
                                                                            index]
                                                                        .taskDesc
                                                                        .toString(),
                                                                    tid: allnutri!
                                                                        .allNutritionAndHealthDetails![
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                  ),
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
                            : searchnutri!
                                        .allNutritionAndHealthSearch!.length ==
                                    0
                                ? Container(
                                    height: 70.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'No Nutrition Details Available By This Title',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Meta1',
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 80.h,
                                    child: ListView.builder(
                                      itemCount: searchnutri
                                          ?.allNutritionAndHealthSearch?.length,
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
                                                          searchnutri!
                                                              .allNutritionAndHealthSearch![
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
                                                          searchnutri!
                                                              .allNutritionAndHealthSearch![
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
                                                  Divider(
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 89.w,
                                                    child: Text(
                                                      searchnutri!
                                                          .allNutritionAndHealthSearch![
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
                                                  Divider(
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
                                                                  builder:
                                                                      (context) =>
                                                                          NutriReplyPage(
                                                                    time: searchnutri!
                                                                        .allNutritionAndHealthSearch![
                                                                            index]
                                                                        .time
                                                                        .toString(),
                                                                    tile:
                                                                        "Nutrition & Health",
                                                                    title: searchnutri!
                                                                        .allNutritionAndHealthSearch![
                                                                            index]
                                                                        .title
                                                                        .toString(),
                                                                    desc: searchnutri!
                                                                        .allNutritionAndHealthSearch![
                                                                            index]
                                                                        .description
                                                                        .toString(),
                                                                    tid: searchnutri!
                                                                        .allNutritionAndHealthSearch![
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                  ),
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
                                                                  builder:
                                                                      (context) =>
                                                                          Nutri(
                                                                    time: searchnutri!
                                                                        .allNutritionAndHealthSearch![
                                                                            index]
                                                                        .time
                                                                        .toString(),
                                                                    tile:
                                                                        "Nutrition & Health",
                                                                    title: searchnutri!
                                                                        .allNutritionAndHealthSearch![
                                                                            index]
                                                                        .title
                                                                        .toString(),
                                                                    desc: searchnutri!
                                                                        .allNutritionAndHealthSearch![
                                                                            index]
                                                                        .description
                                                                        .toString(),
                                                                    tid: searchnutri!
                                                                        .allNutritionAndHealthSearch![
                                                                            index]
                                                                        .id
                                                                        .toString(),
                                                                  ),
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
    data['action'] = 'all_nutrition_and_health_details_app';
    data['player_id'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().fitnessapi(data).then((Response response) async {
          allnutri = NutritionModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && allnutri?.status == "success") {
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
    data['action'] = 'search_nutrition_and_health_app';
    data['player_id'] = userData!.userData!.uid.toString();
    data['search_title'] = _search.text.trim().toString();
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().SearchNutriapi(data).then((Response response) async {
          searchnutri = SearchNutModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && searchnutri?.status == "success") {
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
}
