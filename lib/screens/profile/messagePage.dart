import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../Model/Viewmsgmodal.dart';
import '../../Model/profileModal.dart';
import '../../Widget/buildErrorDialog.dart';
import '../../Widget/const.dart';
import '../../Widget/sharedpreferance.dart';
import '../../provider/authprovider.dart';

class MessagePage extends StatefulWidget {
  String? image;
  String? name;
  String? uid;
  MessagePage({required this.image,required this.name, required this.uid} );

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController _chat = TextEditingController();

  File? imagefile;
  File? pdffile;
  ImagePicker _picker = ImagePicker();
  var senderid;
  var receiverid;
  String? date;
  int? diff;
  bool emojiShowing = false;
  bool isloading = true;
  File? file;
  Timer? timer;

  // int formattedTime =(DateFormat.Hm().format(DateTime.now()));

  ScrollController _scrollController = ScrollController();
  var _useremail, _username, _userphoto, _googleid;

  _onEmojiSelected(Emoji emoji) {
    _chat
      ..text += emoji.emoji
      ..selection =
          TextSelection.fromPosition(TextPosition(offset: _chat.text.length));
  }

  _onBackspacePressed() {
    _chat
      ..text = _chat.text.characters.skipLast(1).toString()
      ..selection =
          TextSelection.fromPosition(TextPosition(offset: _chat.text.length));
  }

  showFilePicker(FileType fileType) async {
    FilePickerResult? imagefile =
        await FilePicker.platform.pickFiles(type: fileType);

    if (imagefile != null) {
    } else {
      print("object");
    }
  }

