import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/searchnutriModal.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/Widget/buildErrorDialog.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/Widget/sharedpreferance.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/screens/others/feedpage.dart';
import 'package:pedrodap/screens/profile/Nutri.dart';
import 'package:pedrodap/screens/profile/fitnessProgramme.dart';
import 'package:pedrodap/screens/profile/messagePage.dart';
import 'package:pedrodap/screens/profile/nutri1.dart';
import 'package:pedrodap/screens/profile/nutrireplupage.dart';
import 'package:pedrodap/screens/profile/replypage.dart';
import 'package:sizer/sizer.dart';

import '../../Model/nutrimodal.dart';
import '../../provider/authprovider.dart';
import '../../statichomepage.dart';

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
TextEditingController _title = TextEditingController();
TextEditingController _desc = TextEditingController();

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
                                    height: 68.h,
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
                                : SizedBox(
                                    height: 68.h,
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
                                                    width: 68.w,
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
                                    'Add Nutrition & Health',
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
                                                addnutriapi();
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

  addnutriapi() {
    final Map<String, String> data = {};
    data['action'] = 'add_nutrition_and_healthdt';
    data['player_id'] = userData!.userData!.uid.toString();
    data['title'] = _title.text.trim().toString();
    data['desc'] = _desc.text.trim().toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().addnutriapi(data).then((Response response) async {
          allnutri = NutritionModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && allnutri?.status == "success") {
            Navigator.pop(context);
            Fluttertoast.showToast(
                msg: "Nutritions Added Successfully",
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
