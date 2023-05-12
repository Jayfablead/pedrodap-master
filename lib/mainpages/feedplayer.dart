import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class Feedplayer extends StatefulWidget {
  String? video;

  Feedplayer({Key? key, this.video}) : super(key: key);

  @override
  State<Feedplayer> createState() => _FeedplayerState();
}

bool isplayvid = false;
late VideoPlayerController _controller;

class _FeedplayerState extends State<Feedplayer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = VideoPlayerController.network(widget.video.toString());
    print('========================' + widget.video.toString());
    _controller.addListener(() {
      if (!_controller.value.isPlaying &&
          _controller.value.isInitialized &&
          (_controller.value.duration == _controller.value.position)) {}
    });
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();

    _controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? VideoPlayer(
                _controller,
              )
            : Container(color:Colors.black,child: Center(child: CircularProgressIndicator(color: Colors.white))),
      ),
    );
  }
}
