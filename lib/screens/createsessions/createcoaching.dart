import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/Widget/dropdown.dart';
import 'package:pedrodap/screens/profile/Chatpage.dart';
import 'package:sizer/sizer.dart';

class CreateCoaching extends StatefulWidget {
  const CreateCoaching({Key? key}) : super(key: key);

  @override
  State<CreateCoaching> createState() => _CreateCoachingState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
double? rate;
List time = [
  '9:00 AM',
  '10:00 AM',
  '11:00 AM',
  '12:00 AM',
  '1:00 AM',
  '3:00 AM',
  '4:00 AM',
  '5:00 AM',
];
TextEditingController _date = TextEditingController();
TextEditingController _time = TextEditingController();
TextEditingController _detail = TextEditingController();
TextEditingController _desc = TextEditingController();
class _CreateCoachingState extends State<CreateCoaching> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        key: _scaffoldKey,
        backgroundColor: Color(0xff131313),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    // SizedBox(width: 25.w,),
                    Text(
                      "Create Coaching Session",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ))
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Players",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        InkWell(
                          onTap: _showMultiSelect,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.cyanAccent),
                            height: 5.5.h,
                            width: MediaQuery.of(context).size.width * 0.40,
                            child: Text(
                              "Choose Players",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Coaching Heading",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 7.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white.withOpacity(0.15),
                  ),
                  child: TextField(controller: _detail,
                    cursorColor: Colors.white,
                    style: textStyle,
                    decoration: InputDecoration(
                        hintText: 'Add Details', hintStyle: textStyle1),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Select Date",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 7.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white.withOpacity(0.15),
                  ),
                  child: TextField(
                    readOnly: true,
                    controller: _date,
                    onTap: datepick,
                    style: textStyle,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        hintText: 'Select A Date', hintStyle: textStyle1),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Select Time",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 7.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white.withOpacity(0.15),
                  ),
                  child: TextField(readOnly: true,
                    controller: _time,
                    onTap: timepick,
                    cursorColor: Colors.white,
                    style: textStyle,
                    decoration: InputDecoration(
                        hintText: 'Pick a Time', hintStyle: textStyle1),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Description",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 7.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white.withOpacity(0.15),
                  ),
                  child: TextField(controller: _desc,
                    cursorColor: Colors.white,
                    style: textStyle,
                    decoration: InputDecoration(
                        hintText: 'Add Description', hintStyle: textStyle1),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.cyanAccent),
                  height: 7.h,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Submit",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.normal,
                        fontSize: 15.sp),
                  ),
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

  TextStyle textStyle1 =
  TextStyle(color: Colors.grey, fontSize: 12.sp, fontFamily: "Poppins");

  void datepick() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      //get today's date
      firstDate: DateTime(2020),
      //DateTime.now() - not to allow to choose before today.
      lastDate: DateTime(2999),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.cyan.shade900, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.black, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      setState(() {
        _date = TextEditingController(text: "$formattedDate");
      });
    } else {
      print("Date is not selected");
    }
  }

  void timepick() async {
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
        _time = TextEditingController(text: "$formattedTime");
      });
    } else {
      print("Time is not selected");
    }
  }
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

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'Cr7',
      'Lionel Messi',
      'Neymar',
      'Lewandoski',
      'Suarez',
    ];
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );
  }

  void _showMultiSelect1() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> items = [
      'Plans',
      'Training Seesions',
      'Aim for Help',
      'Improve the Game',
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );
  }
}
