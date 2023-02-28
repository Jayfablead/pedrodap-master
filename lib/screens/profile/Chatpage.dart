import 'package:flutter/material.dart';
import 'package:pedrodap/Widget/Drawer.dart';
import 'package:pedrodap/screens/profile/messagePage.dart';
import 'package:sizer/sizer.dart';

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
  'It is a long established fact that a reader will be distracted.  ',
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

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer(),
        key: _scaffoldKey,
        backgroundColor: Color(0xff131313),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                    IconButton(
                      onPressed: () {_scaffoldKey.currentState?.openDrawer();},
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
                        fontFamily: "Poppins",
                        color: Color(0xffffffff),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 80.h,
                  child: ListView.builder(
                    itemCount: prof.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MessagePage(
                                name: name[index], photo: prof[index]),
                          ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 3.h),
                          child: Container(
                            child: Row(
                              children: [
                                CircleAvatar(
                                    radius: 8.w,
                                    backgroundImage: AssetImage(
                                      prof[index],
                                    )),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(width: 68.w,
                                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            name[index],
                                            style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Poppins",
                                                color: Colors.white),
                                          ),

                                          Text(time[index],style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Poppins",
                                              color: Colors.white.withOpacity(0.90)),),

                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 52.w,
                                      child: Text(
                                        msg[index],
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Poppins",
                                            color: Colors.grey.shade500),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 3.w,),

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
          ),
        ),
      ),
    );
  }
}
