import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/screens/profile/Chatpage.dart';
import 'package:pedrodap/screens/profile/messagePage.dart';
import 'package:sizer/sizer.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Container(
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      '(18)',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 87.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 8.w,
                                            backgroundImage: AssetImage(
                                              profile[index].image.toString(),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          Text(
                                            profile[index].name.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
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
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .white)),
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 0, 0, 0),
                                                    scrollable: true,
                                                    content: Column(
                                                      children: [
                                                        Text(
                                                          'Are you Sure You Want To Disconnect ?',
                                                          style: TextStyle(
                                                            fontSize: 13.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily: 'Meta1',
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
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          1.h),
                                                              width: 20.w,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'Yes',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Color(
                                                                        0xffffffff),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                style: ElevatedButton.styleFrom(
                                                                    backgroundColor: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.20),
                                                                    minimumSize:
                                                                        Size(
                                                                            40.w,
                                                                            5.h),
                                                                    elevation: 00),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          1.h),
                                                              width: 20.w,
                                                              child:
                                                                  ElevatedButton(
                                                                child: Text(
                                                                  'No',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Color(
                                                                        0xffffffff),
                                                                  ),
                                                                ),
                                                                onPressed: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                },
                                                                style: ElevatedButton.styleFrom(
                                                                    primary: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.20),
                                                                    minimumSize:
                                                                        Size(
                                                                            40.w,
                                                                            5.h),
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
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    MessagePage(
                                                        image: profile[index]
                                                            .image
                                                            .toString(),
                                                        name: profile[index]
                                                            .name
                                                            .toString()),
                                              ));
                                            },
                                            icon: Icon(
                                              CupertinoIcons.text_bubble,
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
                  itemCount: profile.length,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
      color: Colors.grey.shade500, fontSize: 12.sp, fontFamily: 'Meta1');

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
