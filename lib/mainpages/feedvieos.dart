import 'package:flutter/material.dart';
import 'package:pedrodap/mainpages/feedplayer.dart';
import 'package:sizer/sizer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:video_player/video_player.dart';

import 'feedplayerfile.dart';

class FeedVideos extends StatefulWidget {
  const FeedVideos({Key? key}) : super(key: key);

  @override
  State<FeedVideos> createState() => _FeedVideosState();
}

final List<String> videos = [
  "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/Sintel.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
];

class _FeedVideosState extends State<FeedVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(margin: EdgeInsets.only(bottom: 1.h),
                child: Column(
                  children: [
                    Text(
                      " Video(${index + 1}) ",
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    SizedBox(height: 3.h),
                    VideoItems(
                      videoPlayerController:
                          VideoPlayerController.network(videos[index]),
                      looping: true,
                      autoplay: true,
                    ),
                    // Container(height: 25.h,width: 90.w,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Feedplayer(video: videos[index],))),
                  ],
                ),
              );
            },
            itemCount: videos.length),
      ),
    );
  }
}
