import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/playermodal.dart';
import 'package:pedrodap/Widget/buildErrorDialog.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/provider/authprovider.dart';
import 'package:pedrodap/screens/profile/userprofile%20screen.dart';

import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';
import '../../Widget/const.dart';
import '../../Widget/sharedpreferance.dart';
import 'mainpage2.dart';

class listingpage extends StatefulWidget {
  const listingpage({Key? key}) : super(key: key);

  @override
  State<listingpage> createState() => _listingpageState();
}

class Sachen {
  String? image;
  String? name;
  String? club;

  Sachen(this.image, this.name, this.club);
}

class _listingpageState extends State<listingpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Sachen> profile = [
    Sachen("assets/messi.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/cr7.webp", "Cr 7", "al nssr"),
    Sachen("assets/suarez.jpg", "Suarez", "fc barcelona"),
    Sachen("assets/lewa.webp", "Lewandoski", "Manchester united"),
    Sachen("assets/messi.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/cr7.webp", "Cr 7", "al nssr"),
    Sachen("assets/suarez.jpg", "Suarez", "fc barcelona"),
    Sachen("assets/lewa.webp", "Lewandoski", "Manchester united"),
    Sachen("assets/messi.png", "Lionel Messi", "paris saint german"),
    Sachen("assets/cr7.webp", "Cr 7", "al nssr"),
    Sachen("assets/suarez.jpg", "Suarez", "fc barcelona"),
    Sachen("assets/lewa.webp", "Lewandoski", "Manchester united")
  ];
  TextEditingController _search = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playerapi();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
        scaffold: Scaffold(
            key: _scaffoldKey,
            drawer: drawer(),
            backgroundColor: isLoading ? Colors.black : Colors.black,
            body: isLoading
                ? Container(color: Colors.transparent)
                : Container(
                    padding: EdgeInsets.all(5.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Pedro",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                    fontFamily: 'Meta1',
                                    fontWeight: FontWeight.w500),
                              ),
                              IconButton(
                                  onPressed: () {
                                    _scaffoldKey.currentState?.openDrawer();
                                  },
                                  icon: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "All Players ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontFamily: 'Meta1',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            "Search players from world",
                            style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 13.sp,
                                fontFamily: 'Meta1',
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
                                        col: Colors.grey.withOpacity(0.30),
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
                            height: 3.h,
                          ),
                          GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 5.w,
                                      crossAxisSpacing: 5.w,
                                      crossAxisCount: 2,
                                      childAspectRatio: 3 / 4),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: playerdata!.players!.length,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Userprofile()));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(3.w),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
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
                                          playerdata!.players![index].name
                                              .toString(),
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
                                          playerdata!.players![index].clubName
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Meta1',
                                              color: Colors.white),
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
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.sp)),
                                              child: Text(
                                                "Connect",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'Meta1',
                                                    fontWeight:
                                                        FontWeight.bold),
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
        isLoading: isLoading);
  }

  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: 'Meta1');

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

  playerapi() {
    final Map<String, String> data = {};
    data['action'] = 'all_players_app';

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().playersApi(data).then((Response response) async {
          playerdata = Playermodal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && userData?.status == "success") {
            setState(() {
              isLoading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }
}
