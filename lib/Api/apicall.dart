import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/response model.dart';

class ApiProvider {
  ApiProvider();

  static Future<ResponseModel> getAllData(int pages,String newsName) async {
    String url =
        "https://api.newscatcherapi.com/v2/search?q=$newsName&countries=IN&page_size=10&page=$pages";

    final response = await http.get(Uri.parse(url),
        headers: {"x-api-key": "8s41tO1IjzGkrMh0TFfa1agZ_-m0T6D4EUj8jDPTF-Y"});
    var resData = jsonDecode(response.body);
    log(resData.toString());

    // ResponseModel responseData ;
    // for (var i = 0; i < resData.length; i++) {
    ResponseModel data = ResponseModel.fromJson(resData);
    //    responseData.add(data);

    log(data.toString());
    // }
    return data;
  }
}
