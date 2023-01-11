import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
///get
class Api {
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'authorization': 'Bearer $token'});
    }
    // print('url=$url token=$token header=$headers');
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      //print('${jsonDecode(response.body)}');
      return jsonDecode(response.body);
    } else {
      throw Exception('problem with status code ${response.statusCode}');
    }
  }
}