  @override
  void initState() {
    super.initState();
    showmessageapi();
    print(widget.uid ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 00,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                    height: 7.h,
                    width: 15.w,
                    padding: EdgeInsets.all(1.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.image.toString(),
                        progressIndicatorBuilder: (context, url, progress) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/icons/user.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(widget.name.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Meta1',
                          fontSize: 15.sp)),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_rounded),
              ),
            ],
          ),
        ),
        titleSpacing: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 3.w, top: 1.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 2.w, top: 2.h, right: 2.w),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.h),
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0)),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Text("hello",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Meta1',
                                                fontSize: 12.sp)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 1.w),
                                        child: Text(
                                          "11:10".toString(),
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Meta1',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 26.w, right: 3.w, top: 1.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 2.w, top: 2.h, right: 2.w),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.h),
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(0.0)),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Text(
                                            "It is a long established fact that a reader. ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Meta1',
                                                fontSize: 12.sp)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 1.w),
                                        child: Text(
                                          "11:20".toString(),
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Meta1',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                      // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 3.w, top: 1.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 2.w, top: 2.h, right: 2.w),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.h),
                                        width: 60.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0)),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Text(
                                            "Will be distracted by the readable",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Meta1',
                                                fontSize: 12.sp)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 1.w),
                                        child: Text(
                                          "11:25".toString(),
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Meta1',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 26.w, right: 3.w, top: 1.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 2.w, top: 2.h, right: 2.w),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.h),
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(0.0)),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Text(
                                            "Content of a page when looking at its layout.",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Meta1',
                                                fontSize: 12.sp)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 1.w),
                                        child: Text(
                                          "11:27".toString(),
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Meta1',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                      // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 3.w, top: 1.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 2.w, top: 2.h, right: 2.w),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.h),
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0)),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Text(
                                            "The point of using Lorem Ipsum is that it has a more.",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Meta1',
                                                fontSize: 12.sp)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 1.w),
                                        child: Text(
                                          "11:30".toString(),
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Meta1',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 26.w, right: 3.w, top: 1.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 2.w, top: 2.h, right: 2.w),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.h),
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(0.0)),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Text(
                                            "Or-less normal distribution of letters, as opposed to using Content.",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Meta1',
                                                fontSize: 12.sp)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 1.w),
                                        child: Text(
                                          "11:33".toString(),
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Meta1',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                      // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 3.w, top: 1.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 2.w, top: 2.h, right: 2.w),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.h),
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(20.0)),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Text(
                                            "Here, content here, making it look like readable English.",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Meta1',
                                                fontSize: 12.sp)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 1.w),
                                        child: Text(
                                          "11:42".toString(),
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Meta1',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 23.w, right: 3.w, top: 1.h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.only(
                                            left: 2.w, top: 2.h, right: 2.w),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w, vertical: 1.h),
                                        width: 85.w,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0),
                                              bottomRight:
                                                  Radius.circular(0.0)),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Text(
                                            "Many desktop publishing packages and web page editors now use Lorem Ipsum as their description.",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Meta1',
                                                fontSize: 12.sp)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 1.w),
                                        child: Text(
                                          "11:45".toString(),
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontFamily: 'Meta1',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.normal),
                                        ),
                                      ),
                                      // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 81.h,
            left: -1.w,
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 6, bottom: 5),
              child: Container(
                height: 10.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final content = Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 30.h,
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Color.fromARGB(255, 0, 0, 0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10.0)),
                              ),
                              child: GridView(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  ),
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        final XFile? image =
                                            await _picker.pickImage(
                                                source: ImageSource.gallery);

                                        imagefile = File(image!.path);

                                        Navigator.of(context).pop();
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 60.0,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.cyanAccent),
                                            child: Icon(
                                              Icons.photo,
                                              color: Colors.black,
                                              size: 30.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Photos",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final XFile? image =
                                            await _picker.pickVideo(
                                                source: ImageSource.gallery);
                                        imagefile = File(image!.path);

                                        Navigator.of(context).pop();

                                        // FilePickerResult? imagefile =
                                        // await FilePicker.platform
                                        //     .pickFiles(
                                        //     type: FileType.any,
                                        //     allowMultiple:
                                        //     false);
                                        //
                                        // if (imagefile == null) return;
                                        // final path = imagefile
                                        //     .files.single.path!;
                                        // setState(() {
                                        //   file=File(path);
                                        // });
                                        // // final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                                        // imagefile = File(image!.path);

                                        // video();
                                        // showFilePicker(
                                        //     FileType.video);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 60.0,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.cyanAccent),
                                            child: Icon(
                                              Icons.video_camera_back_outlined,
                                              color: Colors.black,
                                              size: 30.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Videos",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        print('hello');
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 60.0,
                                            width: 60.0,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.cyanAccent),
                                            child: Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.black,
                                              size: 30.0,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Location",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return FractionallySizedBox(
                                widthFactor: 0.9,
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: content,
                                ),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.attach_file_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          // borderRadius: BorderRadius.only(
                          //   topRight: Radius.circular(25),
                          //   topLeft: Radius.circular(25),
                          // ),
                          color: Colors.black),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: 10.h,
                              width: MediaQuery.of(context).size.width * 0.68,
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                cursorColor: Color.fromARGB(153, 190, 190, 190),
                                keyboardType: TextInputType.text,
                                controller: _chat,
                                decoration: InputDecoration(
                                  hintText: 'Enter Message',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 126, 126, 126)),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 0),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  prefixIcon: IconButton(
                                    icon: Icon(
                                      Icons.emoji_emotions_rounded,
                                      color: Color.fromARGB(255, 210, 210, 210),
                                    ),
                                    onPressed: () {
                                      // setState(() {
                                      //   emojiShowing = !emojiShowing;
                                      // });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.send,
                                color: Color.fromARGB(255, 210, 210, 210),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Offstage(
            offstage: !emojiShowing,
            child: SizedBox(
              height: 250,
              child: EmojiPicker(
                  onEmojiSelected: (Category? category, Emoji emoji) {
                    _onEmojiSelected(emoji);
                  },
                  onBackspacePressed: _onBackspacePressed,
                  config: Config(
                      columns: 7,
                      emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      initCategory: Category.RECENT,
                      bgColor: const Color(0xFFF2F2F2),
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      backspaceColor: Colors.blue,
                      showRecentsTab: true,
                      recentsLimit: 28,
                      noRecents: const Text(
                        'No Recents',
                        style: TextStyle(fontSize: 20, color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL)),
            ),
          ),
        ],
      ),
    );
  }
  showmessageapi() {
    final Map<String, String> data = {};
    data['action'] = 'chat_messages_app';
    data['login_user_id'] = userData?.userData?.uid ?? '';
    data['uid'] = widget.uid ?? '';

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().Showchatapi(data).then((Response response) async {
          viewmsgs = ViewchatmsgModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && userData?.status == "success") {
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
            print(userData?.userData?.uid);

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
  sendmessageapi() {
    final Map<String, String> data = {};
    data['action'] = 'send_message_app';
    data['login_user_id'] = userData?.userData?.uid ?? '';
    data['uid'] = userData?.userData?.uid ?? '';
    data['type'] = _chat.text.trim().toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().Sendchatapi(data).then((Response response) async {
          profiledata = ProfileModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && userData?.status == "success") {
            showmessageapi();
            setState(() {
              isloading = false;
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
            print(userData?.userData?.uid);

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
  // void permission() async {
  //   Map<Permission, PermissionStatus> map =
  //       await [Permission.storage, Permission.camera].request();

  //   if (await Permission.camera.isDenied) {
  //     print("Camera Deny");
  //   }
  //   if (await Permission.storage.isDenied) {
  //     print("location");
  //   }
  // }

  // _saveVideo(String path, String name) async {
  //   var appDocDir = await getTemporaryDirectory();
  //   String savePath = appDocDir.path + "/$name.mp4";
  //   EasyLoading.show(status: 'Downloading Video ...');
  //   await Dio().download(path, savePath);
  //   final result = await ImageGallerySaver.saveFile(savePath);
  //   print(result);
  //   EasyLoading.showSuccess('Video Saved to Gallery');
  //   // Fluttertoast.showToast(
  //   //     msg: 'Video Saved to Gallery',
  //   //     toastLength: Toast.LENGTH_SHORT,
  //   //     timeInSecForIosWeb: 1,
  //   //     backgroundColor: Colors.cyan,
  //   //     textColor: Colors.white,
  //   //     fontSize: 16.0);
  // }

  // _save(String path, String name) async {
  //   EasyLoading.show(status: 'Downloading Image ...');
  //   var response = await Dio()
  //       .get(path, options: Options(responseType: ResponseType.bytes));

  //   var result = await ImageGallerySaver.saveImage(
  //       Uint8List.fromList(response.data),
  //       quality: 60,
  //       name: name);
  //   print(response.data);
  //   EasyLoading.showSuccess('Image Saved to Gallery');
  //   // Fluttertoast.showToast(
  //   //     msg: 'Image Saved to Gallery',
  //   //     toastLength: Toast.LENGTH_SHORT,
  //   //     timeInSecForIosWeb: 1,
  //   //     backgroundColor: Colors.cyan,
  //   //     textColor: Colors.white,
  //   //     fontSize: 16.0);
// }
}



// //  chat backup
// Column(
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(30.0),
//                                 topLeft: Radius.circular(30.0))),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 3.w, top: 1.h),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         margin: EdgeInsets.only(
//                                             left: 2.w, top: 2.h, right: 2.w),
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 5.w, vertical: 1.h),
//                                         width: 40.w,
//                                         decoration: BoxDecoration(
//                                           color: Color(0xffb4776e6)
//                                               .withOpacity(0.3),
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(0.0),
//                                               topLeft: Radius.circular(20.0),
//                                               topRight: Radius.circular(20.0),
//                                               bottomRight:
//                                                   Radius.circular(20.0)),
//                                           shape: BoxShape.rectangle,
//                                         ),
//                                         child: Text("hello",
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontFamily: 'Meta1',
//                                                 fontSize: 12.sp)),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 1.w),
//                                         child: Text(
//                                           "11:10".toString(),
//                                           style: TextStyle(
//                                               color: Colors.white70,
//                                               fontFamily: 'Meta1',
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.normal,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 26.w, right: 3.w, top: 1.h),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Container(
//                                         margin: EdgeInsets.only(
//                                             left: 2.w, top: 2.h, right: 2.w),
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 5.w, vertical: 1.h),
//                                         width: 75.w,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(20.0),
//                                               topLeft: Radius.circular(20.0),
//                                               topRight: Radius.circular(20.0),
//                                               bottomRight:
//                                                   Radius.circular(0.0)),
//                                           shape: BoxShape.rectangle,
//                                         ),
//                                         child: Text(
//                                             "It is a long established fact that a reader. ",
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontFamily: 'Meta1',
//                                                 fontSize: 12.sp)),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(right: 1.w),
//                                         child: Text(
//                                           "11:20".toString(),
//                                           style: TextStyle(
//                                               color: Colors.white70,
//                                               fontFamily: 'Meta1',
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.normal,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                       ),
//                                       // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 3.w, top: 1.h),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         margin: EdgeInsets.only(
//                                             left: 2.w, top: 2.h, right: 2.w),
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 5.w, vertical: 1.h),
//                                         width: 60.w,
//                                         decoration: BoxDecoration(
//                                           color: Color(0xffb4776e6)
//                                               .withOpacity(0.3),
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(0.0),
//                                               topLeft: Radius.circular(20.0),
//                                               topRight: Radius.circular(20.0),
//                                               bottomRight:
//                                                   Radius.circular(20.0)),
//                                           shape: BoxShape.rectangle,
//                                         ),
//                                         child: Text(
//                                             "Will be distracted by the readable",
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontFamily: 'Meta1',
//                                                 fontSize: 12.sp)),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 1.w),
//                                         child: Text(
//                                           "11:25".toString(),
//                                           style: TextStyle(
//                                               color: Colors.white70,
//                                               fontFamily: 'Meta1',
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.normal,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 26.w, right: 3.w, top: 1.h),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Container(
//                                         margin: EdgeInsets.only(
//                                             left: 2.w, top: 2.h, right: 2.w),
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 5.w, vertical: 1.h),
//                                         width: 75.w,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(20.0),
//                                               topLeft: Radius.circular(20.0),
//                                               topRight: Radius.circular(20.0),
//                                               bottomRight:
//                                                   Radius.circular(0.0)),
//                                           shape: BoxShape.rectangle,
//                                         ),
//                                         child: Text(
//                                             "Content of a page when looking at its layout.",
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontFamily: 'Meta1',
//                                                 fontSize: 12.sp)),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(right: 1.w),
//                                         child: Text(
//                                           "11:27".toString(),
//                                           style: TextStyle(
//                                               color: Colors.white70,
//                                               fontFamily: 'Meta1',
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.normal,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                       ),
//                                       // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 3.w, top: 1.h),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         margin: EdgeInsets.only(
//                                             left: 2.w, top: 2.h, right: 2.w),
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 5.w, vertical: 1.h),
//                                         width: 75.w,
//                                         decoration: BoxDecoration(
//                                           color: Color(0xffb4776e6)
//                                               .withOpacity(0.3),
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(0.0),
//                                               topLeft: Radius.circular(20.0),
//                                               topRight: Radius.circular(20.0),
//                                               bottomRight:
//                                                   Radius.circular(20.0)),
//                                           shape: BoxShape.rectangle,
//                                         ),
//                                         child: Text(
//                                             "The point of using Lorem Ipsum is that it has a more.",
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontFamily: 'Meta1',
//                                                 fontSize: 12.sp)),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 1.w),
//                                         child: Text(
//                                           "11:30".toString(),
//                                           style: TextStyle(
//                                               color: Colors.white70,
//                                               fontFamily: 'Meta1',
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.normal,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 26.w, right: 3.w, top: 1.h),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Container(
//                                         margin: EdgeInsets.only(
//                                             left: 2.w, top: 2.h, right: 2.w),
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 5.w, vertical: 1.h),
//                                         width: 75.w,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(20.0),
//                                               topLeft: Radius.circular(20.0),
//                                               topRight: Radius.circular(20.0),
//                                               bottomRight:
//                                                   Radius.circular(0.0)),
//                                           shape: BoxShape.rectangle,
//                                         ),
//                                         child: Text(
//                                             "Or-less normal distribution of letters, as opposed to using Content.",
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontFamily: 'Meta1',
//                                                 fontSize: 12.sp)),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(right: 1.w),
//                                         child: Text(
//                                           "11:33".toString(),
//                                           style: TextStyle(
//                                               color: Colors.white70,
//                                               fontFamily: 'Meta1',
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.normal,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                       ),

