// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:pedrodap/screens/profile/loginpage.dart';
// import 'package:pedrodap/screens/profile/mainpage2.dart';
// import 'package:pedrodap/statichomepage.dart';
// import 'package:sizer/sizer.dart';
// import 'package:video_player/video_player.dart';

// import 'Widget/const.dart';
// import 'Widget/sharedpreferance.dart';

// class splashscreen2 extends StatefulWidget {
//   const splashscreen2({Key? key}) : super(key: key);
//   @override
//   State<splashscreen2> createState() => _splashscreen2State();
// }

// late VideoPlayerController _controller;

// class _splashscreen2State extends State<splashscreen2> {
//   void initState() {
//     super.initState();
//     void initState() {
//       super.initState();
//       // Pointing the video controller to our local asset.
//       _controller = VideoPlayerController.asset('assets/splash.mp4')
//         ..initialize().then((_) {
//           // Once the video has been loaded we play the video and set looping to true.
//           _controller.play();
//           _controller.setLooping(true);
//           _controller.setVolume(0.0);
//           _controller.play();
//           // Ensure the first frame is shown after the video is initialized.
//           setState(() {});
//         });
//     }

//     getdata();
//     Timer(
//       const Duration(seconds: 3),
//       () => (userData == null)
//           ? Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => loginpage()))
//           : Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (context) => StaticHomePage())),
//     );
//   }

//   getdata() async {
//     userData = await SaveDataLocal.getDataFromLocal();
//     setState(() {
//       userData;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 0, 0, 0),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 5.w),
//           alignment: Alignment.center,
//           height: double.infinity.h,
//           width: double.infinity.w,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Text(
//                     "PEDRO",
//                     style: TextStyle(
//                         letterSpacing: 2.sp,
//                         color: Colors.white,
//                         fontFamily: "Meta",
//                         fontSize: 23.sp,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 1.h,
//                   ),
//                   Text(
//                     "OBIANG",
//                     style: TextStyle(
//                         letterSpacing: 2.sp,
//                         color: Colors.white,
//                         fontFamily: "Meta",
//                         fontSize: 23.sp,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: _controller.value.size?.width ?? 0,
//                 height: _controller.value.size?.height ?? 0,
//                 child: VideoPlayer(_controller),
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               Text(
//                 "Connecting to server..",
//                 style: TextStyle(
//                     letterSpacing: 1.sp,
//                     color: Colors.white,
//                     fontFamily: "Meta",
//                     fontSize: 12.sp,
//                     fontWeight: FontWeight.w300),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/screens/profile/loginpage.dart';
import 'package:pedrodap/statichomepage.dart';
import 'package:sizer/sizer.dart';

import 'package:video_player/video_player.dart';

import 'Widget/sharedpreferance.dart';

class Player extends StatefulWidget {
  Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late File _videoFile;
  late VideoPlayerController _controller;
  bool isPlay = false;
  @override
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/splash.mp4');
    _controller.addListener(() {
      if (!_controller.value.isPlaying &&
          _controller.value.isInitialized &&
          (_controller.value.duration == _controller.value.position)) {}
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
//
    _controller.setLooping(true);
    getdata();
    Timer(
      const Duration(seconds: 3),
      () => (userData == null)
          ? Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => loginpage()))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => StaticHomePage())),
    );
  }

  Uint8List? _videoData;
  String? imageString;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<void> _saveImage() async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Video saved to gallery'),
    ));
  }

  getdata() async {
    userData = await SaveDataLocal.getDataFromLocal();
    setState(() {
      userData;
      print(userData?.userData?.name);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          alignment: Alignment.center,
          height: double.infinity.h,
          width: double.infinity.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "PEDRO",
                    style: TextStyle(
                        letterSpacing: 2.sp,
                        color: Colors.white,
                        fontFamily: "Meta",
                        fontSize: 23.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "OBIANG",
                    style: TextStyle(
                        letterSpacing: 2.sp,
                        color: Colors.white,
                        fontFamily: "Meta",
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Container(
                  height: 42.h, width: 220.w, child: VideoPlayer(_controller)),
              Text(
                "Connecting to server..",
                style: TextStyle(
                    letterSpacing: 1.sp,
                    color: Colors.white,
                    fontFamily: "Meta",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  
//  
//  
//  