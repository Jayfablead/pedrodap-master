import 'package:flutter/material.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:sizer/sizer.dart';

class MessagePage extends StatefulWidget {
  String? name;
  String? photo;

  MessagePage({Key? key, this.name, this.photo}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        key: _scaffoldKey,
        backgroundColor: Color(0xff131313),
        body: Center(
          child: Stack(
            children: [
              Positioned(
                top: 10.h,
                child: Container(
                  height: 79.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.w, top: 1.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 2.w, top: 2.h, right: 2.w),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 1.h),
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xffb4776e6)
                                                .withOpacity(0.3),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0)),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Text("hello",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.sp)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.w),
                                          child: Text(
                                            "11:10".toString(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: "Poppins",
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 26.w, right: 3.w, top: 1.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 2.w, top: 2.h, right: 2.w),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 1.h),
                                          width: 75.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff3AA1FF),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(0.0)),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Text(
                                              "It is a long established fact that a reader. ",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.sp)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 1.w),
                                          child: Text(
                                            "11:20".toString(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: "Poppins",
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                        // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.w, top: 1.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 2.w, top: 2.h, right: 2.w),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 1.h),
                                          width: 60.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xffb4776e6)
                                                .withOpacity(0.3),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0)),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Text(
                                              "Will be distracted by the readable",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.sp)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.w),
                                          child: Text(
                                            "11:25".toString(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: "Poppins",
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 26.w, right: 3.w, top: 1.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 2.w, top: 2.h, right: 2.w),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 1.h),
                                          width: 75.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff3AA1FF),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(0.0)),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Text(
                                              "Content of a page when looking at its layout.",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.sp)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 1.w),
                                          child: Text(
                                            "11:27".toString(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: "Poppins",
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                        // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.w, top: 1.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 2.w, top: 2.h, right: 2.w),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 1.h),
                                          width: 75.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xffb4776e6)
                                                .withOpacity(0.3),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0)),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Text(
                                              "The point of using Lorem Ipsum is that it has a more.",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.sp)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.w),
                                          child: Text(
                                            "11:30".toString(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: "Poppins",
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 26.w, right: 3.w, top: 1.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 2.w, top: 2.h, right: 2.w),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 1.h),
                                          width: 75.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff3AA1FF),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(0.0)),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Text(
                                              "Or-less normal distribution of letters, as opposed to using Content.",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.sp)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 1.w),
                                          child: Text(
                                            "11:33".toString(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: "Poppins",
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),

                                        // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.w, top: 1.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 2.w, top: 2.h, right: 2.w),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 1.h),
                                          width: 75.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xffb4776e6)
                                                .withOpacity(0.3),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(20.0)),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Text(
                                              "Here, content here, making it look like readable English.",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.sp)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 1.w),
                                          child: Text(
                                            "11:42".toString(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: "Poppins",
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 23.w, right: 3.w, top: 1.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerRight,
                                          margin: EdgeInsets.only(
                                              left: 2.w, top: 2.h, right: 2.w),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w, vertical: 1.h),
                                          width: 85.w,
                                          decoration: BoxDecoration(
                                            color: Color(0xff3AA1FF),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                                topRight: Radius.circular(20.0),
                                                bottomRight:
                                                    Radius.circular(0.0)),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Text(
                                              "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.",
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.sp)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 1.w),
                                          child: Text(
                                            "11:45".toString(),
                                            style: TextStyle(
                                                color: Colors.white70,
                                                fontFamily: "Poppins",
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),

                                        // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
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
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage(widget.photo.toString()),
                            radius: 3.5.h,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name.toString(),
                                style: TextStyle(
                                  fontSize: 5.w,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Color(0xffffffff),
                                ),
                              ),
                              Text(
                                'Online',
                                style: TextStyle(
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  color: Color(0xff59ff5c),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 21.w,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  Divider(
                    color: Colors.white12,
                  ),
                ],
              ),
              Positioned(
                top: 88.h,
                child: Container(
                  height: 70.0,
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(bottom: 2.h,top: 2.h,left: 3.w,right: 3.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        child: GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.attach_file_outlined,
                            color: Color(0xff3AA1FF),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                          height: 40.0,
                          width: 300.0,
                          child: TextField(
                            cursorColor: Colors.white,
                            style: TextStyle(fontFamily: "Poppins"),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 3.w, vertical: 1.w),
                              filled: true,
                              fillColor: Color(0xffb4776e6).withOpacity(0.1),
                              // border:OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(20.0)
                              // ),
                              hintText: "Type your message....",
                              hintStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontSize: 12.sp),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff3AA1FF),
                                  ),
                                  borderRadius: BorderRadius.circular(50.0)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50.0)),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.emoji_emotions_rounded,
                                  color: Colors.white70,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
