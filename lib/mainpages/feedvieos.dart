import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/feedvidmodal.dart';
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/mainpages/feedplayer.dart';
import 'package:sizer/sizer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:video_player/video_player.dart';

import '../Widget/buildErrorDialog.dart';
import '../Widget/const.dart';
import '../provider/authprovider.dart';
import 'feedplayerfile.dart';

class FeedVideos extends StatefulWidget {
  const FeedVideos({Key? key}) : super(key: key);

  @override
  State<FeedVideos> createState() => _FeedVideosState();
}
bool isloading = true;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    Feedvidapi();
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(isLoading: isloading,
      scaffold: Scaffold(
        backgroundColor: Colors.black,
        body: isloading?Container():Center(
          child: feedvid?.allVideosFetch?.length == 0 ||feedvid?.allVideosFetch == null?Container(alignment: Alignment.center,
            height: 80.h,
            child: Text(
              'No Feed Available',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontFamily: 'Meta1',
                  letterSpacing: 1),
            ),
          ):ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 4.w),
                  child: Container(margin: EdgeInsets.only(bottom: 1.h),
                    child: Column(
                      children: [

                        SizedBox(height: 3.h),
                        VideoItems(
                          videoPlayerController:
                              VideoPlayerController.network(feedvid?.allVideosFetch?[index].videoUrl ?? ''),
                          looping: true,
                          autoplay: true,
                        ),
                        SizedBox(height: 0.2.h),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration:BoxDecoration(
                            color: Colors.white
                                .withOpacity(0.15),
                            borderRadius:
                            BorderRadius.only(
                              bottomLeft:
                              Radius.circular(10),
                              bottomRight:
                              Radius.circular(10),
                            ),
                          ),

                          padding:  EdgeInsets.all(1.5.w),
                          child: Text(
                            feedvid
                                ?.allVideosFetch?[index].vidCaption ??
                                '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.sp,
                                fontFamily: 'Meta1',
                                letterSpacing: 1),
                          ),
                        ),
                        SizedBox(height: 3.h),
                        // Container(height: 25.h,width: 90.w,child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Feedplayer(video: videos[index],))),
                      ],
                    ),
                  ),
                );
              },
              itemCount: feedvid?.allVideosFetch?.length),
        ),
      ),
    );
  }
  Feedvidapi() {
    final Map<String, String> data = {};
    data['action'] = 'feedVideoPageApp';
    data['uid'] = userData?.userData?.uid ?? '';

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().feedvidapi(data).then((Response response) async {
          feedvid = feedVidsModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && feedvid?.status == true) {
            setState(() {
              isloading = false;
            });

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {
              isloading = false;
            });
          }
        });
      } else {
        setState(() {
          isloading = false;
        });
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }
}
