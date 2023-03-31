import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:pedrodap/Model/nutritodoModal.dart';
import 'package:pedrodap/Model/searchfittodoModal.dart';
import 'package:pedrodap/Model/searchtodoModal.dart';
import 'package:pedrodap/Model/searchtodonutri.dart';
import 'package:pedrodap/Model/todo.dart';
import 'package:pedrodap/Model/viewtodoModal.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/Widget/sharedpreferance.dart';
import 'package:pedrodap/Widget/todo_items.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:sizer/sizer.dart';
import '../../Model/profileModal.dart';
import '../../Widget/Drawer.dart';
import '../../Widget/buildErrorDialog.dart';
import '../../Widget/color.dart';

class Nutri extends StatefulWidget {
  String? title;
  String? desc;
  String? tile;
  String? tid;
  String? time;

  Nutri(
      {Key? key,
      this.desc,
      this.title,
      this.time,
      this.tile,
      required this.tid})
      : super(key: key);

  @override
  State<Nutri> createState() => _NutriState();
}

class _NutriState extends State<Nutri> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  List title = [
    'Lorem Ipsum is simply dummy text.',
    'typesetting industry Lorem Ipsum.',
    'typesetting industry Lorem Ipsum.',
    'typesetting industry Lorem Ipsum.',
    'Lorem Ipsum is simply dummy text.',
    'Lorem Ipsum is simply dummy text.',
  ];
  List subtitle = [
    '8 pm',
    '6 pm',
    '4 pm',
    '12 pm',
    '8 am',
    '8 am',
  ];
  List date = [
    '17-03-23',
    '17-03-23',
    '16-03-23',
    '15-03-23',
    '14-03-23',
    '14-03-23',
  ];
  bool istap = false;
  bool isloading = true;
  int? select;
  TextEditingController _mealname = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _fat = TextEditingController();
  TextEditingController _search = TextEditingController();
  TextEditingController _foodname = TextEditingController();
  TextEditingController _cal = TextEditingController();
  TextEditingController _protine = TextEditingController();
  TextEditingController _Quantity = TextEditingController();
  TextEditingController _carb = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
    print("========================================" +
        "Id = " +
        widget.tid.toString());
    viewtodo();
    _search.text = '';
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.black,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                      widget.tile.toString(),
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
                                SizedBox(height: 2.h),
                                Container(
                                  padding: EdgeInsets.all(3.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              widget.title.toString(),
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Meta1',
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              widget.time.toString(),
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w200,
                                                  fontFamily: 'Meta1',
                                                  color: Colors.white),
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
                                          widget.desc.toString(),
                                          maxLines: 7,
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Meta1',
                                              color: Colors.grey.shade500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                searchBox(),
                              ],
                            ),
                          ),
                          _search.text == ''
                              ? nutrialltodo!.nutritionAndHealthTodos ==
                                          null
                                      ? Container(
                                          height: 70.h,
                                          alignment: Alignment.center,
                                          child: Text(
                                            'No Task Available',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'Meta1',
                                              color: Color(0xffffffff),
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          height: 60.h,
                                          child: ListView.builder(
                                            itemCount: nutrialltodo
                                                ?.nutritionAndHealthTodos
                                                ?.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 2.h),
                                                child: ListTile(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  title: Text(
                                                    nutrialltodo!
                                                        .nutritionAndHealthTodos![
                                                            index]
                                                        .mealName
                                                        .toString(),
                                                    style: TextStyle(
                                                        decoration: nutrialltodo!
                                                                    .nutritionAndHealthTodos![
                                                                        index]
                                                                    .isComplete ==
                                                                1
                                                            ? TextDecoration
                                                                .lineThrough
                                                            : TextDecoration
                                                                .none,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily: 'Meta1',
                                                        color: Colors.white),
                                                  ),
                                                  subtitle: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        nutrialltodo!
                                                                .nutritionAndHealthTodos![
                                                                    index]
                                                                .fat
                                                                .toString() +
                                                            " fat",
                                                        style: TextStyle(
                                                            decoration: nutrialltodo!
                                                                        .nutritionAndHealthTodos![
                                                                            index]
                                                                        .isComplete ==
                                                                    1
                                                                ? TextDecoration
                                                                    .lineThrough
                                                                : TextDecoration
                                                                    .none,
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: 'Meta1',
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                      Text(
                                                        ' - ',
                                                        style: TextStyle(
                                                            decoration: select ==
                                                                    index
                                                                ? TextDecoration
                                                                    .lineThrough
                                                                : TextDecoration
                                                                    .none,
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: 'Meta1',
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                      Text(
                                                        nutrialltodo!
                                                                .nutritionAndHealthTodos![
                                                                    index]
                                                                .protein
                                                                .toString() +
                                                            " pro",
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: TextStyle(
                                                            decoration: nutrialltodo!
                                                                        .nutritionAndHealthTodos![
                                                                            index]
                                                                        .isComplete ==
                                                                    1
                                                                ? TextDecoration
                                                                    .lineThrough
                                                                : TextDecoration
                                                                    .none,
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: 'Meta1',
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                      Text(
                                                        ' - ',
                                                        style: TextStyle(
                                                            decoration: select ==
                                                                    index
                                                                ? TextDecoration
                                                                    .lineThrough
                                                                : TextDecoration
                                                                    .none,
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: 'Meta1',
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                      Text(
                                                        nutrialltodo!
                                                                .nutritionAndHealthTodos![
                                                                    index]
                                                                .calories
                                                                .toString() +
                                                            " Cal",
                                                        textAlign:
                                                            TextAlign.justify,
                                                        style: TextStyle(
                                                            decoration: nutrialltodo!
                                                                        .nutritionAndHealthTodos![
                                                                            index]
                                                                        .isComplete ==
                                                                    1
                                                                ? TextDecoration
                                                                    .lineThrough
                                                                : TextDecoration
                                                                    .none,
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: 'Meta1',
                                                            color:
                                                                Colors.white70),
                                                      ),
                                                    ],
                                                  ),
                                                  leading: IconButton(
                                                    onPressed: () {
                                                      nutrialltodo!
                                                                  .nutritionAndHealthTodos![
                                                                      index]
                                                                  .isComplete ==
                                                              1
                                                          ? Incompleteapi(index)
                                                          : Completeapi(index);
                                                    },
                                                    icon: nutrialltodo!
                                                                .nutritionAndHealthTodos![
                                                                    index]
                                                                .isComplete ==
                                                            1
                                                        ? Icon(
                                                            Icons
                                                                .check_box_rounded,
                                                            color: Colors.white)
                                                        : Icon(
                                                            Icons
                                                                .check_box_outline_blank_rounded,
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  trailing: IconButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) =>
                                                              AlertDialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                side: BorderSide(
                                                                    color: Colors
                                                                        .white)),
                                                            backgroundColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    0,
                                                                    0,
                                                                    0),
                                                            scrollable: true,
                                                            content: Text(
                                                              'Are You Sure You Want to to Delete ?',
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
                                                            actions: [
                                                              InkWell(
                                                                onTap: () {
                                                                  deletetodo(
                                                                      index);
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(2
                                                                              .w),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(1
                                                                              .h),
                                                                  child: Text(
                                                                    'Yes',
                                                                    style: TextStyle(
                                                                        fontSize: 13
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Meta1',
                                                                        color: Colors
                                                                            .green),
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Colors
                                                                              .black,
                                                                          border: Border
                                                                              .all(
                                                                            color:
                                                                                Colors.green,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .all(1
                                                                              .w),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(1
                                                                              .h),
                                                                  child: Text(
                                                                    'No',
                                                                    style: TextStyle(
                                                                        fontSize: 13
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w400,
                                                                        fontFamily:
                                                                            'Meta1',
                                                                        color: Colors
                                                                            .red),
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: Colors
                                                                              .black,
                                                                          border: Border
                                                                              .all(
                                                                            color:
                                                                                Colors.red,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(10)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      icon: Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      )),
                                                  tileColor: Colors.grey
                                                      .withOpacity(0.20),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                              : searchtodonutri!.nutritionAndHealthTodos!.length == 0
                              ? Container(
                            height: 70.h,
                            alignment: Alignment.center,
                            child: Text(
                              'No Task Available By This Title',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'Meta1',
                                color: Color(0xffffffff),
                              ),
                            ),
                          )
                              : SizedBox(
                                  height: 60.h,
                                  child: ListView.builder(
                                    itemCount: searchtodonutri
                                        ?.nutritionAndHealthTodos?.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 2.h),
                                        child: ListTile(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          title: Text(
                                            searchtodonutri!
                                                .nutritionAndHealthTodos![index]
                                                .mealName
                                                .toString(),
                                            style: TextStyle(
                                                decoration: searchtodonutri!
                                                            .nutritionAndHealthTodos![
                                                                index]
                                                            .completed ==
                                                        1
                                                    ? TextDecoration.lineThrough
                                                    : TextDecoration.none,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Meta1',
                                                color: Colors.white),
                                          ),
                                          subtitle: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                searchtodonutri!
                                                        .nutritionAndHealthTodos![
                                                            index]
                                                        .fat
                                                        .toString() +
                                                    " fat",
                                                style: TextStyle(
                                                    decoration: searchtodonutri!
                                                                .nutritionAndHealthTodos![
                                                                    index]
                                                                .completed ==
                                                            1
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Meta1',
                                                    color: Colors.white70),
                                              ),
                                              Text(
                                                ' - ',
                                                style: TextStyle(
                                                    decoration: select == index
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Meta1',
                                                    color: Colors.white70),
                                              ),
                                              Text(
                                                searchtodonutri!
                                                        .nutritionAndHealthTodos![
                                                            index]
                                                        .protein
                                                        .toString() +
                                                    " pro",
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    decoration: searchtodonutri!
                                                                .nutritionAndHealthTodos![
                                                                    index]
                                                                .completed ==
                                                            1
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Meta1',
                                                    color: Colors.white70),
                                              ),
                                              Text(
                                                ' - ',
                                                style: TextStyle(
                                                    decoration: select == index
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Meta1',
                                                    color: Colors.white70),
                                              ),
                                              Text(
                                                searchtodonutri!
                                                        .nutritionAndHealthTodos![
                                                            index]
                                                        .calories
                                                        .toString() +
                                                    " Cal",
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    decoration: searchtodonutri!
                                                                .nutritionAndHealthTodos![
                                                                    index]
                                                                .completed ==
                                                            1
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Meta1',
                                                    color: Colors.white70),
                                              ),
                                            ],
                                          ),
                                          leading: IconButton(
                                            onPressed: () {
                                              searchtodonutri!
                                                          .nutritionAndHealthTodos![
                                                              index]
                                                          .completed ==
                                                      1
                                                  ? Incompleteapi(index)
                                                  : Completeapi(index);
                                            },
                                            icon: searchtodonutri!
                                                        .nutritionAndHealthTodos![
                                                            index]
                                                        .completed ==
                                                    1
                                                ? Icon(Icons.check_box_rounded,
                                                    color: Colors.white)
                                                : Icon(
                                                    Icons
                                                        .check_box_outline_blank_rounded,
                                                    color: Colors.white),
                                          ),
                                          trailing: IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .white)),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 0, 0, 0),
                                                    scrollable: true,
                                                    content: Text(
                                                      'Are You Sure You Want to to Delete ?',
                                                      style: TextStyle(
                                                          fontSize: 11.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontFamily: 'Meta1',
                                                          color: Colors.white),
                                                    ),
                                                    actions: [
                                                      InkWell(
                                                        onTap: () {
                                                          deletetodo(index);
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  2.w),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.h),
                                                          child: Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    'Meta1',
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                                  1.w),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  1.h),
                                                          child: Text(
                                                            'No',
                                                            style: TextStyle(
                                                                fontSize: 13.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontFamily:
                                                                    'Meta1',
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .black,
                                                                  border: Border
                                                                      .all(
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              )),
                                          tileColor:
                                              Colors.grey.withOpacity(0.20),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                          // : SizedBox(
                          //     height: 60.h,
                          //     child: ListView.builder(
                          //       itemCount: searchtodotraining
                          //           ?.trainningAndNoteTodos?.length,
                          //       itemBuilder: (context, index) {
                          //         return Padding(
                          //           padding: EdgeInsets.only(bottom: 2.h),
                          //           child: ListTile(
                          //             shape: RoundedRectangleBorder(
                          //                 borderRadius:
                          //                     BorderRadius.circular(10)),
                          //             title: Text(
                          //               searchtodotraining!
                          //                   .trainningAndNoteTodos![index]
                          //                   .title
                          //                   .toString(),
                          //               style: TextStyle(
                          //                   decoration: searchtodotraining!
                          //                               .trainningAndNoteTodos![
                          //                                   index]
                          //                               .isComplete ==
                          //                           1
                          //                       ? TextDecoration.lineThrough
                          //                       : TextDecoration.none,
                          //                   fontSize: 13.sp,
                          //                   fontWeight: FontWeight.w400,
                          //                   fontFamily: 'Meta1',
                          //                   color: Colors.white),
                          //             ),
                          //             subtitle: Row(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.center,
                          //               children: [
                          //                 Text(
                          //                   searchtodotraining!
                          //                       .trainningAndNoteTodos![
                          //                           index]
                          //                       .date
                          //                       .toString(),
                          //                   style: TextStyle(
                          //                       decoration: searchtodotraining!
                          //                                   .trainningAndNoteTodos![
                          //                                       index]
                          //                                   .isComplete ==
                          //                               1
                          //                           ? TextDecoration
                          //                               .lineThrough
                          //                           : TextDecoration.none,
                          //                       fontSize: 11.sp,
                          //                       fontWeight: FontWeight.w400,
                          //                       fontFamily: 'Meta1',
                          //                       color: Colors.white70),
                          //                 ),
                          //                 Text(
                          //                   ' - ',
                          //                   style: TextStyle(
                          //                       decoration: select == index
                          //                           ? TextDecoration
                          //                               .lineThrough
                          //                           : TextDecoration.none,
                          //                       fontSize: 11.sp,
                          //                       fontWeight: FontWeight.w400,
                          //                       fontFamily: 'Meta1',
                          //                       color: Colors.white70),
                          //                 ),
                          //                 Text(
                          //                   searchtodotraining!
                          //                       .trainningAndNoteTodos![
                          //                           index]
                          //                       .time
                          //                       .toString(),
                          //                   textAlign: TextAlign.justify,
                          //                   style: TextStyle(
                          //                       decoration: searchtodotraining!
                          //                                   .trainningAndNoteTodos![
                          //                                       index]
                          //                                   .isComplete ==
                          //                               1
                          //                           ? TextDecoration
                          //                               .lineThrough
                          //                           : TextDecoration.none,
                          //                       fontSize: 11.sp,
                          //                       fontWeight: FontWeight.w400,
                          //                       fontFamily: 'Meta1',
                          //                       color: Colors.white70),
                          //                 ),
                          //               ],
                          //             ),
                          //             leading: IconButton(
                          //               onPressed: () {
                          //                 searchtodotraining!
                          //                             .trainningAndNoteTodos![
                          //                                 index]
                          //                             .isComplete ==
                          //                         1
                          //                     ? Incompleteapi(index)
                          //                     : Completeapi(index);
                          //               },
                          //               icon: searchtodotraining!
                          //                           .trainningAndNoteTodos![
                          //                               index]
                          //                           .isComplete ==
                          //                       1
                          //                   ? Icon(Icons.check_box_rounded,
                          //                       color: Colors.white)
                          //                   : Icon(
                          //                       Icons
                          //                           .check_box_outline_blank_rounded,
                          //                       color: Colors.white),
                          //             ),
                          //             trailing: IconButton(
                          //                 onPressed: () {
                          //                   showDialog(
                          //                     context: context,
                          //                     builder: (context) =>
                          //                         AlertDialog(
                          //                       shape:
                          //                           RoundedRectangleBorder(
                          //                               borderRadius:
                          //                                   BorderRadius
                          //                                       .circular(
                          //                                           20),
                          //                               side: BorderSide(
                          //                                   color: Colors
                          //                                       .white)),
                          //                       backgroundColor:
                          //                           Color.fromARGB(
                          //                               255, 0, 0, 0),
                          //                       scrollable: true,
                          //                       content: Text(
                          //                         'Are You Sure You Want to to Delete ?',
                          //                         style: TextStyle(
                          //                             fontSize: 11.sp,
                          //                             fontWeight:
                          //                                 FontWeight.w400,
                          //                             fontFamily: 'Meta1',
                          //                             color: Colors.white),
                          //                       ),
                          //                       actions: [
                          //                         InkWell(
                          //                           onTap: () {
                          //                             deletetodo(index);
                          //                             Navigator.of(context)
                          //                                 .pop();
                          //                           },
                          //                           child: Container(
                          //                             margin:
                          //                                 EdgeInsets.all(
                          //                                     2.w),
                          //                             padding:
                          //                                 EdgeInsets.all(
                          //                                     1.h),
                          //                             child: Text(
                          //                               'Yes',
                          //                               style: TextStyle(
                          //                                   fontSize: 13.sp,
                          //                                   fontWeight:
                          //                                       FontWeight
                          //                                           .w400,
                          //                                   fontFamily:
                          //                                       'Meta1',
                          //                                   color: Colors
                          //                                       .green),
                          //                             ),
                          //                             decoration:
                          //                                 BoxDecoration(
                          //                                     color: Colors
                          //                                         .black,
                          //                                     border: Border
                          //                                         .all(
                          //                                       color: Colors
                          //                                           .green,
                          //                                     ),
                          //                                     borderRadius:
                          //                                         BorderRadius
                          //                                             .circular(
                          //                                                 10)),
                          //                           ),
                          //                         ),
                          //                         InkWell(
                          //                           onTap: () {
                          //                             Navigator.of(context)
                          //                                 .pop();
                          //                           },
                          //                           child: Container(
                          //                             margin:
                          //                                 EdgeInsets.all(
                          //                                     1.w),
                          //                             padding:
                          //                                 EdgeInsets.all(
                          //                                     1.h),
                          //                             child: Text(
                          //                               'No',
                          //                               style: TextStyle(
                          //                                   fontSize: 13.sp,
                          //                                   fontWeight:
                          //                                       FontWeight
                          //                                           .w400,
                          //                                   fontFamily:
                          //                                       'Meta1',
                          //                                   color:
                          //                                       Colors.red),
                          //                             ),
                          //                             decoration:
                          //                                 BoxDecoration(
                          //                                     color: Colors
                          //                                         .black,
                          //                                     border: Border
                          //                                         .all(
                          //                                       color: Colors
                          //                                           .red,
                          //                                     ),
                          //                                     borderRadius:
                          //                                         BorderRadius
                          //                                             .circular(
                          //                                                 10)),
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   );
                          //                 },
                          //                 icon: Icon(
                          //                   Icons.delete,
                          //                   color: Colors.red,
                          //                 )),
                          //             tileColor:
                          //                 Colors.grey.withOpacity(0.20),
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //   ),
                        ],
                      ),
                    ),
                  ),
                  dialogs(),
                ],
              ),
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
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

  addtodo() {
    if (_mealname.text == '' ||
        _foodname.text == '' ||
        _cal.text == '' ||
        _protine.text == '' ||
        _fat.text == '' ||
        _Quantity.text == '' ||
        _carb.text == '') {
      Fluttertoast.showToast(
        msg: 'Please Add Details',
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 11.sp,
      );
    } else {
      print(("object"));
      final Map<String, String> data = {};
      data['action'] = 'add_to_do_nutrition_and_health_app';
      data['player_id'] = userData!.userData!.uid.toString();
      data['nutrition_and_health_id'] = widget.tid.toString();
      data['meal_name'] = _mealname.text.trim().toString();
      data['food_name'] = _foodname.text.trim().toString();
      data['quantity'] = _Quantity.text.trim().toString();
      data['calories'] = _cal.text.trim().toString();
      data['protein'] = _protine.text.trim().toString();
      data['fat'] = _fat.text.trim().toString();
      data['carb'] = _carb.text.trim().toString();

      // nutrition_and_health_id
      // meal_name
      // food_name
      // quantity
      // calories
      // protein
      // carb
      // fat
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().addnutritodo(data).then((Response response) async {
            profiledata = ProfileModal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 && userData?.status == "success") {
              setState(() {
                isloading = false;
              });

              await SaveDataLocal.saveLogInData(userData!);
              print(userData?.status);
              print(userData!.userData!.uid);
              viewtodo();
              Navigator.of(context).pop();
              Fluttertoast.showToast(
                msg: 'Task Added Successfully',
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 11.sp,
              );
              _mealname.text = '';
              _foodname.text = '';
              _cal.text = '';
              _protine.text = '';
              _fat.text = '';
              _Quantity.text = '';
              _carb.text = '';

              // buildErrorDialog(context, "", "Login Successfully");
            } else {
              print('hu aya');
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

  Widget dialogs() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.black,
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
                'Add Details',
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
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
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
                        controller: _mealname,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Meal Name',
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
                        controller: _foodname,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Food Name',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 25.w,
                          margin: EdgeInsets.only(
                            bottom: 20,
                            right: 5,
                            // left: 5,
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
                            keyboardType: TextInputType.number,
                            controller: _cal,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Calorie',
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          width: 25.w,
                          margin: EdgeInsets.only(
                            bottom: 20,
                            right: 5,
                            // left: 5,
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
                            keyboardType: TextInputType.number,
                            controller: _protine,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Protine',
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 25.w,
                          margin: EdgeInsets.only(
                            bottom: 20,
                            right: 5,
                            // left: 5,
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
                            keyboardType: TextInputType.number,
                            controller: _Quantity,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Quantity',
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                        Container(
                          width: 25.w,
                          margin: EdgeInsets.only(
                            bottom: 20,
                            right: 5,
                            // left: 5,
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
                            keyboardType: TextInputType.number,
                            controller: _fat,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: 'Fat',
                                hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 60.w,
                      margin: EdgeInsets.only(
                        bottom: 20,
                        right: 5,
                        // left: 5,
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
                        keyboardType: TextInputType.number,
                        controller: _carb,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Carb',
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 1.h),
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
                          addtodo();
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
    );
  }

  viewtodo() {
    final Map<String, String> data = {};
    data['action'] = 'to_do_nutrition_and_health_app';
    data['player_id'] = userData!.userData!.uid.toString();
    data['nutrition_and_health_id'] = widget.tid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().viewnutritodo(data).then((Response response) async {
          nutrialltodo = NutritodoModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && alltodo?.status == "success") {
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

  deletetodo(int index) {
    final Map<String, String> data = {};
    data['action'] = 'nutrition_and_health_to_do_delete';

    data['to_do_id'] =
        nutrialltodo!.nutritionAndHealthTodos![index].id.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().viewtraintodoapi(data).then((Response response) async {
          alltodo = ViewtodoModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && alltodo?.status == "success") {
            Fluttertoast.showToast(
                msg: "Task Deleted Successfully",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 11.sp);
            viewtodo();
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (context) => Trainingnotespage(
            //       tid: widget.tid,
            //       tile: "Trainings & Notes",
            //       title: widget.title,
            //       desc: widget.desc),
            // ));
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

  Completeapi(int index) {
    final Map<String, String> data = {};
    data['action'] = 'nutrition_and_health_to_do_is_completed';

    data['to_do_id'] =
        nutrialltodo!.nutritionAndHealthTodos![index].id.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().NutriCompleteapi(data).then((Response response) async {
          nutrialltodo = NutritodoModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && nutrialltodo?.status == "success") {
            Fluttertoast.showToast(
                msg: "Task Completed Successfully",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 11.sp);
            viewtodo();
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (context) => Trainingnotespage(
            //       tid: widget.tid,
            //       tile: "Trainings & Notes",
            //       title: widget.title,
            //       desc: widget.desc),
            // ));
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

  searchapi() {
    final Map<String, String> data = {};
    data['action'] = 'nutrition_and_health_to_do_search';
    data['player_id'] = userData!.userData!.uid.toString();
    data['search_text'] = _search.text.trim().toString();
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        authprovider()
            .SearchNutritodoapi(data)
            .then((Response response) async {
          searchtodonutri =
              NutritodosearchModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              searchtodonutri?.status == "success") {
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

  Incompleteapi(int index) {
    final Map<String, String> data = {};
    data['action'] = 'nutrition_and_health_to_do_is_incomplete';

    data['to_do_id'] =
        nutrialltodo!.nutritionAndHealthTodos![index].id.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider()
            .nutritodoincomplete(data)
            .then((Response response) async {
          nutrialltodo = NutritodoModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && alltodo?.status == "success") {
            viewtodo();
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //   builder: (context) => Trainingnotespage(
            //       tid: widget.tid,
            //       tile: "Trainings & Notes",
            //       title: widget.title,
            //       desc: widget.desc),
            // ));
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
