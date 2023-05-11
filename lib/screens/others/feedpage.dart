import 'package:flutter/material.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:sizer/sizer.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List tab = ['Images','Videos'];
class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),),bottom: TabBar(tabs:[Tab(child: Row(children: [Icon(Icons.broken_image_outlined),Text('Images')],),)] ),
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
