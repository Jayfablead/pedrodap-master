import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';

import '../../Widget/Drawer.dart';

class ManageConnections extends StatefulWidget {
  const ManageConnections({super.key});

  @override
  State<ManageConnections> createState() => _ManageConnectionsState();
}

class _ManageConnectionsState extends State<ManageConnections> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 3.h),
            Row(
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
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Manage my network',
                  style: TextStyle(
                    fontSize: 5.5.w,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Meta1',
                    color: Color(0xffffffff),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            ListTile(
              title: Text(
                'Conections',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Meta1',
                    color: Colors.white),
              ),
              leading: Icon(
                Icons.people,
                color: Colors.white,
              ),
              trailing: Text(
                '18',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Meta1',
                    color: Colors.white),
              ),
            ),
            Divider(color: Colors.white),
            ListTile(
              title: Text(
                'Pages',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Meta1',
                    color: Colors.white),
              ),
              leading: Icon(
                Icons.padding_rounded,
                color: Colors.white,
              ),
              trailing: Text(
                '2',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Meta1',
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
