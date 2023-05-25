import 'package:flutter/material.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/mainpages/feedimages.dart';
import 'package:pedrodap/mainpages/feedvieos.dart';
import 'package:sizer/sizer.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: '_tabscreen');
List tab = ['Images', 'Videos'];

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaffoldKey.currentState?.closeDrawer();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: drawer(),
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Pedro',
            style: header,
          ),
          elevation: 00,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu_rounded,
              color: Colors.white,
            ),
          ),
          bottom: TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 22.w),
              indicatorColor: Colors.cyan,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.broken_image_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Images',
                        style: textStyle1,
                      )
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.video_camera_back_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        'Videos',
                        style: textStyle1,
                      )
                    ],
                  ),
                )
              ]),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            FeedImages(),
            FeedVideos(),
          ],
        ),
      ),
    );
  }

  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: 'Meta1');
  TextStyle textStyle1 =
      TextStyle(color: Colors.white, fontSize: 13.sp, fontFamily: 'Meta1');
  TextStyle header =
      TextStyle(color: Colors.white, fontSize: 16.sp, fontFamily: 'Meta1');
}
