// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:pedrodap/Widget/Drawer.dart';
// import 'package:sizer/sizer.dart';

// class FitnessProgramme extends StatefulWidget {
//   const FitnessProgramme({super.key});

//   @override
//   State<FitnessProgramme> createState() => _FitnessProgrammeState();
// }

// final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

// class _FitnessProgrammeState extends State<FitnessProgramme> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: drawer(),
//       key: _scaffoldKey,
//       backgroundColor: Colors.black,
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 4.w),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 3.h),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.of(context).pop(context);
//                     },
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     'Fitness Programme',
//                     style: TextStyle(
//                       fontSize: 5.5.w,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'Meta1',
//                       color: Color(0xffffffff),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       _scaffoldKey.currentState?.openDrawer();
//                     },
//                     icon: Icon(
//                       Icons.menu,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedrodap/Model/todo.dart';

import 'package:sizer/sizer.dart';
import '../../Widget/Drawer.dart';
import '../../Widget/color.dart';

class NutriHealth extends StatefulWidget {
  String? title;
  String? desc;

  NutriHealth({Key? key, this.desc, this.title}) : super(key: key);

  @override
  State<NutriHealth> createState() => _NutriHealthState();
}

class _NutriHealthState extends State<NutriHealth> {
  List name = [
    'Breakfast',
    'Lunch',
    'Dinner',
  ];
  List msg = [
    'Cerial & Milk',
    'Butter Chicken & Rice,',
    'White Fish With Chopped Boiled Cabbage',
  ];

  List time = [
    '7:54 am',
    '1:00 pm',
    '9:45 pm',
  ];
  final todosList = ToDo1.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _time = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _cal = TextEditingController();
  TextEditingController _protine = TextEditingController();
  TextEditingController _fat = TextEditingController();
  TextEditingController _carb = TextEditingController();
  TextEditingController _Quantity = TextEditingController();
  TextEditingController _mealname = TextEditingController();
  TextEditingController _foodname = TextEditingController();

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
                  Container(
                    color: Colors.black,
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
                              'Nutrition & Health',
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
                        Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(
                    height: 52.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
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
                                            color:
                                                Colors.white.withOpacity(0.90)),
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
                                SizedBox(
                                  height: 1.h,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: name.length,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 1.h),
              width: 50.w,
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
                                  hintText: 'Add Meal Name',
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
                                  hintText: 'Add Food Name',
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
                              controller: _time,
                              readOnly: true,
                              onTap: () {
                                timepicker();
                              },
                              style: TextStyle(color: Colors.white),
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
                            width: 25.w,
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

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.20),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        onChanged: (value) => _runFilter(value),
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
          hintStyle: TextStyle(color: Colors.white),
        ),
      ),
    );

    Widget searchBox() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.20),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          style: TextStyle(color: Colors.white),
          onChanged: (value) => _runFilter(value),
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
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }
}
