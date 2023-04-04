import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/pendingreqModal.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/screens/profile/manageconnections.dart';
import 'package:pedrodap/screens/profile/myconnections.dart';
import 'package:pedrodap/screens/profile/userprofile%20screen.dart';
import 'package:sizer/sizer.dart';

import '../../Model/allplayersmodal.dart';
import '../../Widget/buildErrorDialog.dart';
import '../../Widget/sharedpreferance.dart';
import '../../provider/authprovider.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class Sachen {
  String? image;
  String? name;
  String? club;

  Sachen(this.image, this.name, this.club);
}

class _DiscoverPageState extends State<DiscoverPage> {
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
  int? select;
  bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playerapi();
    pendingreqapi();
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
                        SizedBox(height: 3.h),
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
                              'My Connections',
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
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MyConnections(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white54)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Manage my network ',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Meta1',
                                      color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_right_alt_outlined,
                                  color: Colors.white,
                                  size: 22.sp,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Pending Request :',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Meta1',
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 33.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: pending!.pendingRequests!.isEmpty
                                ? Container(
                                    child: Center(
                                        child: Text(
                                      'No Pending Reqests Available',
                                      style: textStyle1,
                                    )),
                                  )
                                : ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 1.w,
                                        ),
                                        height: 11.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                                                      height: 7.h,
                                                      width: 14.w,
                                                      child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(90),
                                                        child: CachedNetworkImage(
                                                          fit: BoxFit.cover,
                                                          imageUrl: pending?.pendingRequests?[index].profilePic ?? '',
                                                          progressIndicatorBuilder:
                                                              (context, url, progress) =>
                                                              CircularProgressIndicator(),
                                                          errorWidget: (context, url, error) =>
                                                              Image.asset(
                                                                'assets/icons/user.png',
                                                                color: Colors.white,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    // CircleAvatar(
                                                    //     radius: 8.w,
                                                    //     backgroundImage:
                                                    //         NetworkImage(pending!
                                                    //             .pendingRequests![
                                                    //                 index]
                                                    //             .profilePic
                                                    //             .toString())),
                                                    SizedBox(
                                                      width: 4.w,
                                                    ),
                                                    Text(
                                                      pending?.pendingRequests?[index].name ?? '',
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
                                                    InkWell(
                                                      child: Container(
                                                        height: 5.5.h,
                                                        width: 12.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white12
                                                              .withOpacity(
                                                                  0.10),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(90),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        child: Icon(
                                                          Icons.done_rounded,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 4.w,
                                                    ),
                                                    InkWell(
                                                      child: Container(
                                                        height: 5.5.h,
                                                        width: 12.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white12
                                                              .withOpacity(
                                                                  0.10),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(90),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .redAccent),
                                                        ),
                                                        child: Icon(
                                                          Icons.close,
                                                          color:
                                                              Colors.redAccent,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: pending?.pendingRequests?.length,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'People you may know :',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Meta1',
                                color: Colors.white),
                          ),
                        ),
                        GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 4.w,
                                    crossAxisSpacing: 5.w,
                                    crossAxisCount: 2,
                                    childAspectRatio: 2.4 / 4),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: alldata?.allUsers?.length,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Userprofile(
                                      uid: alldata?.allUsers?[index].uid,
                                    ),
                                  ));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(3.w),
                                  height: 100.h,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 1.w),
                                        height: 10.h,
                                        width: 20.w,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(90),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: alldata?.allUsers?[index].profilePic ?? '',
                                            progressIndicatorBuilder:
                                                (context, url, progress) =>
                                                    CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                              'assets/icons/user.png',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Expanded(
                                          child: Text(
                                        alldata?.allUsers?[index].name
                                            ?? '',
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Meta1',
                                            color: Colors.white),
                                      )),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      alldata?.allUsers?[index].clubName == null
                                          ? Container()
                                          : Expanded(
                                              child: Text(
                                              alldata?.allUsers?[index].clubName
                                                  ?? '',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Meta1',
                                                  color: Colors.grey.shade500),
                                            )),
                                      Expanded(
                                          child: Text(
                                        alldata?.allUsers?[index].position ==
                                                null
                                            ? alldata?.allUsers![index].role ==
                                                    '2'
                                                ? 'Player'
                                                : alldata?.allUsers![index]
                                                            .role ==
                                                        '3'
                                                    ? 'Coach'
                                                    : alldata?.allUsers![index]
                                                                .role ==
                                                            '5'
                                                        ? 'Scouts'
                                                        : alldata?.allUsers![
                                                                        index]
                                                                    .role ==
                                                                '6'
                                                            ? 'Medician'
                                                            : alldata?.allUsers![
                                                                            index]
                                                                        .role ==
                                                                    '7'
                                                                ? 'Nutritionist'
                                                                : alldata?.allUsers![
                                                                                index]
                                                                            .role ==
                                                                        '8'
                                                                    ? 'Fitness Trainer'
                                                                    : 'Personal Trainer'
                                            : alldata?.allUsers?[index].position
                                                ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Meta1',
                                            color: Colors.grey.shade500),
                                      )),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              select = index;
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 40.w,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.sp),
                                                border: Border.all(
                                                  color: Colors.white,
                                                )),
                                            child: Text(
                                              "Connect",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: Colors.white,
                                                  fontFamily: 'Meta1',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                )),
    );
  }

  playerapi() {
    final Map<String, String> data = {};
    data['action'] = 'all_users_app';
    data['uid'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().allplayersapi(data).then((Response response) async {
          alldata = AllplayersModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && userData?.status == "success") {
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

  pendingreqapi() {
    final Map<String, String> data = {};
    data['action'] = 'pending_request_app';
    data['uid'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().pendingreqapi(data).then((Response response) async {
          pending = PendingreqModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && pending?.status == "success") {
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
      color: Colors.grey.shade400, fontSize: 14.sp, fontFamily: 'Meta1');

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
