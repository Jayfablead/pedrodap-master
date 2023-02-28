import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pedrodap/Widget/const.dart';
import 'package:pedrodap/Widget/response.dart';

class authprovider with ChangeNotifier{
  Map<String, String> headers = {
    'Authorization': 'hXuRUGsEGuhGf6KG',
  };
  Future<http.Response> signupapi(Map<String,String>bodyData) async {
    const url = '$baseUrl/?action=signup_app';
    var responseJson;
    final response = await http.post(Uri.parse(url), body:bodyData , headers:headers )
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
  Future<http.Response> loginapi(Map<String,String>bodyData) async {
    const url = '$baseUrl/?action=login_app';
    var responseJson;
    final response = await http.post(Uri.parse(url), body:bodyData , headers:headers )
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
}