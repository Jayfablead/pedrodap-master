
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
import 'package:pedrodap/loader.dart';
import 'package:pedrodap/screens/profile/Chatpage.dart';
import 'package:pedrodap/screens/profile/chatvideo.dart';
import 'package:sizer/sizer.dart';

import '../../Model/Viewmsgmodal.dart';
import '../../Model/profileModal.dart';
import '../../Widget/buildErrorDialog.dart';
import '../../Widget/const.dart';
import '../../Widget/sharedpreferance.dart';
import '../../Widget/webview.dart';
import '../../provider/authprovider.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

class MessagePage extends StatefulWidget {
  String? image;
  String? name;
  String? uid;

  MessagePage({required this.image, required this.name, required this.uid});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  TextEditingController _chat = TextEditingController();
  int? type;
  File? _pickedFile = null;
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
  Timer? _timer;
  var outputDate2 = "";
  var outputDate1;
  String? date2 = "";
  String? data1;

  Future<void> Counter() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      diff;
      outputDate1;
    });
  }

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

    print(widget.uid ?? '');
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      showmessageapi(widget.uid.toString());
    });
    senderid = userData?.userData?.uid.toString();

    // _scrollController.animateTo(
    //     _scrollController.position.minScrollExtent,
    //     duration: Duration(milliseconds: 200),
    //     curve: Curves.easeInOut
    // );
    // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }
  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isloading,
      scaffold: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 00,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(),
                  ));
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
                      height: 6.h,
                      width: 13.w,
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
        body: isloading
            ? Container()
            : Stack(
                children: [
                  SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              viewmsgs?.data?.length == 0
                                  ? Container(
                                      height: 85.h,
                                      alignment: Alignment.center,
                                      child: Text(
                                        'No Messages Available',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'Meta1',
                                          color: Color(0xffffffff),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30.0),
                                              topLeft: Radius.circular(30.0))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              SizedBox(
                                                height: 80.h,
                                                child: ListView.builder(
                                                    reverse: true,
                                                    controller:
                                                        _scrollController,
                                                    itemCount:
                                                        viewmsgs?.data?.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      bool showSeparator =
                                                          false;
                                                      print(viewmsgs
                                                          ?.data?[index].date);
                                                      var outputFormat2 =
                                                          DateFormat(
                                                              'dd-MM-yyyy');
                                                      var outputFormat1 =
                                                          DateFormat("dd");
                                                      DateTime parseDate =
                                                          DateFormat(
                                                                  "dd-MM-yyyy")
                                                              .parse(viewmsgs
                                                                      ?.data?[
                                                                          index]
                                                                      .date ??
                                                                  "");

                                                      if (index <
                                                          (viewmsgs!.data!
                                                                  .length -
                                                              1)) {
                                                        var outputFormat2 =
                                                            DateFormat(
                                                                'dd-MM-yyyy');
                                                        DateTime parseDate1 =
                                                            DateFormat(
                                                                    "dd-MM-yyyy")
                                                                .parse(viewmsgs
                                                                        ?.data?[
                                                                            index +
                                                                                1]
                                                                        .date ??
                                                                    "");
                                                        var inputDate1 =
                                                            DateTime.parse(
                                                                parseDate1
                                                                    .toString());
                                                        outputDate2 =
                                                            outputFormat2
                                                                .format(
                                                                    inputDate1);
                                                      }
                                                      var inputDate =
                                                          DateTime.parse(
                                                              parseDate
                                                                  .toString());
                                                      var outputFormat =
                                                          DateFormat(
                                                              ' hh:mm a');
                                                      var outputDate =
                                                          outputFormat.format(
                                                              inputDate);
                                                      outputDate1 =
                                                          outputFormat2.format(
                                                              inputDate);
                                                      date2 = outputFormat1
                                                          .format(inputDate);

                                                      diff = (DateTime.now()
                                                              .day) -
                                                          int.parse(
                                                              date2.toString());
                                                      Counter();

                                                      // outputDate2 = outputFormat2.format(inputDate);
                                                      if (outputDate1 !=
                                                          outputDate2) {
                                                        showSeparator = true;
                                                      } else {
                                                        // showSeparator = true;
                                                      }
                                                      return Column(
                                                        children: [
                                                          (showSeparator)
                                                              ? Column(
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          2.h,
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.all(1
                                                                            .w),
                                                                        padding:
                                                                            EdgeInsets.all(1
                                                                                .w),
                                                                        height:
                                                                            4.h,
                                                                        width: 25
                                                                            .w,
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(15.0),
                                                                          color: Colors
                                                                              .transparent
                                                                              .withOpacity(0.3),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          (diff == 0)
                                                                              ? "Today"
                                                                              : (diff == 1)
                                                                                  ? "Yesterday"
                                                                                  : outputDate1.toString(),
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 12.sp,
                                                                              fontFamily: 'Meta1'),
                                                                        )),
                                                                  ],
                                                                )
                                                              : Container(),
                                                          (senderid ==
                                                                  viewmsgs
                                                                      ?.data?[
                                                                          index]
                                                                      .fromUserId
                                                                      .toString())
                                                              ? Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerRight,
                                                                  padding: EdgeInsets.only(
                                                                      left:
                                                                          35.w,
                                                                      right:
                                                                          3.w,
                                                                      top: 0.h),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Container(
                                                                        // width:60.w,
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                0.w,
                                                                            top: 2.h,
                                                                            right: 2.w),
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                5.w,
                                                                            vertical: 1.h),
                                                                        // width: 75.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                          borderRadius: BorderRadius.only(
                                                                              bottomLeft: Radius.circular(20.0),
                                                                              topLeft: Radius.circular(20.0),
                                                                              topRight: Radius.circular(20.0),
                                                                              bottomRight: Radius.circular(0.0)),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child: viewmsgs?.data?[index].messageType ==
                                                                                "1"
                                                                            ? Text((viewmsgs?.data?[index].message).toString(),
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(color: Colors.black, fontFamily: 'Meta1', fontSize: 12.sp))
                                                                            : (viewmsgs?.data?[index].messageType) == '2'
                                                                                ? ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                    child: CachedNetworkImage(
                                                                                      fit: BoxFit.cover,
                                                                                      imageUrl: (viewmsgs?.data?[index].message).toString(),
                                                                                      progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(),
                                                                                      errorWidget: (context, url, error) => Image.asset(
                                                                                        'assets/icons/user.png',
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                : (viewmsgs?.data?[index].messageType) == '3'
                                                                                    ? Container(
                                                                                        height: 35.h,
                                                                                        width: 40.w,
                                                                                        child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(20),
                                                                                            child: addvideo(
                                                                                              vid: (viewmsgs?.data?[index].message).toString(),
                                                                                            )))
                                                                                    : Container(),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(right: 1.w),
                                                                        child:
                                                                            Text(
                                                                          (viewmsgs?.data?[index].time)
                                                                              .toString(),
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
                                                                )
                                                              : Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  padding: EdgeInsets.only(
                                                                      right:
                                                                          25.w,
                                                                      left: 3.w,
                                                                      top: 1.h),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                2.w,
                                                                            top: 2.h,
                                                                            right: 2.w),
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                5.w,
                                                                            vertical: 1.h),
                                                                        // width: 40.w,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white12,
                                                                          borderRadius: BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              topLeft: Radius.circular(20.0),
                                                                              topRight: Radius.circular(20.0),
                                                                              bottomRight: Radius.circular(20.0)),
                                                                          shape:
                                                                              BoxShape.rectangle,
                                                                        ),
                                                                        child: viewmsgs?.data?[index].messageType ==
                                                                                "1"
                                                                            ? Text((viewmsgs?.data?[index].message).toString(),
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(color: Colors.white, fontFamily: 'Meta1', fontSize: 12.sp))
                                                                            : (viewmsgs?.data?[index].messageType) == '2'
                                                                                ? ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(10),
                                                                                    child: CachedNetworkImage(
                                                                                      fit: BoxFit.cover,
                                                                                      imageUrl: (viewmsgs?.data?[index].message).toString(),
                                                                                      progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(),
                                                                                      errorWidget: (context, url, error) => Image.asset(
                                                                                        'assets/place.jpeg',
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                : (viewmsgs?.data?[index].messageType) == '3'
                                                                                    ? Container(
                                                                            height: 35.h,
                                                                                        width: 40.w,
                                                                                        child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(20),
                                                                                            child: addvideo(
                                                                                              vid: (viewmsgs?.data?[index].message).toString(),
                                                                                            )))
                                                                                    : Container(),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 1.w),
                                                                        child:
                                                                            Text(
                                                                          (viewmsgs?.data?[index].time)
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              color: Colors.white70,
                                                                              fontFamily: 'Meta1',
                                                                              fontSize: 10.sp,
                                                                              fontWeight: FontWeight.normal,
                                                                              fontStyle: FontStyle.normal),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                        ],
                                                      );
                                                    }),
                                              ),
                                              Positioned(
                                                  top: 10.0,
                                                  left: 30.w,
                                                  right: 30.w,
                                                  child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 3.h,
                                                      width: 20.w,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        color: Colors.black
                                                            .withOpacity(0.3),
                                                      ),
                                                      child: Text(
                                                        (diff == 0)
                                                            ? "Today"
                                                            : (diff == 1)
                                                                ? "Yesterday"
                                                                : outputDate1
                                                                    .toString(),
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12.sp,
                                                            fontFamily:
                                                                "Meta1"),
                                                      ))),
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: 1.w, right: 1.w),
                      child: Container(
                        height: 10.h,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final content = Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 15.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            borderRadius:
                                                const BorderRadius.all(
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
                                                            source: ImageSource
                                                                .gallery);

                                                    setState(() {
                                                      EasyLoading.show(
                                                          status:
                                                              'Sending Image ...');
                                                      imagefile =
                                                          File(image!.path);
                                                      type = 2;
                                                      EasyLoading.showSuccess(
                                                          'Image Sent');
                                                      sendmessageapi();
                                                    });

                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 60.0,
                                                        width: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .cyanAccent),
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
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    final XFile? image =
                                                        await _picker.pickVideo(
                                                            source: ImageSource
                                                                .gallery);
                                                    setState(() {
                                                      EasyLoading.show(
                                                          status:
                                                              'Sendind Video ...');
                                                      imagefile =
                                                          File(image!.path);
                                                      type = 3;
                                                      EasyLoading.showSuccess(
                                                          'Video Sent');
                                                      sendmessageapi();
                                                    });

                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 60.0,
                                                        width: 60.0,
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .cyanAccent),
                                                        child: Icon(
                                                          Icons
                                                              .video_camera_back_outlined,
                                                          color: Colors.black,
                                                          size: 30.0,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Videos",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // InkWell(
                                                //   onTap: () async {
                                                //     FilePickerResult? result =
                                                //         await FilePicker
                                                //             .platform
                                                //             .pickFiles();
                                                //
                                                //     if (result != null) {
                                                //       setState(() {
                                                //         type = 5;
                                                //         _pickedFile = File(
                                                //             result.files.single
                                                //                 .path
                                                //                 .toString());
                                                //         sendmessageapi();
                                                //       });
                                                //     } else {
                                                //       // User canceled the picker
                                                //     }
                                                //   },
                                                //   child: Column(
                                                //     children: [
                                                //       Container(
                                                //         height: 60.0,
                                                //         width: 60.0,
                                                //         decoration:
                                                //             BoxDecoration(
                                                //                 shape: BoxShape
                                                //                     .circle,
                                                //                 color: Colors
                                                //                     .cyanAccent),
                                                //         child: Icon(
                                                //           Icons
                                                //               .file_open_outlined,
                                                //           color: Colors.black,
                                                //           size: 30.0,
                                                //         ),
                                                //       ),
                                                //       SizedBox(
                                                //         height: 10,
                                                //       ),
                                                //       Text(
                                                //         "File",
                                                //         style: TextStyle(
                                                //             color:
                                                //                 Colors.white),
                                                //       ),
                                                //     ],
                                                //   ),
                                                // ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 10.h,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.68,
                                          child: TextField(
                                            style:
                                                TextStyle(color: Colors.white),
                                            cursorColor: Color.fromARGB(
                                                153, 190, 190, 190),
                                            keyboardType: TextInputType.text,
                                            controller: _chat,
                                            decoration: InputDecoration(
                                              hintText: 'Enter Message',
                                              hintStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 126, 126, 126)),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                horizontal: 4.w,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              type = 1;
                                              FocusScopeNode currentFocus =
                                                  FocusScope.of(context);

                                              if (!currentFocus
                                                  .hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                            });
                                            _chat.text == ''
                                                ? Fluttertoast.showToast(
                                                    msg: "Please add Some Text",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    timeInSecForIosWeb: 1,
                                                    backgroundColor:
                                                        Colors.black,
                                                    textColor: Colors.white,
                                                    fontSize: 11.sp)
                                                : sendmessageapi();
                                          },
                                          icon: Icon(
                                            Icons.send,
                                            color: Color.fromARGB(
                                                255, 210, 210, 210),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
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
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black26),
                                textAlign: TextAlign.center,
                              ),
                              tabIndicatorAnimDuration: kTabScrollDuration,
                              categoryIcons: const CategoryIcons(),
                              buttonMode: ButtonMode.MATERIAL)),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  showmessageapi(String receive) {
    final Map<String, String> data = {};
    data['action'] = 'chat_messages_app';
    data['login_user_id'] = userData?.userData?.uid ?? '';
    data['uid'] = widget.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().Showchatapi(data).then((Response response) async {
          viewmsgs = ViewchatmsgModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && viewmsgs?.status == "success") {
            setState(() {
              isloading = false;});

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
    data['uid'] = widget.uid.toString();
    data['type'] = type.toString();
    data['message'] = (type == 1)
        ? _chat.text.toString()
        : (type == 2)
            ? imagefile!.path
            : (type == 3)
                ? imagefile!.path
                : _pickedFile!.path;
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().Sendchatapi(data).then((Response response) async {
          profiledata = ProfileModal.fromJson(json.decode(response.body));
          print(profiledata?.status);
          if (response.statusCode == 200 && profiledata?.status == "success") {
            _chat.text = '';
            showmessageapi(widget.uid.toString());
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

//      ======= Message Backup Static ======

// Padding(
// padding: EdgeInsets.only(left: 3.w, top: 1.h),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.only(
// left: 2.w, top: 2.h, right: 2.w),
// padding: EdgeInsets.symmetric(
// horizontal: 5.w, vertical: 1.h),
// width: 60.w,
// decoration: BoxDecoration(
// color: Colors.white12,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(0.0),
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// bottomRight:
// Radius.circular(20.0)),
// shape: BoxShape.rectangle,
// ),
// child: Text(
// "Will be distracted by the readable",
// textAlign: TextAlign.left,
// style: TextStyle(
// color: Colors.white,
// fontFamily: 'Meta1',
// fontSize: 12.sp)),
// ),
// Padding(
// padding: EdgeInsets.only(left: 1.w),
// child: Text(
// "11:25".toString(),
// style: TextStyle(
// color: Colors.white70,
// fontFamily: 'Meta1',
// fontSize: 10.sp,
// fontWeight: FontWeight.normal,
// fontStyle: FontStyle.normal),
// ),
// )
// ],
// ),
// ),
// Padding(
// padding: EdgeInsets.only(
// left: 26.w, right: 3.w, top: 1.h),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Container(
// margin: EdgeInsets.only(
// left: 2.w, top: 2.h, right: 2.w),
// padding: EdgeInsets.symmetric(
// horizontal: 5.w, vertical: 1.h),
// width: 75.w,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(20.0),
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// bottomRight:
// Radius.circular(0.0)),
// shape: BoxShape.rectangle,
// ),
// child: Text(
// "Content of a page when looking at its layout.",
// textAlign: TextAlign.left,
// style: TextStyle(
// color: Colors.black,
// fontFamily: 'Meta1',
// fontSize: 12.sp)),
// ),
// Padding(
// padding: EdgeInsets.only(right: 1.w),
// child: Text(
// "11:27".toString(),
// style: TextStyle(
// color: Colors.white70,
// fontFamily: 'Meta1',
// fontSize: 10.sp,
// fontWeight: FontWeight.normal,
// fontStyle: FontStyle.normal),
// ),
// ),
// // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
// ],
// ),
// ),
// Padding(
// padding: EdgeInsets.only(left: 3.w, top: 1.h),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.only(
// left: 2.w, top: 2.h, right: 2.w),
// padding: EdgeInsets.symmetric(
// horizontal: 5.w, vertical: 1.h),
// width: 75.w,
// decoration: BoxDecoration(
// color: Colors.white12,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(0.0),
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// bottomRight:
// Radius.circular(20.0)),
// shape: BoxShape.rectangle,
// ),
// child: Text(
// "The point of using Lorem Ipsum is that it has a more.",
// textAlign: TextAlign.left,
// style: TextStyle(
// color: Colors.white,
// fontFamily: 'Meta1',
// fontSize: 12.sp)),
// ),
// Padding(
// padding: EdgeInsets.only(left: 1.w),
// child: Text(
// "11:30".toString(),
// style: TextStyle(
// color: Colors.white70,
// fontFamily: 'Meta1',
// fontSize: 10.sp,
// fontWeight: FontWeight.normal,
// fontStyle: FontStyle.normal),
// ),
// )
// ],
// ),
// ),
// Padding(
// padding: EdgeInsets.only(
// left: 26.w, right: 3.w, top: 1.h),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Container(
// margin: EdgeInsets.only(
// left: 2.w, top: 2.h, right: 2.w),
// padding: EdgeInsets.symmetric(
// horizontal: 5.w, vertical: 1.h),
// width: 75.w,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(20.0),
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// bottomRight:
// Radius.circular(0.0)),
// shape: BoxShape.rectangle,
// ),
// child: Text(
// "Or-less normal distribution of letters, as opposed to using Content.",
// textAlign: TextAlign.left,
// style: TextStyle(
// color: Colors.black,
// fontFamily: 'Meta1',
// fontSize: 12.sp)),
// ),
// Padding(
// padding: EdgeInsets.only(right: 1.w),
// child: Text(
// "11:33".toString(),
// style: TextStyle(
// color: Colors.white70,
// fontFamily: 'Meta1',
// fontSize: 10.sp,
// fontWeight: FontWeight.normal,
// fontStyle: FontStyle.normal),
// ),
// ),
// // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
// ],
// ),
// ),
// Padding(
// padding: EdgeInsets.only(left: 3.w, top: 1.h),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// margin: EdgeInsets.only(
// left: 2.w, top: 2.h, right: 2.w),
// padding: EdgeInsets.symmetric(
// horizontal: 5.w, vertical: 1.h),
// width: 75.w,
// decoration: BoxDecoration(
// color: Colors.white12,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(0.0),
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// bottomRight:
// Radius.circular(20.0)),
// shape: BoxShape.rectangle,
// ),
// child: Text(
// "Here, content here, making it look like readable English.",
// textAlign: TextAlign.left,
// style: TextStyle(
// color: Colors.white,
// fontFamily: 'Meta1',
// fontSize: 12.sp)),
// ),
// Padding(
// padding: EdgeInsets.only(left: 1.w),
// child: Text(
// "11:42".toString(),
// style: TextStyle(
// color: Colors.white70,
// fontFamily: 'Meta1',
// fontSize: 10.sp,
// fontWeight: FontWeight.normal,
// fontStyle: FontStyle.normal),
// ),
// )
// ],
// ),
// ),
// Padding(
// padding: EdgeInsets.only(
// left: 23.w, right: 3.w, top: 1.h),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Container(
// alignment: Alignment.centerRight,
// margin: EdgeInsets.only(
// left: 2.w, top: 2.h, right: 2.w),
// padding: EdgeInsets.symmetric(
// horizontal: 5.w, vertical: 1.h),
// width: 85.w,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(20.0),
// topLeft: Radius.circular(20.0),
// topRight: Radius.circular(20.0),
// bottomRight:
// Radius.circular(0.0)),
// shape: BoxShape.rectangle,
// ),
// child: Text(
// "Many desktop publishing packages and web page editors now use Lorem Ipsum as their description.",
// textAlign: TextAlign.left,
// style: TextStyle(
// color: Colors.black,
// fontFamily: 'Meta1',
// fontSize: 12.sp)),
// ),
// Padding(
// padding: EdgeInsets.only(right: 1.w),
// child: Text(
// "11:45".toString(),
// style: TextStyle(
// color: Colors.white70,
// fontFamily: 'Meta1',
// fontSize: 10.sp,
// fontWeight: FontWeight.normal,
// fontStyle: FontStyle.normal),
// ),
// ),
// // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
// ],
// ),
// ),
//

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
