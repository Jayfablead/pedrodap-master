import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/searchusersmodal.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/screens/others/feedpage.dart';
import 'package:pedrodap/screens/profile/userprofile%20screen.dart';
import 'package:sizer/sizer.dart';

import '../../Model/allplayersmodal.dart';
import '../../Model/searchtodoModal.dart';
import '../../Widget/buildErrorDialog.dart';
import '../../Widget/sharedpreferance.dart';
import '../../provider/authprovider.dart';
import '../../statichomepage.dart';

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
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FeedPage(),));
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'All Users',
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
                        ),SizedBox(
                          height: 2.h,
                        ),
                        searchBox(),

                        _search.text == ''?
                        alldata?.allUsers!.length == 0
                            ? Container(
                          height: 70.h,
                          alignment: Alignment.center,
                          child: Text(
                            'No User Found',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'Meta1',
                              color: Color(0xffffffff),
                            ),
                          ),
                        )
                            :GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 4.w,
                                    crossAxisSpacing: 5.w,
                                    crossAxisCount: 2,
                                    childAspectRatio: 2.1 / 3.6),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: alldata?.allUsers?.length,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(

                                child: Container(
                                  padding: EdgeInsets.all(3.w),
                                  height: 10.h,
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
                                            imageUrl: alldata?.allUsers?[index]
                                                    .profilePic ??
                                                '',
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
                                        height: 1.h,
                                      ),
                                      Expanded(
                                          child: Text(
                                        alldata?.allUsers?[index].name ?? '',
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
                                        height: 1.h,
                                      ),
                                      alldata?.allUsers?[index].clubName == null
                                          ? Container()
                                          : alldata?.allUsers?[index].role == '2' ?Expanded(
                                              child: Text(
                                              alldata?.allUsers?[index]
                                                      .clubName ??
                                                  '',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Meta1',
                                                  color: Colors.grey.shade500),
                                            )):Container(),
                                      Expanded(
                                          child: Text(
                                        alldata?.allUsers?[index].position ==
                                                null
                                            ? (alldata?.allUsers?[index]
                                                        .role) ==
                                                    '2'
                                                ? 'Player'
                                                : (alldata?.allUsers?[index]
                                                            .role) ==
                                                        '3'
                                                    ? 'Coach'
                                                    : (alldata?.allUsers?[index]
                                                                .role) ==
                                                            '5'
                                                        ? 'Scouts'
                                                        : (alldata
                                                                    ?.allUsers?[
                                                                        index]
                                                                    .role) ==
                                                                '6'
                                                            ? 'Medician'
                                                            : (alldata
                                                                        ?.allUsers?[
                                                                            index]
                                                                        .role) ==
                                                                    '7'
                                                                ? 'Nutritionist'
                                                                : (alldata
                                                                            ?.allUsers?[
                                                                                index]
                                                                            .role) ==
                                                                        '8'
                                                                    ? 'Fitness Trainer'
                                                                    : 'Personal Trainer'
                                            : alldata?.allUsers?[index]
                                                    .position ??
                                                '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Meta1',
                                            color: Colors.grey.shade500),
                                      )),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Userprofile(
                                                  uid: alldata
                                                      ?.allUsers?[index].uid,
                                                ),
                                              ));
                                        },
                                        child: Container(height: 5.5.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20.sp),
                                              border: Border.all(
                                                color: Colors.white,
                                              )),
                                          child: Text(
                                            "View Profile",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.white,
                                                fontFamily: 'Meta1',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }):searchuser?.allUsers?.length == 0?Container(
                          height: 70.h,
                          alignment: Alignment.center,
                          child: Text(
                            'No User Found',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: 'Meta1',
                              color: Color(0xffffffff),
                            ),
                          ),
                        ):GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 4.w,
                                crossAxisSpacing: 5.w,
                                crossAxisCount: 2,
                                childAspectRatio: 2.1 / 3.6),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: searchuser?.allUsers?.length,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(

                                child: Container(
                                  padding: EdgeInsets.all(3.w),
                                  height: 10.h,
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
                                            imageUrl: searchuser?.allUsers?[index]
                                                .profilePic ??
                                                '',
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
                                        height: 1.h,
                                      ),
                                      Expanded(
                                          child: Text(
                                            searchuser?.allUsers?[index].name ?? '',
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
                                        height: 1.h,
                                      ),
                                      searchuser?.allUsers?[index].clubName == null
                                          ? Container()
                                          : searchuser?.allUsers?[index].role == '2' ?Expanded(
                                          child: Text(
                                            searchuser?.allUsers?[index]
                                                .clubName ??
                                                '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Meta1',
                                                color: Colors.grey.shade500),
                                          )):Container(),
                                      Expanded(
                                          child: Text(
                                            searchuser?.allUsers?[index].position ==
                                                null
                                                ? (searchuser?.allUsers?[index]
                                                .role) ==
                                                '2'
                                                ? 'Player'
                                                : (searchuser?.allUsers?[index]
                                                .role) ==
                                                '3'
                                                ? 'Coach'
                                                : (searchuser?.allUsers?[index]
                                                .role) ==
                                                '5'
                                                ? 'Scouts'
                                                : (searchuser
                                                ?.allUsers?[
                                            index]
                                                .role) ==
                                                '6'
                                                ? 'Medician'
                                                : (searchuser
                                                ?.allUsers?[
                                            index]
                                                .role) ==
                                                '7'
                                                ? 'Nutritionist'
                                                : (searchuser
                                                ?.allUsers?[
                                            index]
                                                .role) ==
                                                '8'
                                                ? 'Fitness Trainer'
                                                : 'Personal Trainer'
                                                : searchuser?.allUsers?[index]
                                                .position ??
                                                '',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Meta1',
                                                color: Colors.grey.shade500),
                                          )),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    Userprofile(
                                                      uid: searchuser
                                                          ?.allUsers?[index].uid,
                                                    ),
                                              ));
                                        },
                                        child: Container(height: 5.5.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  20.sp),
                                              border: Border.all(
                                                color: Colors.white,
                                              )),
                                          child: Text(
                                            "View Profile",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Colors.white,
                                                fontFamily: 'Meta1',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                )),
    );
  }
  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.20),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {
          searchapi();
        },
        style: TextStyle(color: Colors.white, fontFamily: 'Meta1'),
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
          hintStyle: TextStyle(color: Colors.white, fontFamily: 'Meta1'),
        ),
      ),
    );
  }
  searchapi() {
    final Map<String, String> data = {};
    data['action'] = 'search_users_app';
    data['uid'] = userData!.userData!.uid.toString();
    data['search_keyword'] = _search.text.trim().toString();
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().searchuserapi(data).then((Response response) async {
          searchuser =
              searchUsersModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 &&
              searchtodotraining?.status == "success") {

            setState(() {
              isloading = false;
            });



            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {
              isloading = false;
            });
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
