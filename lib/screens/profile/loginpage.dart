import 'package:flutter/material.dart';
import 'package:pedrodap/screens/profile/signuppage.dart';

import 'package:sizer/sizer.dart';

import 'forgetpass.dart';
import 'mainpage.dart';

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);
  @override
  State<loginpage> createState() => _loginpageState();
}
class _loginpageState extends State<loginpage> {
  TextEditingController _email= TextEditingController(text: "");
  TextEditingController _pass = TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();
  int setup=1;
  bool secure = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup == 0;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xff131313),
          body: Container(
            padding: EdgeInsets.all(5.w),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 7.h,),
                    Center(child: Image.asset("assets/login.png",height: 20.h,width: 30.h,fit: BoxFit.cover,)),
                  Divider(
                    color: Colors.grey.shade500,
                  ),
                    SizedBox(height: 1.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold,fontFamily: "Poppins"),),
                    ),
                    SizedBox(height: 1.h,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Please sign in to Continue",style: TextStyle(color: Colors.grey.shade700,fontSize: 12.sp,fontWeight: FontWeight.normal,fontFamily: "Poppins"),),
                    ),
                    SizedBox(height: 5.h,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: (setup != 1)? Colors.transparent:Colors.white.withOpacity(0.15) ,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(left:47.0,bottom: 0.0,top: 1.0),
                            child: (setup==1)?Text("Email",style: TextStyle(
                                color: Colors.grey.shade300,fontFamily: "Poppins",fontSize: 10.sp
                            ),):Container()
                          ),
                          SizedBox(
                            height: 4.h,
                            child: TextFormField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                color: Colors.white,fontFamily: "Poppins",fontSize: 12.sp
                              ),
                                onTap: (){
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
                                  return "Enter Your Email";
                                } else {
                                  //If email address matches pattern
                                  return null;
                                }
                              },
                            decoration: inputDecoration(hintText: "Email",
                              icon: Icon(Icons.email_outlined,color: Colors.grey.shade500
                                  ,),
                            )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 3.h,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 0.5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.sp),
                        color: (setup != 1)? Colors.transparent:Colors.white.withOpacity(0.15) ,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding:  EdgeInsets.only(left:47.0,bottom: 0.0,top: 1.0),
                              child: (setup==1)?Text("Password",style: TextStyle(
                                  color: Colors.grey.shade300,fontFamily: "Poppins",fontSize: 10.sp
                              ),):Container()
                          ),
                          SizedBox(
                            height: 4.h,
                            child: TextFormField(
                                controller: _pass,
                                keyboardType: TextInputType.text,
                                style: TextStyle(
                                    color: Colors.white,fontFamily: "Poppins",fontSize: 12.sp
                                ),
                                onTap: (){
                                  setState(() {
                                    setup = 1;
                                  });
                                 print(setup);
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Your Password";
                                  }
                                    return null;

                                },
                                decoration: inputDecoration(hintText: "Password",
                                  icon: Icon(Icons.lock,color: Colors.grey.shade500
                                    ,),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>mainpage()));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 50.w,
                          height: 7.h,
                          decoration:BoxDecoration(
                            color: Color(0xff0DF5E3),
                            borderRadius: BorderRadius.circular(20.sp)
                          ) ,
                          child: Text("LOGIN",style:TextStyle(fontSize: 14.sp,color: Colors.black,fontFamily: "Poppins",fontWeight: FontWeight.bold) ,),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.3.h,),
                    Center(
                      child: TextButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>forgetpass()));
                        },
                        child: Text("Forgot Password?",style:TextStyle(fontSize: 12.sp,color:Color(0xff0DF5E3),fontFamily: "Poppins",fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline
                        ) ,),
                      ),
                    ),
                    SizedBox(height:8.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("Don't have an account ?",style:TextStyle(fontSize: 12.sp,color:Colors.grey.shade500,fontFamily: "Poppins",fontWeight: FontWeight.normal) ,),
                         TextButton(
                             onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signup()));
                             },
                             child: Text("Sign Up",style:TextStyle(fontSize: 12.sp,color:Color(0xff0DF5E3),fontFamily: "Poppins",fontWeight: FontWeight.normal) ,)),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
    ));
  }
  TextStyle textStyle = TextStyle(
    color: Colors.grey.shade500,
    fontSize: 12.sp,
    fontFamily: "Poppins"
  );

  InputDecoration inputDecoration({required String hintText,
    required Icon icon}) {
    return InputDecoration(
      // fillColor: Colors.red,
      hoverColor: Colors.white,
      focusColor: Colors.white,
      filled: false,
      errorStyle: const TextStyle(
        color: Colors.red,
      ),
        isDense: true,
      hintText: hintText,
      prefixIcon: icon,
      contentPadding: EdgeInsets.symmetric(vertical: 0.0),
      prefixIconColor: Colors.purple,
      hintStyle: textStyle,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.sp)),
        borderSide: BorderSide.none
      ),
    );
  }

}
