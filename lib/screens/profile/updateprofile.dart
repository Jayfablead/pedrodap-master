import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../../Widget/Drawer.dart';
import '../../Widget/const.dart';

class EditProfile extends StatefulWidget {
  String? name;
  String? profile;
  String? email;
  String? exp;
  String? age;
  String? pos;
  String? about;

  EditProfile({
    super.key,
    this.name,
    this.profile,
    this.email,
    this.exp,
    this.age,
    this.about,
    this.pos,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _user = TextEditingController(text: "");
  TextEditingController _age = TextEditingController(text: "");

  TextEditingController _email = TextEditingController(text: "");
  TextEditingController _about = TextEditingController(text: "");
  ImagePicker _picker = ImagePicker();
  ImagePicker _picker1 = ImagePicker();
  File? imagefile;
  TextEditingController _exp = TextEditingController(text: "");
  TextEditingController _pos = TextEditingController(text: "");
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _user.text = widget.name.toString();
    _age.text = widget.age.toString();
    _pos.text = widget.pos.toString();
    _email.text = widget.email.toString();
    _about.text = widget.about.toString();
    _exp.text = widget.exp.toString();
    setState(() {
      _controller = VideoPlayerController.network(
          profiledata!.viewProfileDetails!.video!);
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
      isloading = false;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: drawer(),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
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
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 1.w),
                        height: 15.h,
                        width: 30.w,
                        padding: EdgeInsets.all(1.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(90),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.profile.toString(),
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/icons/user.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 9.5.h,
                          left: 23.w,
                          child: InkWell(
                              onTap: () async {
                                final XFile? image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                print(
                                    "========================================== " +
                                        image!.path);
                              },
                              child: Container(
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20)),
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
                      controller: _exp,
                      style: TextStyle(color: Colors.white),
                      enabled: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "SEnter Experince";
                        }
                        return null;
                      },
                      onTap: null,
                      decoration: inputDecoration(
                        icon: Icon(Icons.date_range),
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
                    decoration:
                        inputDecoration(lable: "Age", icon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: _pos,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Give Position";
                      }
                      return null;
                    },
                    decoration: inputDecoration(
                        lable: "Position", icon: Icon(Icons.person)),
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
                        lable: "About", icon: Icon(Icons.info_outline_rounded)),
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
                        height: 25.h,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          // color: Colors.white.withOpacity(0.15),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [InkWell(
                              onTap: () async{final XFile? image = await _picker1.pickImage(
                                  source: ImageSource.gallery);
                              print(
                                  "========================================== " +
                                      image!.path);},
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                height: 20.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.white)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                            ),SizedBox(width: 2.w,),
                              SizedBox(
                                width: 80.w,
                                child: GridView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: profiledata!
                                        .viewProfileDetails!.images!.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 1),
                                    itemBuilder: (contex, index) {
                                      return Stack(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 1.w),
                                            height: 20.h,
                                            width: 60.w,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: profiledata!
                                                    .viewProfileDetails!
                                                    .images![index]
                                                    .toString(),
                                                progressIndicatorBuilder:
                                                    (context, url,
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
                                                  child: Text(
                                                    "No Images Available",
                                                    style: textStyle,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 38.w,
                                            bottom: 19.h,
                                            child: Container(
                                              padding: EdgeInsets.all(2.w),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.black,
                                              ),
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
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
                        height: 25.h,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          // color: Colors.white.withOpacity(0.15),
                        ),
                        child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [InkWell(
                              onTap: () async{final XFile? image = await _picker1.pickImage(
                                  source: ImageSource.gallery);
                              print(
                                  "========================================== " +
                                      image!.path);},
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                height: 20.h,
                                width: 45.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.white)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                            ),SizedBox(width: 2.w,),
                              Stack(
                                children: [
                                  Container(
                                    width: 70.w,
                                    margin: EdgeInsets.symmetric(horizontal: 1.w),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                          height: 42.h,
                                          width: 220.w,
                                          child: profiledata!
                                                      .viewProfileDetails!.video! ==
                                                  ''
                                              ? Text(
                                                  'No videos Availlable',
                                                  style: textStyle,
                                                )
                                              : VideoPlayer(
                                                  _controller,
                                                )),
                                    ),
                                  ),
                                  Positioned(
                                    left: 65.w,
                                    bottom: 20.h,
                                    child: Container(
                                      padding: EdgeInsets.all(2.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
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

// profile() {
//   final Map<String, String> data = {};
//   data['user_id'] = ' ${userData?.data?.uId}';
//   data['action'] = 'view_profile';
//   print(' ${userData?.data?.uId}' + '================================');
//   checkInternet().then((internet) async {
//     if (internet) {
//       authprovider().viewapi(data).then((Response response) async {
//         viewdata = ViewModel.fromJson(json.decode(response.body));
//         if (response.statusCode == 200 && viewdata?.status == 1) {
//           setState(() {
//             isLoading = false;
//             _user.text = viewdata!.data!.fullname ?? "";
//             _email.text = (viewdata?.data?.email) ?? "";
//             _phone.text = (viewdata?.data?.phoneno) ?? "";
//             _add.text = (viewdata?.data?.address) ?? "";
//
//             _gen.text = (viewdata?.data?.gender) ?? "";
//             _date.text = (viewdata?.data?.dateOfBirth) ?? "";
//           });
//
//           if (kDebugMode) {}
//         } else {
//           setState(() {
//             isLoading = false;
//           });
//           buildErrorDialog(context, '', "No Agent Data");
//         }
//       });
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//       buildErrorDialog(context, 'Error', "Internate Required");
//     }
//   });
// }
// view() {
//   final Map<String, String> data = {};
//   data['action'] = "view_profile";
//   data['user_id'] = (userData?.data?.uId).toString();
//   checkInternet().then((internet) async {
//     if (internet) {
//       authprovider().viewapi(data).then((Response response) async {
//         viewmodel = ViewModel.fromJson(json.decode(response.body));
//         if (response.statusCode == 200 && viewmodel?.status == "1") {
//           setState(() {
//             // isLoading = false;
//           });
//           // await SaveDataLocal.saveLogInData(userData!);
//           _user.text = viewmodel?.data?.fullname ?? "";
//           _email.text = (viewmodel?.data?.email) ?? "";
//           _phone.text = (viewmodel?.data?.phoneno) ?? "";
//           _add.text = (viewmodel?.data?.address) ?? "";
//           _expertise.text = (viewmodel?.data?.expertise) ?? "";
//           _emergency_contact.text = (viewmodel?.data?.emergencyContact) ?? "";
//           _additionaltravel.text =
//               (viewmodel?.data?.additionalTraveller) ?? "";
//           _date.text = (viewmodel?.data?.dateOfBirth) ?? "";
//           // await SaveDataLocal.getDataFromLocal(userData!);
//           if (kDebugMode) {}
//           // buildErrorDialog(context, "","Login Successfully");
//           //
//           //
//           // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>login()));
//         } else {
//           // buildErrorDialog(context, "","Invalid login");
//         }
//       });
//     } else {
//       setState(() {
//         // isLoading = false;
//       });
//       buildErrorDialog(context, 'Error', "Internate Required");
//     }
//   });
// }
}