//                                       // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(left: 3.w, top: 1.h),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Container(
//                                         margin: EdgeInsets.only(
//                                             left: 2.w, top: 2.h, right: 2.w),
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 5.w, vertical: 1.h),
//                                         width: 75.w,
//                                         decoration: BoxDecoration(
//                                           color: Color(0xffb4776e6)
//                                               .withOpacity(0.3),
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(0.0),
//                                               topLeft: Radius.circular(20.0),
//                                               topRight: Radius.circular(20.0),
//                                               bottomRight:
//                                                   Radius.circular(20.0)),
//                                           shape: BoxShape.rectangle,
//                                         ),
//                                         child: Text(
//                                             "Here, content here, making it look like readable English.",
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontFamily: 'Meta1',
//                                                 fontSize: 12.sp)),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 1.w),
//                                         child: Text(
//                                           "11:42".toString(),
//                                           style: TextStyle(
//                                               color: Colors.white70,
//                                               fontFamily: 'Meta1',
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.normal,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 23.w, right: 3.w, top: 1.h),
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.end,
//                                     children: [
//                                       Container(
//                                         alignment: Alignment.centerRight,
//                                         margin: EdgeInsets.only(
//                                             left: 2.w, top: 2.h, right: 2.w),
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 5.w, vertical: 1.h),
//                                         width: 85.w,
//                                         decoration: BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.only(
//                                               bottomLeft: Radius.circular(20.0),
//                                               topLeft: Radius.circular(20.0),
//                                               topRight: Radius.circular(20.0),
//                                               bottomRight:
//                                                   Radius.circular(0.0)),
//                                           shape: BoxShape.rectangle,
//                                         ),
//                                         child: Text(
//                                             "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text.",
//                                             textAlign: TextAlign.left,
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontFamily: 'Meta1',
//                                                 fontSize: 12.sp)),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(right: 1.w),
//                                         child: Text(
//                                           "11:45".toString(),
//                                           style: TextStyle(
//                                               color: Colors.white70,
//                                               fontFamily: 'Meta1',
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.normal,
//                                               fontStyle: FontStyle.normal),
//                                         ),
//                                       ),

//                                       // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),