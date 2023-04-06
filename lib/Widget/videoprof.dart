import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class profplayer extends StatefulWidget {
  String? video;

  profplayer({Key? key, this.video}) : super(key: key);

  @override
  State<profplayer> createState() => _profplayerState();
}

late VideoPlayerController _controller;

class _profplayerState extends State<profplayer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(widget.video.toString());
    _controller.addListener(() {
      if (!_controller.value.isPlaying &&
          _controller.value.isInitialized &&
          (_controller.value.duration == _controller.value.position)) {}
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();

    _controller.setLooping(true);
    _controller.setVolume(0.0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller == '' ?Container():Center(
        child: _controller.value.isInitialized
            ? VideoPlayer(
                _controller,
              )
            : Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Loading...',
                      style: textStyle,
                    )
                  ],
                )),
      ),
    );
  }

  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 10.sp, fontFamily: "Meta1");
}
