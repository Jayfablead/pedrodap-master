import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/chatmodal.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/screens/others/feedpage.dart';
import 'package:pedrodap/screens/profile/messagePage.dart';
import 'package:sizer/sizer.dart';

import '../../Model/searchchatModal.dart';
import '../../Widget/buildErrorDialog.dart';
import '../../Widget/const.dart';
import '../../Widget/sharedpreferance.dart';
import '../../provider/authprovider.dart';
import '../../statichomepage.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

List name = [
  'Lionel Messi',
  'Cr 7',
  'Suarez',
  'Lewandoski',
  'Lionel Messi',
  'Cr 7',
  'Suarez',
  'Lewandoski'
];
List msg = [
  'Hello !! How Are You ? Good !!',
  'It is a long established fact that a reader will e distracted.  ',
  'By the readable content of a page when looking at its layout.',
  'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.',
  'Hello !! How Are You ? Good !!',
  'It is a long established fact that a reader will be distracted.  ',
  'By the readable content of a page when looking at its layout.',
  'The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.',
];
List prof = [
  'assets/10.png',
  'assets/cr7.webp',
  'assets/suarez.jpg',
  'assets/lewa.webp',
  'assets/10.png',
  'assets/cr7.webp',
  'assets/suarez.jpg',
  'assets/lewa.webp'
];
List time = [
  '11:45 pm',
  '9:45 pm',
  '8:45 pm',
  '6:45 pm',
  '5:45 pm',
  '4:45 pm',
  '3:45 pm',
  '2:45 pm'
];
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
TextEditingController _search = TextEditingController();
bool isloading = true;

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allchatsapi();
    _search.text = '';
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
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => FeedPage(),));
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Messages',
                              style: TextStyle(
                                fontSize: 9.w,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Meta1',
                                color: Color(0xffffffff),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.message_outlined,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        searchBox(),
                        SizedBox(
                          height: 2.h,
                        ),
                        _search.text == ''
                            ? allchats?.messagesData == null
                                ? Container(
                                    height: 70.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'No Messages Available',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Meta1',
                                        color: Color(0xffffffff),
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 74.h,
                                        child: ListView.builder(
                                          itemCount:
                                              allchats?.messagesData?.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => MessagePage(uid: allchats
                                                          ?.messagesData?[
                                                      index]
                                                          .uid ??
                                                          '',
                                                          image: allchats
                                                                  ?.messagesData?[
                                                                      index]
                                                                  .profilePic ??
                                                              '',
                                                          name: allchats
                                                                  ?.messagesData?[
                                                                      index]
                                                                  .name ??
                                                              ''),
                                                    ));
                                              },
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 4.h),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    1.w),
                                                        height: 7.h,
                                                        width: 14.w,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(90),
                                                          child:
                                                              CachedNetworkImage(
                                                            fit: BoxFit.cover,
                                                            imageUrl: allchats
                                                                    ?.messagesData?[
                                                                        index]
                                                                    .profilePic ??
                                                                '',
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        progress) =>
                                                                    CircularProgressIndicator(),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Image.asset(
                                                              'assets/icons/user.png',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 68.w,
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  allchats
                                                                          ?.messagesData?[
                                                                              index]
                                                                          .name ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Meta1',
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Text(
                                                                  allchats
                                                                          ?.messagesData?[
                                                                              index]
                                                                          .time ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Meta1',
                                                                      color: Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.90)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 52.w,
                                                            child: Text(
                                                              allchats
                                                                      ?.messagesData?[
                                                                          index]
                                                                      .message ??
                                                                  '',
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Meta1',
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                            : searchchat?.messagesData?.length == 0
                                ? Container(
                                    height: 70.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'No Messages Available',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontFamily: 'Meta1',
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 74.h,
                                        child: ListView.builder(
                                          itemCount:
                                              searchchat?.messagesData?.length,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {},
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 4.h),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    1.w),
                                                        height: 7.h,
                                                        width: 14.w,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(90),
                                                          child:
                                                              CachedNetworkImage(
                                                            fit: BoxFit.cover,
                                                            imageUrl: searchchat
                                                                    ?.messagesData?[
                                                                        index]
                                                                    .profilePic ??
                                                                '',
                                                            progressIndicatorBuilder:
                                                                (context, url,
                                                                        progress) =>
                                                                    CircularProgressIndicator(),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    Image.asset(
                                                              'assets/icons/user.png',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 68.w,
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  searchchat
                                                                          ?.messagesData?[
                                                                              index]
                                                                          .name ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'Meta1',
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                Text(
                                                                  searchchat
                                                                          ?.messagesData?[
                                                                              index]
                                                                          .time ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontFamily:
                                                                          'Meta1',
                                                                      color: Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.90)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 52.w,
                                                            child: Text(
                                                              searchchat
                                                                      ?.messagesData?[
                                                                          index]
                                                                      .message ??
                                                                  '',
                                                              maxLines: 2,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Meta1',
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
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
          searchchatapi();
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

  allchatsapi() {
    final Map<String, String> data = {};
    data['action'] = 'messages_list_app';
    data['uid'] = userData?.userData?.uid ?? '';

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().chatpageapi(data).then((Response response) async {
          allchats = chatPageModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && userData?.status == "success") {
            setState(() {
              isloading = false;
            });


            print(userData?.status);
            print(userData?.userData?.uid);

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

  searchchatapi() {
    final Map<String, String> data = {};
    data['action'] = 'search_messages';
    data['uid'] = userData?.userData?.uid ?? '';
    data['search_keyword'] = _search.text.trim().toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().Searchchatapi(data).then((Response response) async {
          searchchat = SearchchatModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && searchchat?.status == "success") {
            setState(() {
              isloading = false;
            });


            print(userData?.status);
            print(userData?.userData?.uid);

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
}
