import 'package:flutter/material.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/screens/profile/Chatpage.dart';
import 'package:sizer/sizer.dart';

class Myclients extends StatefulWidget {
  const Myclients({Key? key}) : super(key: key);

  @override
  State<Myclients> createState() => _MyclientsState();
}

class Sachen {
  String? image;
  String? name;
  String? club;

  Sachen(this.image, this.name, this.club);
}

class _MyclientsState extends State<Myclients> {
  List<Sachen> profile = [
    Sachen("assets/suarez.jpg", "Suarez", "fc barcelona"),
    Sachen("assets/lewa.webp", "Lewandoski", "Manchester united"),
    Sachen("assets/10.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/cr7.webp", "Cr 7", "al nssr"),
    Sachen("assets/suarez.jpg", "Suarez", "fc barcelona"),
    Sachen("assets/lewa.webp", "Lewandoski", "Manchester united"),
    Sachen("assets/10.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/10.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/cr7.webp", "Cr 7", "al nssr"),
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
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        key: _scaffoldKey,
        backgroundColor: Colors.black,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                      'My Clients',
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
                          child: Row(
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
                                    PopupMenuButton(
                                      offset: Offset(0.0, 0.0),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(8.0),
                                          bottomRight: Radius.circular(8.0),
                                          topLeft: Radius.circular(8.0),
                                          topRight: Radius.circular(8.0),
                                        ),
                                      ),
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChatPage(),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 5.h,
                                                  width: 30.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.05),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    border: Border.all(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Message',
                                                    style: TextStyle(
                                                      fontSize: 4.w,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Meta1',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        PopupMenuItem(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: Center(
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 5.h,
                                                  width: 30.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.05),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    border: Border.all(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Remove',
                                                    style: TextStyle(
                                                      fontSize: 4.w,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Meta1',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      icon: Icon(
                                        Icons.more_vert_rounded,
                                        color: Colors.white,
                                      ),
                                      color: Color(0xff363636),
                                    )
                                    // IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded),color: Colors.white,),
                                  ],
                                ),
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
