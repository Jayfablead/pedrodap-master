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
import 'package:pedrodap/Widget/todo_items.dart';
import 'package:sizer/sizer.dart';
import '../../Widget/Drawer.dart';
import '../../Widget/color.dart';

class Home extends StatefulWidget {
  String? title;
  String? desc;
  String? tile;

  Home({Key? key, this.desc, this.title, this.tile}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  List title = [
    'Lorem Ipsum is simply dummy text.',
    'typesetting industry Lorem Ipsum.',
    'typesetting industry Lorem Ipsum.',
    'typesetting industry Lorem Ipsum.',
    'Lorem Ipsum is simply dummy text.',
  ];
  List subtitle = [
    '8 pm',
    '6 pm',
    '4 pm',
    '12 pm',
    '8 am',
  ];
  List date = [
    '17-03-23',
    '17-03-23',
    '16-03-23',
    '15-03-23',
    '14-03-23',
  ];
  bool istap = false;
  int? select;
  TextEditingController _title = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController _time = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Stack(
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
                      itemCount: title.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            title: Text(
                              title[index],
                              style: TextStyle(
                                  decoration: select == index
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Meta1',
                                  color: Colors.white),
                            ),
                            subtitle: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  date[index],
                                  style: TextStyle(
                                      decoration: select == index
                                          ? TextDecoration.lineThrough
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
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Meta1',
                                      color: Colors.white70),
                                ),
                                Text(
                                  subtitle[index],
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      decoration: select == index
                                          ? TextDecoration.lineThrough
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
                                setState(() {
                                  select = index;
                                });
                              },
                              icon: select == index
                                  ? Icon(
                                      Icons.check_box_rounded,
                                      color: Colors.white,
                                    )
                                  : Icon(Icons.check_box_outline_blank_rounded,
                                      color: Colors.white),
                            ),
                            trailing: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                            tileColor: Colors.grey.withOpacity(0.20),
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
              color: Colors.black,
              child: Container(
                child: ElevatedButton(
                  child: SizedBox(
                    width: 82.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add Todo',
                          style: TextStyle(
                            fontFamily: 'Meta1',
                            fontSize: 14.sp,
                          ),
                        ),
                        Text(
                          ' +',
                          style: TextStyle(
                            fontFamily: 'Meta1',
                            fontSize: 19.sp,
                          ),
                        ),
                      ],
                    ),
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
                                controller: _title,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      CupertinoIcons.info,
                                      color: Colors.white,
                                    ),
                                    hintText: '   Title ',
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
                                controller: dateController,
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          DateTime.now(), //get today's date
                                      firstDate: DateTime(
                                          2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd').format(
                                            pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2022-07-04
                                    //You can format date as per your need

                                    setState(() {
                                      dateController.text =
                                          formattedDate; //set foratted date to TextField value.
                                    });
                                  } else {
                                    print("Date is not selected");
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      CupertinoIcons.calendar_badge_plus,
                                      color: Colors.white,
                                    ),
                                    hintText: '   Date',
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
                                controller: _time,
                                readOnly: true,
                                onTap: () {
                                  timepicker();
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      CupertinoIcons.timer,
                                      color: Colors.white,
                                    ),
                                    hintText: '   Time',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 1.h),
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                    minimumSize: Size(7.h, 13.w),
                    elevation: 10,
                  ),
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
      setState(() {
        _time.text = formattedTime;
      });
    } else {
      print("Time is not selected");
    }
  }
}
