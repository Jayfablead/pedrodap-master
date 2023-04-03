import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'Widget/const.dart';

class videoplayer extends StatefulWidget {
  String? video;
   videoplayer({Key? key,this.video}) : super(key: key);

  @override
  State<videoplayer> createState() => _videoplayerState();
}
late VideoPlayerController _controller;
class _videoplayerState extends State<videoplayer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(
        widget.video.toString());
    _controller.addListener(() {
      if (!_controller.value.isPlaying &&
          _controller.value.isInitialized &&
          (_controller.value.duration ==
              _controller.value.position)) {}
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();

    _controller.setLooping(true);
    _controller.setVolume(0.0);

  }
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: _controller == ''?Container(child: Text('No Videos Available',style: TextStyle(color: Colors.white),),):VideoPlayer(
  _controller,
),),
    );
  }
}
