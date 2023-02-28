import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:sizer/sizer.dart';

class editTrainerpersonalprofile extends StatefulWidget {
  String? name;
  String? email;
  String? phone;
  String? exp;
  String? about;
  String? from;
  String? to;

  editTrainerpersonalprofile(
      {Key? key,
        this.name,
        this.about,
        this.email,
        this.exp,
        this.phone,
        this.from,
        this.to})
      : super(key: key);

  @override
  State<editTrainerpersonalprofile> createState() =>
      _editTrainerpersonalprofileState();
}

TextEditingController _name = TextEditingController();
TextEditingController _about = TextEditingController();
TextEditingController _phone = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _exp = TextEditingController();
TextEditingController _from = TextEditingController();
TextEditingController _to = TextEditingController();

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _editTrainerpersonalprofileState
    extends State<editTrainerpersonalprofile> {
  @override
  void initState() {
    super.initState();
    _name.text = widget.name.toString();
    _email.text = widget.email.toString();
    _phone.text = widget.phone.toString();
    _from.text = widget.from.toString();
    _to.text = widget.to.toString();
    _exp.text = widget.exp.toString();
    _about.text = widget.about.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          drawer: drawer(),
          backgroundColor: Color(0xff131313),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
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
                        "Edit Trainer Profile",
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
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Name : ",
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
                      controller: _name,
                      cursorColor: Colors.white,
                      style: textStyle,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Name', hintStyle: textStyle1),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "E-Mail : ",
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
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      style: textStyle,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Email', hintStyle: textStyle1),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Phone : ",
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
                    child: IntlPhoneField(
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      style: textStyle,
                      dropdownTextStyle: textStyle,

                      decoration: InputDecoration(
                          hintText: 'Enter Your Phone no', hintStyle: textStyle1),

                      validator: (value) {
                        if (value?.number.length != 10) {
                          return "Enter 10 digit Mobile Number";
                        } else if (value!.number.isEmpty) {
                          return "Enter the  Mobile Number";
                        }
                        return null;
                      },

                      showCountryFlag: false,
                      disableLengthCheck: true,
                      initialCountryCode: "IN",
                      showDropdownIcon: false,
                      // dropdownIconPosition: IconPosition.trailing,
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Availability : ",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 7.h,
                        width: MediaQuery.of(context).size.width * 0.30,
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white.withOpacity(0.15),
                        ),
                        child: TextField(onTap: timepick,
                          readOnly: true,
                          controller: _from,
                          cursorColor: Colors.white,
                          style: textStyle,
                          decoration: InputDecoration( prefixIcon: Icon(
                            Icons.access_time_rounded,
                            color: Colors.white,
                          ),
                              suffix: Text('Am'),
                              hintText: 'From', hintStyle: textStyle1),
                        ),
                      ),
                      Text(
                        'To',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp),
                      ),
                      Container(
                        height: 7.h,
                        width: MediaQuery.of(context).size.width * 0.30,
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white.withOpacity(0.15),
                        ),
                        child: TextField(onTap: timepick1,
                          readOnly: true,
                          controller: _to,
                          cursorColor: Colors.white,
                          style: textStyle,
                          decoration: InputDecoration( prefixIcon: Icon(
                            Icons.access_time_rounded,
                            color: Colors.white,
                          ),
                              suffix: Text('Pm'),
                              hintText: 'To', hintStyle: textStyle1),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Experince : ",
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
                      controller: _exp,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      style: textStyle,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Experince ', hintStyle: textStyle1),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About You : ",
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
                      Container(
                        height: 12.h,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.white.withOpacity(0.15),
                        ),
                        child: TextField(
                          controller: _about,
                          maxLines: 3,
                          cursorColor: Colors.white,
                          style: textStyle,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 1.5.h),
                              hintText: 'Tell us Who Are You',
                              hintStyle: textStyle1),
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
                ],
              ),
            ),
          ),
        ));
  }

  TextStyle textStyle =
  TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: "Poppins");

  TextStyle textStyle1 =
  TextStyle(color: Colors.grey, fontSize: 12.sp, fontFamily: "Poppins");

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
      String formattedTime = DateFormat('HH').format(parsedTime);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      setState(() {
        _from = TextEditingController(text: "$formattedTime");
      });
    } else {
      print("Time is not selected");
    }
  }

  void timepick1() async {
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
      String formattedTime = DateFormat('HH').format(parsedTime);
      print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.
      setState(() {
        _to = TextEditingController(text: "$formattedTime");
      });
    } else {
      print("Time is not selected");
    }
  }
}
