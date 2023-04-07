import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:sizer/sizer.dart';

import '../Model/UserModal.dart';
import '../Widget/buildErrorDialog.dart';
import '../Widget/const.dart';
import '../Widget/sharedpreferance.dart';
import '../provider/authprovider.dart';
import '../screens/profile/loginpage.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _oldpass = TextEditingController();
  TextEditingController _newpass = TextEditingController();
  TextEditingController _confirmpass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int setup = 1;
  bool secure = false;
  bool visible = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup == 0;
    visible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(),
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.all(5.w),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 5.w,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Meta1",
                        color: Color(0xffeaeaea),
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
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Change Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Meta1'),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: (setup != 1)
                        ? Colors.transparent
                        : Colors.white.withOpacity(0.15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 47.0, bottom: 0.0, top: 1.0),
                          child: (setup == 1)
                              ? Text(
                                  "",
                                  style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontFamily: 'Meta1',
                                      fontSize: 12.sp),
                                )
                              : Container()),
                      SizedBox(
                        height: 4.h,
                        child: TextFormField(
                            controller: _oldpass,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Meta1',
                                fontSize: 12.sp),
                            onTap: () {
                              setState(() {
                                setup = 1;
                              });
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
                                return "            Enter Old Password";
                              } else {
                                //If email address matches pattern
                                return null;
                              }
                            },
                            decoration: inputDecoration(
                              ico: IconButton(
                                  onPressed: () {}, icon: Icon(null)),
                              hintText: "Old Password",
                              icon: Icon(
                                Icons.lock_clock,
                                color: Colors.grey.shade500,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: (setup != 1)
                        ? Colors.transparent
                        : Colors.white.withOpacity(0.15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 47.0, bottom: 0.0, top: 1.0),
                          child: (setup == 1)
                              ? Text(
                                  "",
                                  style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontFamily: 'Meta1',
                                      fontSize: 12.sp),
                                )
                              : Container()),
                      SizedBox(
                        height: 4.h,
                        child: TextFormField(
                            // obscureText: visible,
                            // obscuringCharacter: '*',
                            controller: _newpass,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Meta1',
                                fontSize: 12.sp),
                            validator: (value) {
                              setState(() {
                                value;
                              });
                              if (value!.isEmpty) {
                                return "            Enter New Password";
                              }
                              return null;
                            },
                            decoration: inputDecoration(
                              ico: IconButton(
                                  onPressed: () {}, icon: Icon(null)),
                              hintText: "New Password",
                              // ico: IconButton(
                              //   onPressed: () {
                              //     setState(() {
                              //       visible = !visible;
                              //       print(visible);
                              //       print('Ouch');
                              //     });
                              //   },
                              //   icon: visible
                              //       ? Icon(
                              //           Icons.visibility,
                              //           size: 15.sp,
                              //           color: Colors.white,
                              //         )
                              //       : Icon(
                              //           Icons.visibility_off,
                              //           size: 15.sp,
                              //           color: Colors.white,
                              //         ),
                              // ),
                              icon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: (setup != 1)
                        ? Colors.transparent
                        : Colors.white.withOpacity(0.15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 47.0, bottom: 0.0, top: 1.0),
                          child: (setup == 1)
                              ? Text(
                                  "",
                                  style: TextStyle(
                                      color: Colors.grey.shade300,
                                      fontFamily: 'Meta1',
                                      fontSize: 12.sp),
                                )
                              : Container()),
                      SizedBox(
                        height: 4.h,
                        child: TextFormField(
                            controller: _confirmpass,
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Meta1',
                                fontSize: 12.sp),
                            onTap: () {
                              setState(() {
                                setup = 1;
                              });
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
                                return "            Enter Confirm Password";
                              } else {
                                //If email address matches pattern
                                return null;
                              }
                            },
                            decoration: inputDecoration(
                              ico: IconButton(
                                  onPressed: () {}, icon: Icon(null)),
                              hintText: "Confirm Password",
                              icon: Icon(
                                Icons.lock_open_outlined,
                                color: Colors.grey.shade500,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      changepass();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp)),
                      child: Text(
                        "Submit",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontFamily: 'Meta1',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
      color: Colors.grey.shade500, fontSize: 12.sp, fontFamily: 'Meta1');

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

      prefixIcon: Padding(padding: EdgeInsets.only(bottom: 3.3.h), child: icon),
      contentPadding: EdgeInsets.symmetric(vertical: 3.h),
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

  changepass() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['old_password'] = _oldpass.text.trim().toString();
      data['uid'] = userData!.userData!.uid.toString();
      data['confirm_password'] = _confirmpass.text.trim().toString();
      data['new_password'] = _newpass.text.trim().toString();
      data['action'] = 'change_password_app';

      checkInternet().then((internet) async {
        if (internet) {
          authprovider().Changepassapi(data).then((Response response) async {
            userData = UserModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && userData?.status == "success") {
              setState(() {
                // isLoading = false;
              });
              await SaveDataLocal.saveLogInData(userData!);
              print("++++++++++++++++++++" + "${userData?.status}");

              // buildErrorDialog(context, "", "Login Successfully");

              if (_newpass.text == _confirmpass.text) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => loginpage()));
                _oldpass.text = '';

                _newpass.text = '';
                _confirmpass.text = '';
                Fluttertoast.showToast(
                    msg:
                        "Password Changed Successfully Now Login With New Password",
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                print("================================================" +
                    "ouch");
              } else {
                buildErrorDialog(context, "Error", "Password Dosen't Match");
              }
            } else {
              buildErrorDialog(
                  context, "Error", "Please Enter Valid Old Password");
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
