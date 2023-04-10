import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/connectedModal.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/screens/profile/Chatpage.dart';
import 'package:pedrodap/screens/profile/messagePage.dart';
import 'package:sizer/sizer.dart';

import '../../Model/pendingreqModal.dart';
import '../../Widget/buildErrorDialog.dart';
import '../../Widget/const.dart';
import '../../Widget/sharedpreferance.dart';
import '../../provider/authprovider.dart';

class MyConnections extends StatefulWidget {
  const MyConnections({Key? key}) : super(key: key);

  @override
  State<MyConnections> createState() => _MyConnectionsState();
}

class Sachen {
  String? image;
  String? name;
  String? club;

  Sachen(this.image, this.name, this.club);
}

class _MyConnectionsState extends State<MyConnections> {
  List<Sachen> profile = [
    Sachen("assets/10.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/cr7.webp", "Cr 7", "al nssr"),
    Sachen("assets/suarez.jpg", "Suarez", "fc barcelona"),
    Sachen("assets/lewa.webp", "Lewandoski", "Manchester united"),
    Sachen("assets/10.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/cr7.webp", "Cr 7", "al nssr"),
    Sachen("assets/suarez.jpg", "Suarez", "fc barcelona"),
    Sachen("assets/lewa.webp", "Lewandoski", "Manchester united"),
    Sachen("assets/10.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/cr7.webp", "Cr 7", "al nssr"),
    Sachen("assets/suarez.jpg", "Suarez", "fc barcelona"),
    Sachen("assets/lewa.webp", "Lewandoski", "Manchester united")
  ];
  List<Sachen> reqest = [
    Sachen("assets/10.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/cr7.webp", "Cr 7", "al nssr"),
    Sachen("assets/suarez.jpg", "Suarez", "fc barcelona"),
    Sachen("assets/lewa.webp", "Lewandoski", "Manchester united"),
  ];
  TextEditingController _search = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connectionsapi();
    print(connections?.totalConnectedUser);
  }

  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isloading,
      scaffold: Scaffold(
        drawer: drawer(),
        key: _scaffoldKey,
        backgroundColor: Colors.black,
        body: isloading
            ? Container()
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4.h,
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
                            'My network',
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
                      SizedBox(
                        height: 3.h,
                      ),
                      connections!.connectedUsers!.isEmpty
                          ? Container(
                              height: 80.h,
                              child: Center(
                                  child: Text(
                                'No Connections Available',
                                style: textStyle1,
                              )),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'All Connections',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Meta1',
                                        color: Colors.white),
                                  ),
                                  Text(
                                    connections!.totalConnectedUser.toString(),
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Meta1',
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 90.h,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 2.h),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                height: 10.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 87.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.w),
                                                    height: 7.h,
                                                    width: 14.w,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              90),
                                                      child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: connections
                                                                ?.connectedUsers?[
                                                                    index]
                                                                .profilePic ??
                                                            '',
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    progress) =>
                                                                CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                          'assets/icons/user.png',
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 4.w,
                                                  ),
                                                  Text(
                                                    connections
                                                            ?.connectedUsers?[
                                                                index]
                                                            .name ??
                                                        '',
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: 'Meta1',
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
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
                                                            content: Column(
                                                              children: [
                                                                Text(
                                                                  'Are you Sure You Want To Disconnect ?',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Color(
                                                                        0xffffffff),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 3.h,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          bottom:
                                                                              1.h),
                                                                      width:
                                                                          20.w,
                                                                      child:
                                                                          ElevatedButton(
                                                                        child:
                                                                            Text(
                                                                          'Yes',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12.sp,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontFamily:
                                                                                'Meta1',
                                                                            color:
                                                                                Color(0xffffffff),
                                                                          ),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          unfriendapi(
                                                                              index);
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        style: ElevatedButton.styleFrom(
                                                                            backgroundColor:
                                                                                Colors.grey.withOpacity(0.20),
                                                                            minimumSize: Size(40.w, 5.h),
                                                                            elevation: 00),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          bottom:
                                                                              1.h),
                                                                      width:
                                                                          20.w,
                                                                      child:
                                                                          ElevatedButton(
                                                                        child:
                                                                            Text(
                                                                          'No',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12.sp,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontFamily:
                                                                                'Meta1',
                                                                            color:
                                                                                Color(0xffffffff),
                                                                          ),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        style: ElevatedButton.styleFrom(
                                                                            primary:
                                                                                Colors.grey.withOpacity(0.20),
                                                                            minimumSize: Size(40.w, 5.h),
                                                                            elevation: 00),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      icon: Icon(
                                                        CupertinoIcons
                                                            .person_badge_minus,
                                                        color: Colors.white,
                                                      )),
                                                  IconButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                              MaterialPageRoute(
                                                        builder: (context) =>
                                                            MessagePage(
                                                                uid: connections?.connectedUsers?[index].uid ?? '',
                                                                image: connections
                                                                    ?.connectedUsers?[
                                                                index]
                                                                    .profilePic ??
                                                                    '',
                                                                name: connections
                                                                    ?.connectedUsers?[
                                                                index]
                                                                    .name ??
                                                                    ''),
                                                      ));
                                                    },
                                                    icon: Icon(
                                                      CupertinoIcons
                                                          .text_bubble,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      indent: 05,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: connections?.connectedUsers?.length,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  connectionsapi() {
    final Map<String, String> data = {};
    data['action'] = 'connected_users';
    data['uid'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().Connectionsapi(data).then((Response response) async {
          connections = ConnectedModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && connections?.status == "success") {
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            isloading = false;
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

  unfriendapi(int index) {
    final Map<String, String> data = {};
    data['action'] = 'disconnect_user';
    data['uid'] = connections?.connectedUsers?[index].uid ?? '';
    data['login_user_id'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().unfriendapi(data).then((Response response) async {
          pending = PendingreqModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && pending?.status == "success") {
            Fluttertoast.showToast(
                msg: "User Disconnected Successfully",
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
            connectionsapi();
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            isloading = false;
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

  TextStyle textStyle = TextStyle(
      color: Colors.grey.shade500, fontSize: 12.sp, fontFamily: 'Meta1');
  TextStyle textStyle1 = TextStyle(
      color: Colors.grey.shade300, fontSize: 14.sp, fontFamily: 'Meta1');

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
}
