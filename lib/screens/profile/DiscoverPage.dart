import 'package:flutter/material.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/screens/profile/manageconnections.dart';
import 'package:pedrodap/screens/profile/myconnections.dart';
import 'package:sizer/sizer.dart';

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
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 1.w,
                          ),
                          height: 11.h,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(
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
                                      InkWell(
                                        child: Container(
                                          height: 5.5.h,
                                          width: 12.w,
                                          decoration: BoxDecoration(
                                            color: Colors.white12
                                                .withOpacity(0.10),
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            border:
                                                Border.all(color: Colors.white),
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
                                          decoration: BoxDecoration(
                                            color: Colors.white12
                                                .withOpacity(0.10),
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            border: Border.all(
                                                color: Colors.redAccent),
                                          ),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.redAccent,
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
                      itemCount: reqest.length,
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
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 4.w,
                        crossAxisSpacing: 5.w,
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 4),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: profile.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(3.w),
                        height: 100.h,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 8.5.w,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                  radius: 8.w,
                                  backgroundImage: AssetImage(
                                    profile[index].image.toString(),
                                  )),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Expanded(
                                child: Text(
                              profile[index].name.toString(),
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
                            Expanded(
                                child: Text(
                              profile[index].club.toString(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Meta1',
                                  color: Colors.grey.shade500),
                            )),
                            SizedBox(
                              height: 1.h,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 40.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.sp),
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
                      );
                    })
              ],
            ),
          ),
        ));
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
