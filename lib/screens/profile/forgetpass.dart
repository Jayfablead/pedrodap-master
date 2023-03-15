import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/UserModal.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:pedrodap/screens/profile/loginpage.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/const.dart';

class forgetpass extends StatefulWidget {
  const forgetpass({Key? key}) : super(key: key);

  @override
  State<forgetpass> createState() => _forgetpassState();
}

class _forgetpassState extends State<forgetpass> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int setup = 0;
  bool isLodaing = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        elevation: 00,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        title: Text(
          "Forget Password",
          style: TextStyle(color: Colors.white, fontFamily: 'Meta1'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(5.w),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    Text(
                      "Forget Password",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Meta1'),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      "Please fill the input below here",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Meta1'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: (setup != 1)
                        ? Colors.white.withOpacity(0.15)
                        : Colors.white.withOpacity(0.15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 47.0, bottom: 0.0, top: 1.0),
                          child: Text(
                            "",
                            style: TextStyle(
                                color: Colors.grey.shade300,
                                fontFamily: 'Meta1',
                                fontSize: 10.sp),
                          )),
                      SizedBox(
                        height: 4.h,
                        child: TextFormField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Meta1',
                                fontSize: 12.sp),
                            onTap: () {},
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
                                return "                Enter Your Email";
                              } else {
                                //If email address matches pattern
                                return null;
                              }
                            },
                            decoration: inputDecoration(
                              hintText: "Email",
                              icon: Icon(
                                Icons.email_outlined,
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
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (_email.text == '') {
                        setState(() {
                          EasyLoading.showError('Enter Mail Address...');
                        });
                      } else {
                        setState(() {
                          EasyLoading.show(status: 'Sending Email...');
                        });
                        forgetpwdapi();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 50.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.sp)),
                      child: Text(
                        "Send",
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
                  height: 30.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Remember last Password ?",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade500,
                          fontFamily: 'Meta1',
                          fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
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

  InputDecoration inputDecoration(
      {required String hintText, required Icon icon}) {
    return InputDecoration(
      hoverColor: Colors.white,
      focusColor: Colors.white,
      filled: false,
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

  forgetpwdapi() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['forgotEmail'] = _email.text.trim().toString();
      data['action'] = 'forgot_password';
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().loginapi(data).then((Response response) async {
            print(response.statusCode);
            userData = UserModal.fromJson(json.decode(response.body));

            if (response.statusCode == 200 &&
                userData!.status == "Check your mail!") {
              setState(() async {
                EasyLoading.showSuccess(' Check Your Mailbox !');

                // Fluttertoast.showToast(
                //   msg: "Check Your MailBox",
                //   textColor: Colors.black,
                //   toastLength: Toast.LENGTH_SHORT,
                //   timeInSecForIosWeb: 1,
                //   gravity: ToastGravity.BOTTOM,
                //   backgroundColor: Color.fromARGB(255, 102, 181, 63),
                // );
                _email.clear();
                Navigator.pop(context);
                isLodaing = false;
              });

              _email.text = "";
            } else {
              EasyLoading.showError("Enter A Valid Email Address !!");

              // Fluttertoast.showToast(
              //   msg: "Enter A Valid Email Address",
              //   textColor: Colors.white,
              //   toastLength: Toast.LENGTH_SHORT,
              //   timeInSecForIosWeb: 1,
              //   gravity: ToastGravity.BOTTOM,
              //   backgroundColor: Colors.indigo,
              // );
            }
          });
        } else {
          setState(() {});
        }
      });
    }
  }
}
