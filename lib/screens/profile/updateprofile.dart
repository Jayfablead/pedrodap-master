import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pedrodap/Widget/videoprof.dart';
import 'package:pedrodap/screens/profile/myprofile.dart';
import 'package:pedrodap/successdia.dart';
import 'package:pedrodap/video.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../../Model/profileModal.dart';
import '../../Widget/Drawer.dart';
import '../../Widget/buildErrorDialog.dart';
import '../../Widget/const.dart';
import '../../Widget/sharedpreferance.dart';
import '../../loader.dart';
import '../../provider/authprovider.dart';

class EditProfile extends StatefulWidget {
  String? name;
  String? profile;
  String? email;
  String? exp;
  String? age;
  String? pos;
  String? about;
  String? videos;
  String? injuries;
  String? goals;

  EditProfile({
    super.key,
    this.name,
    this.profile,
    this.email,
    this.exp,
    this.age,
    this.about,
    this.pos,
    this.videos,
    this.injuries,
    this.goals,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _user = TextEditingController(text: "");
  TextEditingController _age = TextEditingController(text: "");
  TextEditingController _goals = TextEditingController(text: "");
  TextEditingController _inj = TextEditingController(text: "");
  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _about = TextEditingController(text: "");
  TextEditingController _cap = TextEditingController(text: "");
  ImagePicker _picker = ImagePicker();
  ImagePicker _picker1 = ImagePicker();
  var imagesTemporary;
  File? imagefile;
  File? imagefile1;
  File? videofile;
  TextEditingController _exp = TextEditingController(text: "");
  TextEditingController _pos = TextEditingController(text: "");
  TextEditingController _ocup = TextEditingController(text: "");
  TextEditingController _url = TextEditingController(text: "");
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  late VideoPlayerController _controller;
  XFile? image;
  XFile? video;
  List<XFile>? _imageFileList;
  List<Path> images = [];
  int? select;
  String? it;
  bool isloading = true;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(
        " =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= ${widget.videos} =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
    playerapi1();
    _user.text = widget.name.toString();
    _age.text = widget.age.toString();
    _ocup.text = widget.pos.toString();
    _email.text = widget.email.toString();
    _about.text = widget.about.toString();
    _exp.text = widget.exp.toString();
    _inj.text = widget.injuries.toString();
    _goals.text = widget.goals.toString();
    setState(() {
      _controller = VideoPlayerController.network(
          profiledata?.viewProfileDetails?.video ?? '');
      _controller.addListener(() {
        if (!_controller.value.isPlaying &&
            _controller.value.isInitialized &&
            (_controller.value.duration == _controller.value.position)) {}
      });
      _controller.initialize().then((_) => setState(() {}));
      _controller.play();

      _controller.setLooping(true);
      _controller.setVolume(0.0);
      _about.text = profiledata!.viewProfileDetails!.about.toString();
    });
    setState(() {});
    configLoading();
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        timer?.cancel();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: drawer(),
      key: _scaffoldKey,
      body: WillPopScope(
        onWillPop: dialog,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 5.w,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Meta1",
                        color: Color(0xffeaeaea),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        // Container(
                        //   height: 15.h,
                        //   width: 30.w,
                        //   child: (imagefile != null)
                        //       ? Image.file(imagefile!, width: 300.0)
                        //       : Image.asset("assets/prof.jpg"),
                        // ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          height: 15.h,
                          width: 30.w,
                          padding: EdgeInsets.all(1.w),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: (imagefile != null)
                                  ? Image.file(
                                      imagefile!,
                                      width: 300.0,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      widget.profile.toString(),
                                      fit: BoxFit.cover,
                                    )),
                        ),
                        Positioned(
                            top: 9.5.h,
                            left: 23.w,
                            child: InkWell(
                                onTap: () async {
                                  final image = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    imagefile = File(image!.path);
                                  });
                                },
                                child: Container(
                                    padding: EdgeInsets.all(2.w),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                    )))),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _user,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter the Name";
                        }
                        return null;
                      },
                      decoration: inputDecoration(
                        lable: "Full Name",
                        icon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _url,
                      keyboardType: TextInputType.text,
                      decoration: inputDecoration(
                        lable: "Instagram URL",
                        icon: Icon(Icons.connect_without_contact),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                        controller: _exp,
                        style: TextStyle(color: Colors.white),
                        enabled: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Experince";
                          }
                          return null;
                        },
                        onTap: null,
                        decoration: inputDecoration(
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.grey,
                          ),
                          lable: "Experince",
                        )),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _age,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Give Age";
                        }
                        return null;
                      },
                      decoration: inputDecoration(
                          lable: "Age",
                          icon: Icon(
                            Icons.person_pin_circle_outlined,
                            color: Colors.grey,
                          )),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _ocup,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return userData!.userData!.role == '2'
                              ? "Give Position"
                              : 'Give Ocupation';
                        }
                        return null;
                      },
                      decoration: inputDecoration(
                          lable: userData!.userData!.role == '2'
                              ? "Position "
                              : "Ocupation ",
                          icon: Icon(
                            Icons.person,
                            color: Colors.grey,
                          )),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _inj,
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Tell About Injuries";
                        }
                        return null;
                      },
                      decoration: inputDecoration(
                          lable: "Injuries",
                          icon: Icon(
                            Icons.personal_injury_outlined,
                            color: Colors.grey,
                          )),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: _goals,
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Add Your Goals & Ambitions";
                        }
                        return null;
                      },
                      decoration: inputDecoration(
                          lable: "Goals & Ambitions",
                          icon: Icon(
                            Icons.archive_outlined,
                            color: Colors.grey,
                          )),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      maxLines: 5,
                      controller: _about,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter About Detials";
                        }
                        return null;
                      },
                      decoration: inputDecoration(
                          lable: "About",
                          icon: Icon(
                            Icons.info_outline_rounded,
                            color: Colors.grey,
                          )),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.image_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              "My Images : ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Meta1",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 35.h,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(1.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            // color: Colors.white.withOpacity(0.15),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                side: BorderSide(
                                                    color: Colors.white)),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                InkWell(
                                                    onTap: () async {
                                                      final image1 =
                                                          await _picker.pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                      setState(() {
                                                        imagefile1 =
                                                            File(image1!.path);
                                                      });
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 50.w,
                                                      padding:
                                                          EdgeInsets.all(1.5.h),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                          border: Border.all(
                                                              color: Colors
                                                                  .white)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.add,
                                                            color: Colors.white,
                                                          ),
                                                          SizedBox(
                                                            width: 2.w,
                                                          ),
                                                          Text(
                                                            'Add Image',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Meta1',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),SizedBox(
                                                  height: 4.h,
                                                ),
                                                TextFormField(
                                                  style: TextStyle(color: Colors.white),
                                                  controller: _cap,

                                                  keyboardType: TextInputType.text,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Add Caption";
                                                    }
                                                    return null;
                                                  },
                                                  decoration: inputDecoration(
                                                      lable: "Add Caption",
                                                      icon: Icon(
                                                        Icons.closed_caption_off,
                                                        color: Colors.grey,
                                                      )),
                                                ),
                                              ],
                                            ));
                                      },
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    height: 20.h,
                                    width: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          'Add Photo',
                                          style: textStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                (imagefile1 != null)
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          imagefile1!,
                                          height: 20.h,
                                          width: 50.w,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  width: 2.w,
                                ),
                                SizedBox(
                                  width: 80.w,
                                  child: GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: profiledata
                                          ?.viewProfileDetails?.images!.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              childAspectRatio: 1 / 1.4,
                                              crossAxisCount: 1),
                                      itemBuilder: (contex, index) {
                                        return Stack(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  height: 20.h,
                                                  width: 60.w,
                                                  fit: BoxFit.cover,
                                                  imageUrl: profiledata!
                                                      .viewProfileDetails!
                                                      .images![index]
                                                      .toString(),
                                                  progressIndicatorBuilder: (context,
                                                          url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                          value:
                                                              downloadProgress
                                                                  .progress),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 2.h, bottom: 2.h),
                                                    child: Center(
                                                      child: Text(
                                                        "Add Some Images",
                                                        style: textStyle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 52.w,
                                              bottom: 19.h,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    select = index;
                                                  });
                                                  var parts = profiledata!
                                                      .viewProfileDetails!
                                                      .images![index]
                                                      .toString()
                                                      .split('/');
                                                  it = parts.last.toString();

                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              side: BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                      backgroundColor:
                                                          Color.fromARGB(
                                                              255, 0, 0, 0),
                                                      scrollable: true,
                                                      content: Text(
                                                        'Are You Sure You Want to Delete this Image? This Can\'t be Undone .',
                                                        style: TextStyle(
                                                            fontSize: 11.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontFamily: 'Meta1',
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      actions: [
                                                        InkWell(
                                                          onTap: () {
                                                            imgdlt();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    2.w),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1.h),
                                                            child: Text(
                                                              'Yes',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Meta1',
                                                                  color: Colors
                                                                      .green),
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .green,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.all(
                                                                    1.w),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    1.h),
                                                            child: Text(
                                                              'No',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      13.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontFamily:
                                                                      'Meta1',
                                                                  color: Colors
                                                                      .red),
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: Colors
                                                                        .black,
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(2.w),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.black,
                                                  ),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.video_camera_back_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              "My Videos : ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Meta1",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 30.h,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(1.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            // color: Colors.white.withOpacity(0.15),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () async {
                                    final video = await _picker.pickVideo(
                                        source: ImageSource.gallery);
                                    setState(() {
                                      videofile = File(video!.path);
                                    });
                                    print(
                                        '=-=-=-=-=-=-=-=-=-=-=-=-=-= $videofile =-=-=-=-=-=-=-=-==-=-=-');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    height: 20.h,
                                    width: 45.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Text(
                                          'Add Video',
                                          style: textStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                (videofile != null)
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          height: 20.h,
                                          width: 50.w,
                                          child: profplayer(
                                            video: videofile?.path.toString(),
                                          ),
                                        ),
                                      )
                                    : Container(),
                                SizedBox(
                                  width: 2.w,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 20.h,
                                    width: 60.w,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: profiledata
                                                        ?.viewProfileDetails
                                                        ?.video ==
                                                    null
                                                ? Center(
                                                    child: Container(),
                                                  )
                                                : VideoPlayer(_controller)),
                                        widget.videos == null
                                            ? Container()
                                            : Positioned(
                                                left: 52.w,
                                                bottom: 17.h,
                                                child: InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            side: BorderSide(
                                                                color: Colors
                                                                    .white)),
                                                        backgroundColor:
                                                            Color.fromARGB(
                                                                255, 0, 0, 0),
                                                        scrollable: true,
                                                        content: Text(
                                                          'Are You Sure You Want to Delete this Video ? This Can\'t be Undone.',
                                                          style: TextStyle(
                                                              fontSize: 11.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontFamily:
                                                                  'Meta1',
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        actions: [
                                                          InkWell(
                                                            onTap: () {
                                                              viddlt();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .all(2.w),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(1.h),
                                                              child: Text(
                                                                'Yes',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Colors
                                                                        .green),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .green,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .all(1.w),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(1.h),
                                                              child: Text(
                                                                'No',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontFamily:
                                                                        'Meta1',
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: Colors
                                                                          .black,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(2.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: Colors.black,
                                                    ),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Stack(
                                //   children: [
                                //     Container(
                                //       width: 70.w,
                                //       margin: EdgeInsets.symmetric(horizontal: 1.w),
                                //       child: ClipRRect(
                                //         borderRadius: BorderRadius.circular(10),
                                //         child: Container(
                                //             height: 42.h,
                                //             width: 220.w,
                                //             child: profiledata!
                                //                         .viewProfileDetails!.video! ==
                                //                     ''
                                //                 ? Text(
                                //                     'No videos Availlable',
                                //                     style: textStyle,
                                //                   )
                                //                 : VideoPlayer(
                                //                     _controller,
                                //                   )),
                                //       ),
                                //     ),
                                //     Positioned(
                                //       left: 65.w,
                                //       bottom: 20.h,
                                //       child: Container(
                                //         padding: EdgeInsets.all(2.w),
                                //         decoration: BoxDecoration(
                                //           borderRadius: BorderRadius.circular(20),
                                //           color: Colors.black,
                                //         ),
                                //         child: Icon(
                                //           Icons.close,
                                //           color: Colors.white,
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () async {
                              _user.text == '' ||
                                      _ocup.text == '' ||
                                      _about.text == '' ||
                                      _age.text == '' ||
                                      _exp.text == ''
                                  ? buildErrorDialog(context, "Error",
                                      'Please Add All Details')
                                  : playerapi();
                            },
                            child: Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Update Profile',
                                style: textStyle,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle textStyle =
      TextStyle(color: Colors.white, fontSize: 12.sp, fontFamily: "Meta1");

  TextStyle textStyle1 = TextStyle(
      fontFamily: "Meta1",
      fontSize: 10.sp,
      color: Colors.grey,
      fontWeight: FontWeight.w400);

  InputDecoration inputDecoration({
    required String lable,
    required Icon icon,
  }) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.5.h),
      fillColor: Colors.black,
      hoverColor: Colors.black,
      focusColor: Colors.black,
      filled: true,
      errorStyle: TextStyle(
        color: Colors.red,
      ),
      // hintText: "jjhbf",
      label: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(lable),
      ),

      hintStyle: textStyle1,
      labelStyle:
          TextStyle(fontSize: 12.sp, fontFamily: "Meta1", color: Colors.grey),
      prefixIcon: icon,
      prefixIconColor: Colors.grey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
    );
  }

  Future<bool> dialog() async {
    buildErrorDialog(context, "Sorry", "You Can't Go back At this Stage");
    return await false;
  }

  // name
  // experience
  // position
  // age
  // profile_image
  // images
  // videos

  playerapi1() {
    final Map<String, String> data = {};
    data['action'] = 'view_profile_details';
    data['uid'] = userData?.userData?.uid ?? '';

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().profileapi(data).then((Response response) async {
          profiledata = ProfileModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && userData?.status == "success") {
            print(
                '========================================== I\'m Here ===========');
            setState(() {
              _about.text = profiledata?.viewProfileDetails?.about ?? '';
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

  playerapi() {
    final Map<String, String> data = {};
    data['action'] = 'update_profile_app';
    data['uid'] = userData!.userData!.uid.toString();
    data['name'] = _user.text.trim();
    data['experience'] = _exp.text.trim();
    data['age'] = _age.text.trim();
    data['position'] = _ocup.text.trim();
    data['about'] = _about.text.trim();
    // data['occupation'] = _ocup.text.trim();
    data['injuries'] = _inj.text.trim();
    data['goals'] = _goals.text.trim();
    data['img_caption'] = _cap.text.trim();
    data['profile_image'] = imagefile != null ? imagefile!.path : "";
    data['images[]'] = imagefile1 != null ? imagefile1!.path : "";
    data['video'] = videofile != null ? videofile?.path ?? '' : "";

    checkInternet().then((internet) async {
      if (internet) {
        EasyLoading.show(status: 'Updating Profile ...');
        authprovider().updateprofileapi(data).then((Response response) async {
          profiledata = ProfileModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && profiledata?.status == "success") {
            EasyLoading.showSuccess(' Profile Updated Successfully!');
            SuccessDialog(context, 'Done', 'Profile Changed Successfully');

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
            print(userData!.userData!.uid);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            EasyLoading.showError(' Profile error!');
            setState(() {});
          }
        });
      } else {
        setState(() {});
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

  viddlt() {
    final Map<String, String> data = {};
    data['action'] = 'delete_video';
    data['uid'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().delevideoapi(data).then((Response response) async {
          profiledata = ProfileModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && profiledata?.status == "success") {
            update();
            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
            print(userData!.userData!.uid);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {});
          }
        });
      } else {
        setState(() {});
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

  imgdlt() {
    final Map<String, String> data = {};
    data['action'] = 'delete_images';
    data['uid'] = userData!.userData!.uid.toString();
    data['image_name'] = it.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().deletephotoapi(data).then((Response response) async {
          profiledata = ProfileModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && profiledata?.status == "success") {
            update();
            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
            print(userData!.userData!.uid);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {});
          }
        });
      } else {
        setState(() {});
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }

  update() {
    final Map<String, String> data = {};
    data['action'] = 'view_profile_details';
    data['uid'] = userData!.userData!.uid.toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().profileapi(data).then((Response response) async {
          profiledata = ProfileModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && userData?.status == "success") {
            print('======================' +
                profiledata!.viewProfileDetails!.about!);
            setState(() {
              _about.text = profiledata!.viewProfileDetails!.about.toString();
            });

            await SaveDataLocal.saveLogInData(userData!);
            print(userData?.status);
            print(userData!.userData!.uid);

            // buildErrorDialog(context, "", "Login Successfully");
          } else {
            setState(() {});
          }
        });
      } else {
        setState(() {});
        buildErrorDialog(context, 'Error', "Internate Required");
      }
    });
  }
}
