import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pedrodap/Model/feedimagesmodal.dart';
import 'package:pedrodap/loader.dart';
import 'package:sizer/sizer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../Model/profileModal.dart';
import '../Widget/buildErrorDialog.dart';
import '../Widget/const.dart';
import '../provider/authprovider.dart';

class FeedImages extends StatefulWidget {
  const FeedImages({Key? key}) : super(key: key);

  @override
  State<FeedImages> createState() => _FeedImagesState();
}

final List<String> images = [
  "https://images.unsplash.com/photo-1559583985-c80d8ad9b29f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwxMDY1OTc2fHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
  'https://img.freepik.com/free-vector/night-ocean-landscape-full-moon-stars-shine_107791-7397.jpg',
  "https://e0.pxfuel.com/wallpapers/304/840/desktop-wallpaper-zoro-top-30-best-zoro-background-zoro-android.jpg",
  "https://i.pinimg.com/originals/f0/af/cb/f0afcbce7ed4a7df7b822964501bf995.jpg",
  "https://e0.pxfuel.com/wallpapers/712/433/desktop-wallpaper-desert-nights-moon-minimalism-minimalist-purple-minimalist.jpg",
  "https://w.forfun.com/fetch/b4/b4d430320229744245679e19e50b6f03.jpeg",
  "https://www.nawpic.com/media/2020/summer-aesthetic-wallpaper-iphone-nawpic-15-500x888.jpg",
  "https://wallpaperaccess.com/thumb/9070071.png",
  "https://e0.pxfuel.com/wallpapers/970/388/desktop-wallpaper-21-background-calm-anime-anime-peace.jpg",
  "https://png.pngtree.com/thumb_back/fw800/background/20191120/pngtree-sunset-nature-landscape-with-big-tree-image_322506.jpg",
  "https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/madara-uchiha-naruto-featured.jpg",
  "https://wallpapercave.com/wp/wp6928960.jpg",
  "https://wallpaperaccess.com/full/5001856.jpg",
  "http://m.gettywallpapers.com/wp-content/uploads/2020/01/Goku-Wallpaper-new-2023.jpg",
  "https://i.pinimg.com/originals/e0/66/08/e06608d9995f574d3ef5a19ae2ed243c.jpg",
];
bool isloading = false;

class _FeedImagesState extends State<FeedImages> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Feedimgapi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isloading,
      scaffold: Scaffold(
        backgroundColor: Colors.black,
        body: isloading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Center(
                  child: feedimages?.allImgPosts?.length == 0 || feedimages?.allImgPosts == null
                      ? Container(alignment: Alignment.center,
                          height: 80.h,
                          child: Text(
                            'No Feed Available',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontFamily: 'Meta1',
                                letterSpacing: 1),
                          ),
                        )
                      : StaggeredGridView.countBuilder(
                          crossAxisCount: 4,
                          itemCount: feedimages?.allImgPosts?.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                               ),
                            color: Colors.black,
                            margin: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 1.w),
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: feedimages
                                            ?.allImgPosts?[index].imageUrl ??
                                        '',
                                    progressIndicatorBuilder:
                                        (context, url, progress) =>
                                            CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      'assets/noimg.jpeg',
                                      color: Colors.white,
                                    ),
                                  ),
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
                                      feedimages
                                              ?.allImgPosts?[index].imageCaption ??
                                          '',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.sp,
                                          fontFamily: 'Meta1',
                                          letterSpacing: 1),
                                    ),
                                  ),

                                SizedBox(height: 1.h),
                              ],
                            ),
                          ),
                          staggeredTileBuilder: (int index) =>
                              new StaggeredTile.fit(2),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                        ),
                ),
              ),
      ),
    );
  }

  Feedimgapi() {
    final Map<String, String> data = {};
    data['action'] = 'feedPageApp';
    data['uid'] = userData?.userData?.uid ?? '';

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().feedimgapi(data).then((Response response) async {
          feedimages = FeedImagesModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && feedimages?.status == "success") {
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
