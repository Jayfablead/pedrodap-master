// ListView.builder(
// reverse: true,
// shrinkWrap: true,
// controller: _scrollController,
// itemCount:
// messagemodel?.data?.length,
// itemBuilder: (context, index) {
// bool showSeparator = false;
// print(messagemodel
//     ?.data?[index].date );
// var outputFormat2 =
// DateFormat('dd/MM/yyyy');
// var outputFormat1 =
// DateFormat("dd");
// DateTime parseDate = DateFormat(
// "dd/MM/yyyy hh:mm:ss")
//     .parse(messagemodel
//     ?.data?[index].date ??
// "");
//
// if (index <
// (messagemodel!.data!.length -
// 1)) {
// var outputFormat2 =
// DateFormat('dd/MM/yyyy');
// DateTime parseDate1 = DateFormat(
// "dd/MM/yyyy hh:mm:ss")
//     .parse(messagemodel
//     ?.data?[index + 1]
//     .date ??
// "");
// var inputDate1 = DateTime.parse(
// parseDate1.toString());
// outputDate2 = outputFormat2
//     .format(inputDate1);
// }
// var inputDate = DateTime.parse(
// parseDate.toString());
// var outputFormat =
// DateFormat(' hh:mm a');
// var outputDate = outputFormat
//     .format(inputDate);
// outputDate1 = outputFormat2
//     .format(inputDate);
// date2 = outputFormat1
//     .format(inputDate);
//
// diff = (DateTime.now().day) -
// int.parse(date2.toString());
// Counter();
//
// // outputDate2 = outputFormat2.format(inputDate);
// if (outputDate1 != outputDate2) {
// showSeparator = true;
// } else {
// // showSeparator = true;
// }
// return Column(
// children: [
// (showSeparator)
// ? Column(
// children: [
// SizedBox(
// height: 2.h,
// ),
// Container(
// margin:
// EdgeInsets
//     .all(1
//     .w),
// padding:
// EdgeInsets
//     .all(1
//     .w),
// height: 4.h,
// width: 25.w,
// alignment:
// Alignment
//     .center,
// decoration:
// BoxDecoration(
// borderRadius:
// BorderRadius
//     .circular(
// 15.0),
// color: Colors
//     .transparent
//     .withOpacity(
// 0.3),
// ),
// child: Text(
// (diff == 0)
// ? "Today"
//     : (diff ==
// 1)
// ? "Yesterday"
//     : outputDate1
//     .toString(),
// style: TextStyle(
// color: Colors
//     .white,
// fontSize:
// 12.sp,
// fontFamily:
// "Poppins"),
// )),
// ],
// )
//     : Container(),
// (senderid ==
// messagemodel
//     ?.data?[index]
//     .fromUserId)
// ? Padding(
// padding:
// EdgeInsets.only(
// left: 35.w,
// right: 3.w,
// top: 0.h),
// child: Container(
// // alignment: Alignment
// //     .centerLeft,
// width:60.w,
// margin: EdgeInsets.only(
// left: 2.w,
// top: 2.h,
// right: 2.w),
// decoration: BoxDecoration(
// color:Color(0xffb01abc9),
// borderRadius: BorderRadius.circular(5.0)
// ),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment
//     .end,
// children: [
// Container(
// // height: 30.h,
// alignment:Alignment.centerLeft,
// padding: EdgeInsets.symmetric(
// horizontal: 3.w,
// vertical: 1.h),
// child: (messagemodel
//     ?.data?[
// index]
//     .messageType ==
// "image")
// ? GestureDetector(
// onTap:
// () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) =>
// openimage(imageid: messagemodel?.data?[index].message ?? "")));
// },
// child:
// Image
//     .network(
// messagemodel?.data?[index].message ??
// "",height:25.h,width:40.h,
// fit: BoxFit
//     .cover,
// ),
// )
//     : (messagemodel
//     ?.data?[
// index]
//     .messageType ==
// "video")
// ? GestureDetector(
// onTap:
// () {
// Navigator.of(context).push(MaterialPageRoute(builder: (context) => Player(videoid: messagemodel?.data?[index].message ?? "")));
// },
// child: addVideo(videoid: messagemodel?.data?[index].message ?? ""),
// )
//     : (messagemodel?.data?[index].messageType ==
// "files")
// ? GestureDetector(
// onTap: () async {
// final String? url = (messagemodel?.data?[index].message);
// String fileExtension = path.extension(url!);
// print(fileExtension.toString());
// if (fileExtension == ".txt") {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => webview(
// data: messagemodel?.data?[index].message,
// )));
// } else {
// var response = await http.get(Uri.parse((messagemodel?.data?[index].message).toString()));
//
// String fileName = url.toString().split('/').last;
// Directory? storageDirectory = Platform.isAndroid ? await getExternalStorageDirectory() : await getDownloadsDirectory();
// String directoryPath = storageDirectory!.path;
// File file = File('$directoryPath/$fileName');
// // Directory directory = await getApplicationDocumentsDirectory();
// await file.writeAsBytes(response.bodyBytes);
// String filePath = '${storageDirectory.path}/$fileName';
// print(filePath.toString());
// try {
// print("object");
// final result = await OpenFile.open(filePath);
// } catch (e) {
// print(e.toString());
// }
// }
// },
// child: Text(messagemodel?.data?[index].message ?? "", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 12.sp)),
// )
//     : (messagemodel?.data?[index].messageType == "location")
// ? GestureDetector(
// onTap: () async {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => webview2(
// data: messagemodel?.data?[index].message,
// )));
// print(messagemodel?.data?[index].message);
// },
// child: Row(
// children: [
// Icon(
// Icons.location_on,
// color: Colors.white,
// ),
// Text("Tap here", textAlign: TextAlign.right, style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 12.sp)),
// ],
// ),
// )
//     : Text(messagemodel?.data?[index].message ?? "", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 12.sp)),
// ),
//
// Container(
// padding: EdgeInsets.symmetric(
// horizontal: 3.w,
// vertical: 1.h),
// child: Text(
// outputDate,
// style: TextStyle(
// color: Colors
//     .grey.shade100,
// fontFamily:
// "Poppins",
// fontSize:
// 10.sp,
// fontWeight:
// FontWeight
//     .normal,
// fontStyle:
// FontStyle
//     .normal),
// ),
// ),
// // SizedBox(
// //   width: 1.w,
// // ),
// // Image.asset("assets/profile.png",height: 5.w,width: 5.w,fit: BoxFit.cover,),
// ],
// ),
// ),
// )
//     : Padding(
// padding:
// EdgeInsets.only(
// left: 3.w,
// top: 1.h,
// right: 35.w),
// child: Container(
//
// width:60.w,
// margin: EdgeInsets.only(
// left: 2.w,
// top: 2.h,
// right: 2.w),
// decoration: BoxDecoration(
// color:Color(0xffb909395),
// borderRadius: BorderRadius.circular(5.0)
// ),
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment
//     .end,
// children: [
// Container(
// alignment: Alignment
//     .centerLeft,
// padding: EdgeInsets.symmetric(
// horizontal: 3.w,
// vertical: 1.h),
// child: (messagemodel
//     ?.data?[
// index]
//     .messageType ==
// "image")
// ? GestureDetector(
// onTap:
// () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) =>
// openimage(imageid: messagemodel?.data?[index].message ?? "")));
// },
// child:
// Image
//     .network(
// messagemodel?.data?[index].message ??
// "",height:25.h,width:40.h,
// fit: BoxFit
//     .cover,
// ),
// )
//     : (messagemodel
//     ?.data?[
// index]
//     .messageType ==
// "video")
// ? GestureDetector(
// onTap:
// () {
// Navigator.of(context).push(MaterialPageRoute(builder: (context) => Player(videoid: messagemodel?.data?[index].message ?? "")));
// },
// child: addVideo(videoid: messagemodel?.data?[index].message ?? ""),
// )
//     : (messagemodel?.data?[index].messageType ==
// "files")
// ? GestureDetector(
// onTap: () async {
// final String? url = (messagemodel?.data?[index].message);
// String fileExtension = path.extension(url!);
//
// if (fileExtension == ".txt") {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => webview(
// data: messagemodel?.data?[index].message,
// )));
// } else {
// var response = await http.get(Uri.parse((messagemodel?.data?[index].message).toString()));
// String fileName = url.toString().split('/').last;
// Directory? storageDirectory = Platform.isAndroid ? await getExternalStorageDirectory() : await getDownloadsDirectory();
// String directoryPath = storageDirectory!.path;
// File file = File('$directoryPath/$fileName');
// // Directory directory = await getApplicationDocumentsDirectory();
// await file.writeAsBytes(response.bodyBytes);
// String filePath = '${storageDirectory.path}/$fileName';
//
// try {
// final result = await OpenFile.open(filePath);
// } catch (e) {
// print(e.toString());
// }
// }
// },
// child: Text(messagemodel?.data?[index].message ?? "", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 12.sp)),
// )