import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/UserModal.dart';
import 'package:pedrodap/Model/clubidmodal.dart';
import 'package:pedrodap/Widget/buildErrorDialog.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/Widget/donedialog.dart';
import 'package:pedrodap/Widget/sharedpreferance.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:pedrodap/screens/others/feedpage.dart';
import 'package:pedrodap/screens/profile/loginpage.dart';
import 'package:sizer/sizer.dart';

import '../../statichomepage.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController _user = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _conf = TextEditingController();
  TextEditingController _ocup = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int setup = 1;
  int setupclub = 1;
  List<String> _locations = [
    'Coach',
    'Scouts',
    'Medicals',
    'Nutritionists',
    'Fitness Instructors',
    'Personal Trainers',
    'Player'
  ];

  // Option 2
  List<String> _clubs = [];
  String? _selectedLocation; // Option 2
  String? _selectedClub; // Option 2
  bool visible = true;
  bool visible1 = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    clubsapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(5.w),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Meta1'),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        "Please fill the input below here",
                        style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Meta1'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: Colors.white.withOpacity(0.15),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 0.5.h),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          offset: Offset(0, 10),
                          dropdownDecoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(14),
                              // color: Colors.black,
                              color: Colors.black),
                          hint: Row(
                            children: [
                              Icon(
                                Icons.face_unlock_rounded,
                                color: Colors.grey.shade500,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                'Choose a Type',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Meta1',
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                          // Not necessary for Option 1
                          value: _selectedLocation,
                          onChanged: (newValue) {
                            setState(() {
                              setup = 1;
                              _selectedLocation = newValue!;
                            });
                          },
                          items: _locations.map((location) {
                            return DropdownMenuItem(
                              child: Text(
                                location,
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Meta1',
                                    fontSize: 12.sp),
                              ),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: Colors.white.withOpacity(0.15),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 0.5.h),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          dropdownMaxHeight: 45.h,
                          offset: Offset(0, 10),
                          dropdownDecoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(14),
                              // color: Colors.black,
                              color: Colors.black),
                          hint: Row(
                            children: [
                              Icon(
                                Icons.people_alt_outlined,
                                color: Colors.grey.shade500,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                'Choose your Club',
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Meta1',
                                    fontSize: 12.sp),
                              ),
                            ],
                          ),
                          // Not necessary for Option 1
                          value: _selectedClub,
                          onChanged: (clubvalue) {
                            setState(() {
                              setupclub = 1;
                              _selectedClub = clubvalue!.toString();
                              print(_selectedClub);
                            });
                          },
                          items: cludid?.allClubsFetch?.map((location) {
                            return DropdownMenuItem(
                              child: Text(
                                location.name.toString(),
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontFamily: 'Meta1',
                                    fontSize: 12.sp),
                              ),
                              value: location.uid,
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 8.h,
                      padding: EdgeInsets.only(bottom: 2.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                          controller: _user,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Meta1',
                              fontSize: 12.sp),
                          onTap: () {
                            setState(() {
                              setup = 1;
                            });
                            print(setup);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "            Enter Your User Name";
                            }
                            return null;
                          },
                          decoration: inputDecoration(
                            ico: IconButton(onPressed: () {}, icon: Icon(null)),
                            hintText: "Name",
                            icon: Icon(
                              Icons.person,
                              color: Colors.grey.shade500,
                              size: 15.sp,
                            ),
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 8.h,
                  padding: EdgeInsets.only(bottom: 2.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                      controller: _phone,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Meta1',
                          fontSize: 12.sp),
                      onTap: () {
                        setState(() {
                          setup = 1;
                        });
                        print(setup);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "            Enter Your phonenumber";
                        }
                        return null;
                      },
                      decoration: inputDecoration(
                        ico: IconButton(
                          onPressed: () {},
                          icon: Icon(null),
                        ),
                        hintText: "Phone Number",
                        icon: Icon(
                          Icons.phone_android,
                          color: Colors.grey.shade500,
                          size: 15.sp,
                        ),
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 8.h,
                  padding: EdgeInsets.only(bottom: 2.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                      controller: _ocup,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Meta1',
                          fontSize: 12.sp),
                      onTap: () {
                        setState(() {
                          setup = 1;
                        });
                        print(setup);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return _selectedLocation == 'Player' ?"            Enter Your Position":"            Enter Your Occupation";
                        }
                        return null;
                      },
                      decoration: inputDecoration(
                        ico: IconButton(
                          onPressed: () {},
                          icon: Icon(null),
                        ),
                        hintText: _selectedLocation == 'Player' ?"Position":"Occupation",
                        icon: Icon(
                          _selectedLocation == 'Player' ?Icons.sports_handball:Icons.work_outline_rounded,
                          color: Colors.grey.shade500,
                          size: 15.sp,
                        ),
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 8.h,
                  padding: EdgeInsets.only(bottom: 2.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Meta1',
                          fontSize: 12.sp),
                      onTap: () {
                        setState(() {
                          setup = 1;
                        });
                        print(setup);
                      },
                      validator: (value) {
                        String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                            "\\@" +
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                            "(" +
                            "\\." +
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                            ")+";
                        //Convert string p to a RegEx
                        RegExp regExp = RegExp(p);
                        if (value!.isEmpty) {
                          return "            Enter Your Email";
                        } else {
                          //If email address matches pattern
                          return null;
                        }
                      },
                      decoration: inputDecoration(
                        ico: IconButton(
                          onPressed: () {},
                          icon: Icon(null),
                        ),
                        hintText: "Email",
                        icon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey.shade500,
                          size: 15.sp,
                        ),
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 8.h,
                  padding: EdgeInsets.only(bottom: 2.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                      obscureText: visible,
                      obscuringCharacter: '*',
                      controller: _pass,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Meta1',
                          fontSize: 12.sp),
                      onTap: () {
                        setState(() {
                          setup = 1;
                        });
                        print(setup);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "            Enter Your Password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        // fillColor: Colors.red,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        filled: false,

                        errorStyle: TextStyle(
                          color: Colors.red,
                        ),
                        isDense: true,
                        hintText: "Password",
                        suffixIconColor: Colors.white,
                        suffix: Padding(
                          padding: EdgeInsets.only(top: 1.5.h),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                visible = !visible;
                                print(visible);
                                print('Ouch');
                              });
                            },
                            icon: visible
                                ? Icon(
                                    Icons.visibility,
                                    size: 15.sp,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    size: 15.sp,
                                    color: Colors.white,
                                  ),
                          ),
                        ),

                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(bottom: 3.h),
                        prefixIconColor: Colors.purple,
                        hintStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.sp)),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.sp)),
                            borderSide: BorderSide.none),
                      )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 8.h,
                  padding: EdgeInsets.only(bottom: 1.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                      obscureText: visible1,
                      obscuringCharacter: '*',
                      controller: _conf,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Meta1',
                          fontSize: 12.sp),
                      onTap: () {
                        setState(() {
                          setup = 1;
                        });
                        print(setup);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "            Enter Your Confirm Password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        // fillColor: Colors.red,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        filled: false,

                        errorStyle: TextStyle(
                          color: Colors.red,
                        ),
                        isDense: true,
                        hintText: "Confirm Password",
                        suffixIconColor: Colors.white,
                        suffix: Padding(
                          padding: EdgeInsets.only(top: 1.5.h),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                visible1 = !visible1;
                                print(visible1);
                                print('Ouch');
                              });
                            },
                            icon: visible
                                ? Icon(
                                    Icons.visibility,
                                    size: 15.sp,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    size: 15.sp,
                                    color: Colors.white,
                                  ),
                          ),
                        ),

                        prefixIcon: Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                        ),
                        contentPadding: EdgeInsets.only(bottom: 3.h),
                        prefixIconColor: Colors.purple,
                        hintStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.sp)),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.sp)),
                            borderSide: BorderSide.none),
                      )),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      signup();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp)),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontFamily: 'Meta1',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account ?",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade500,
                          fontFamily: 'Meta1',
                          fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => loginpage()));
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontFamily: 'Meta1',
                              fontWeight: FontWeight.normal),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
    color: Colors.grey.shade500,
    fontSize: 12.sp,
  );

  InputDecoration inputDecoration({
    required String hintText,
    required Icon icon,
    required IconButton ico,
  }) {
    return InputDecoration(
      // fillColor: Colors.red,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      filled: false,

      errorStyle: TextStyle(
        color: Colors.red,
      ),
      isDense: true,
      hintText: hintText,
      suffixIconColor: Colors.white,
      suffix: ico,

      prefixIcon: Padding(
        padding: EdgeInsets.only(top: 2.5.h),
        child: icon,
      ),
      contentPadding: EdgeInsets.only(bottom: 3.h),
      prefixIconColor: Colors.purple,
      hintStyle: textStyle,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.sp)),
          borderSide: BorderSide.none),
    );
  }

  loginapi() {
    print('helooo');
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['email'] = _email.text.trim().toString();
      data['password'] = _pass.text.trim().toString();
      data['action'] = 'login_app';

      checkInternet().then((internet) async {
        if (internet) {
          authprovider().loginapi(data).then((Response response) async {
            userData = UserModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && userData?.status == "success") {
              await SaveDataLocal.saveLogInData(userData!);
              print(userData?.status);

              // buildErrorDialog(context, "", "Login Successfully");
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => FeedPage()));
                _email.text = '';
                _pass.text = '';
              }
            } else {
              buildErrorDialog(context, "Error", "Email or Password Invalid");
            }
          });
        } else {
          setState(() {
            // isLoading = false;
          });
          buildErrorDialog(context, 'Error', "Internate Required");
        }
      });
    }
  }

  clubsapi() {
    print('Clubs');

    final Map<String, String> data = {};
    // data['email'] = _email.text.trim().toString();
    // data['password'] = _pass.text.trim().toString();
    data['action'] = 'all_clubs_for_signup';

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().loginapi(data).then((Response response) async {
          cludid = Clubidmodal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && cludid?.status == "success") {
            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      }
    });
  }

  signup() {
    print(_selectedLocation);
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['name'] = _user.text.trim().toString();
      data['type'] = (_selectedLocation == "Coach")
          ? "3"
          : (_selectedLocation == "Scouts")
              ? "5"
              : (_selectedLocation == "Medicals")
                  ? "6"
                  : (_selectedLocation == 'Nutritionists')
                      ? "7"
                      : (_selectedLocation == 'Fitness Instructors')
                          ? "8"
                          : (_selectedLocation == 'Personal Trainers')
                              ? "9"
                              : "2";
      data['email'] = _email.text.trim().toString();
      data['password'] = _pass.text.trim().toString();
      data['occupation'] = _ocup.text.trim().toString();
      data['club_id'] = _selectedClub.toString();
      data['action'] = 'signup_app';

      checkInternet().then((internet) async {
        if (internet) {
          authprovider().signupapi(data).then((Response response) async {
            userData = UserModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && userData?.status == "success") {
              setState(() {
                // isLoading = false;
              });
              await SaveDataLocal.saveLogInData(userData!);
              print(userData?.status);

              // buildErrorDialog(context, "", "Login Successfully");

              if (_pass.text == _conf.text) {
                loginapi();
              } else {
                buildErrorDialog(context, "Error", "Password Dosen't Match");
              }
            } else {
              buildErrorDialog(
                  context, "Error", "Invalid Details Check Detials");
            }
          });
        } else {
          setState(() {
            // isLoading = false;
          });
          buildErrorDialog(context, 'Error', "Internate Required");
        }
      });
    }
  }
}
