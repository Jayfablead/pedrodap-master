import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pedrodap/screens/profile/listingpage.dart';

import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class Sachen {
  String? image;
  String? name;
  String? club;

  Sachen(this.image, this.name, this.club);
}

class _mainpageState extends State<mainpage> {
  CarouselController _controller = CarouselController();
  TextEditingController _search = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int sliderIndex = 0;
  List<String> main = ["Players", "Coach", "Club"];
  int selectindex = 0;
  int _current = 0;
  List<Sachen> profile = [
    Sachen("assets/messi.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/cr7.webp", "Cr 7", "al nssr"),
    Sachen("assets/suarez.jpg", "Suarez", "fc barcelona"),
    Sachen("assets/lewa.webp", "Lewandoski", "Manchester united")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar: Stack(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 5.w,right: 5.w,bottom: 2.w),
              child: ClipRRect(borderRadius: BorderRadius.circular(30),
                child: BottomAppBar(

                  color: Colors.white.withOpacity(0.15),
                  shape: CircularNotchedRectangle(), //shape of notch
                  notchMargin:
                  20, //notche margin between floating button and bottom appbar
                  child: SizedBox(
                    height: 7.h,
                    child: Row(
                      //children inside bottom appbar
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          width: 1.h,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.home,
                            color: Colors.cyanAccent,
                            size: 3.h,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 2.h,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.chat_outlined,
                            color: Colors.white,
                            size: 3.h,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 3.5.h,
                          ),                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
      drawer: drawer(),
      key: _scaffoldKey,
      backgroundColor: Color(0xff131313),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 5.h,),
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
                  GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Icon(Icons.menu, color: Colors.white))
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Hello  Neymar !!  ",
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
                    width: 73.w,
                    child: SizedBox(
                      height: 16.w,
                      child: TextField(
                        controller: _search,
                        keyboardType: TextInputType.text,
                        decoration: inputDecoration(
                            hintText: "Search",
                            col: Colors.white.withOpacity(0.15),
                            icon: Icon(Icons.search, color: Colors.white)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                height: 8.h,
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff514d56),
                        Color(0xff252525),
                      ],
                    )),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: main.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectindex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 0.5.h),
                          height: 3.h,
                          margin: EdgeInsets.only(right: 3.w, top: 0.5.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: (selectindex == index)
                                ? Color(0xff0DF5E3)
                                : Colors.transparent,
                          ),
                          child: Text(
                            main[index],
                            style: TextStyle(
                                color: (selectindex == index)
                                    ? Colors.black
                                    : Colors.white,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 5.h,
              ),
              CarouselSlider(
                carouselController: _controller,
                items: profile.map((item) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => listingpage()));
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  border: Border.all(color: Color(0xff0DF5E3),),

                                    borderRadius: BorderRadius.circular(20.sp)),
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
            ],
          ),
        ),
      ),
    ));
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
}
