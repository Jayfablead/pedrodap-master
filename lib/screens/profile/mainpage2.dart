import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/screens/profile/listingpage.dart';
import 'package:sizer/sizer.dart';

class mainpage2 extends StatefulWidget {
  const mainpage2({Key? key}) : super(key: key);

  @override
  State<mainpage2> createState() => _mainpage2State();
}

class sachen1 {
  String? image;
  String? name;
  String? club;

  sachen1(this.image, this.name, this.club);
}

class Sachen {
  String? image;
  String? name;

  Sachen(this.image, this.name);
}

class _mainpage2State extends State<mainpage2> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Sachen> profile = [
    Sachen("assets/messi.png", "Lionel Messi"),
    Sachen("assets/cr7.webp", "Cr 7"),
    Sachen("assets/suarez.jpg", "Suarez"),
    Sachen("assets/lewa.webp", "Lewandoski")
  ];
  List<sachen1> profile1 = [
    sachen1("assets/messi.png", "Lionel Messi", "paris saint german"),
    sachen1("assets/cr7.webp", "Cr 7", "al nssr"),
  ];
  List<Sachen> data = [
    Sachen("assets/icons/players.png", "Player"),
    Sachen("assets/icons/coach.png", "Coach"),
    Sachen("assets/icons/club.png", "Club"),
    Sachen("assets/icons/symbol.png", "Scouts"),
    Sachen("assets/icons/hospital.png", "Medicals"),
    Sachen("assets/icons/nutritionist.png", "Nutritionists"),
    Sachen("assets/icons/coach (1).png", "Fitness Instructors"),
    Sachen("assets/icons/trainers.png", " Personal Trainers"),
  ];
  int _current = 1;

  int selectindex1 = 0;
  CarouselController _controller = CarouselController();

  TextEditingController _search = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(userData!.userData!.email);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: drawer(),
        backgroundColor: Color(0xff131313),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pedro",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        GestureDetector(
                            onTap: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Hello  Neymar !! ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  "Welcome to Pedro",
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 6.w,
                        backgroundImage: NetworkImage(
                            "https://icdn.football-espana.net/wp-content/uploads/2022/06/Neymar-Junior2.jpeg")),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      width: 72.w,
                      child: SizedBox(
                        height: 16.w,
                        child: TextField(
                          controller: _search,
                          keyboardType: TextInputType.text,
                          decoration: inputDecoration(
                              hintText: "Search",
                              col: Colors.white.withOpacity(0.15),
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                CarouselSlider(
                  carouselController: _controller,
                  items: profile1.map((item) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => listingpage()));
                      },
                      child: SingleChildScrollView(
                        child: Container(
                          // padding:EdgeInsets.all(5.w),
                          height: 40.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white.withOpacity(0.15),
                              ),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.15),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0))),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 10.5.w,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                          radius: 10.w,
                                          backgroundImage: AssetImage(
                                            item.image.toString(),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item.name.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                                color: Colors.white),
                                          ),
                                          Text(
                                            item.club.toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Poppins",
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                padding: EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                    // color: Colors.white.withOpacity(0.15),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20.0),
                                        bottomRight: Radius.circular(20.0))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '28',
                                          style: TextStyle(
                                            fontSize: 6.w,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        Text(
                                          'Posts',
                                          style: TextStyle(
                                            fontSize: 3.5.w,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            color: Color(0xffb4b4b4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '69',
                                          style: TextStyle(
                                            fontSize: 6.w,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        Text(
                                          'Following',
                                          style: TextStyle(
                                            fontSize: 3.5.w,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            color: Color(0xffb4b4b4),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '2.3B',
                                          style: TextStyle(
                                            fontSize: 6.w,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        Text(
                                          'Followers',
                                          style: TextStyle(
                                            fontSize: 3.5.w,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Poppins",
                                            color: Color(0xffb4b4b4),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 50.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff0DF5E3),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.sp)),
                                  child: Text(
                                    "Connect",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.white,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    height: 40.h,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    // aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    viewportFraction: 0.8,
                  ),
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
                        "Search For?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      // TextButton(
                      //     onPressed: () {
                      //       // click();
                      //     },
                      //     child: Text(
                      //       "Show all",
                      //       style: TextStyle(
                      //           color: Color(0xff0DF5E3),
                      //           fontSize: 12.sp,
                      //           fontFamily: "Poppins",
                      //           fontWeight: FontWeight.w600),
                      //     ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 16.h,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 5.w, top: 2.h),
                  decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      //   colors: [
                      //     Color(0xff514d56),
                      //     Color(0xff252525),
                      //   ],
                      // )
                      ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectindex1 = index;
                            });
                          },
                          child: Container(
                            width: 22.w,
                            child: Column(
                              children: [
                                Container(
                                    height: 8.5.w,
                                    width: 22.w,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(right: 5.w),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.w, vertical: 0.h),
                                    child: Image.asset(
                                        data[index].image.toString(),
                                        fit: BoxFit.cover,
                                        height: 9.w,
                                        width: 8.7.w,
                                        color: Colors.grey.shade200)),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(right: 4.w),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 1.w, vertical: 0.h),
                                  child: Text(
                                    data[index].name.toString(),
                                    maxLines: 4,
                                    style: TextStyle(
                                        color: Colors.grey.shade200,
                                        fontSize: 10.sp,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.normal),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: "Poppins");

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

  // click() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         titlePadding: EdgeInsets.only(bottom: 0.h),
  //         // insetPadding: EdgeInsets.zero,
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(10.0))),
  //         title: Container(
  //           padding: EdgeInsets.only(left: 3.w, right: 0.w),
  //           decoration: BoxDecoration(
  //               color: Color(0xff131313),
  //               // color: Color(0xffb4776e6),
  //               borderRadius: BorderRadius.only(
  //                   topRight: Radius.circular(10.0),
  //                   topLeft: Radius.circular(10.0))),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 "Search For?",
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.bold,
  //                     fontFamily: "Poppins"),
  //               ),
  //               IconButton(
  //                   onPressed: () {
  //                     Navigator.of(context).pop();
  //                   },
  //                   icon: Icon(
  //                     Icons.close,
  //                     color: Colors.white,
  //                   ))
  //             ],
  //           ),
  //         ),
  //         contentPadding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
  //         content: Container(
  //           color: Colors.grey.shade800,
  //           padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
  //           // height: 38.h,
  //           child: GridView.builder(
  //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //                   mainAxisSpacing: 2.w,
  //                   crossAxisSpacing: 2.w,
  //                   crossAxisCount: 3,
  //                   childAspectRatio: 3 / 4),
  //               shrinkWrap: true,
  //               scrollDirection: Axis.vertical,
  //               itemCount: data.length,
  //               physics: ScrollPhysics(),
  //               itemBuilder: (context, index) {
  //                 return Container(
  //                   padding: EdgeInsets.all(2.w),
  //                   width: MediaQuery.of(context).size.width,
  //                   child: Column(
  //                     children: [
  //                       Container(
  //                         height: 12.w,
  //                         width: 12.w,
  //                         child: Image.asset(
  //                           data[index].image.toString(),
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                       // CircleAvatar(
  //                       //   backgroundColor: Colors.transparent,
  //                       //     radius: 5.w,
  //                       //     backgroundImage: AssetImage(
  //                       //       data[index].image.toString(),
  //                       //     )),
  //                       SizedBox(
  //                         height: 1.h,
  //                       ),
  //                       Text(
  //                         data[index].name.toString(),
  //                         maxLines: 2,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: TextStyle(
  //                             fontSize: 10.sp,
  //                             fontWeight: FontWeight.bold,
  //                             fontFamily: "Poppins",
  //                             color: Colors.white),
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               }),
  //         ),
  //       );
  //     },
  //   );
  // }
}


// ============================== Bottom NavigationBar incase if need ===================

// bottomNavigationBar: Stack(children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 2.w),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(30),
//               child: BottomAppBar(
//                 color: Colors.white.withOpacity(0.15),
//                 shape: CircularNotchedRectangle(), //shape of notch
//                 notchMargin:
//                     20, //notche margin between floating button and bottom appbar
//                 child: SizedBox(
//                   height: 7.h,
//                   child: Row(
//                     //children inside bottom appbar
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       SizedBox(
//                         width: 1.h,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.home,
//                           color: Colors.cyanAccent,
//                           size: 3.h,
//                         ),
//                         onPressed: () {},
//                       ),
//                       SizedBox(
//                         width: 2.h,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.chat_outlined,
//                           color: Colors.white,
//                           size: 3.h,
//                         ),
//                         onPressed: () {},
//                       ),
//                       SizedBox(
//                         width: 3.h,
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           Icons.person,
//                           color: Colors.white,
//                           size: 3.5.h,
//                         ),
//                         onPressed: () {},
//                       ),
//                       SizedBox(
//                         width: 1.h,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ]),