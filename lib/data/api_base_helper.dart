import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:staycation/data/app_exceptions.dart';
import 'dart:async';

import 'package:staycation/globals/config.dart';

class ApiBaseHelper {
  final String _baseUrl =
      "https://staycation-rand.herokuapp.com/api/v1/member/";

  Future<dynamic> get(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    print('Api Post, url $url');
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(Uri.parse(_baseUrl + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(_baseUrl + url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api delete.');
    return apiResponse;
  }

  Future<Map<String, dynamic>> postMultipart(
      String url, Map<String, String> data, File file, String field) async {
    Uri uri = Uri.parse("$baseUrl$url");
    print(uri);

    http.StreamedResponse response;

    try {
      http.MultipartRequest request = http.MultipartRequest('POST', uri);
      request.fields.addAll(data);

      http.MultipartFile vFile1 = http.MultipartFile.fromBytes(
          field, file.readAsBytesSync(),
          filename: basename(file.path),
          contentType: MediaType('application', extension(file.path)));
      request.files.add(vFile1);

      response = await request.send();
      final responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {"result": true};
      } else {
        return {
          "result": false,
          "data": "code ${response.statusCode}",
          "body": "$responseBody"
        };
      }
    } on SocketException {
      return {"result": false, "data": "Cannot Reach Server"};
    } on FormatException catch (e) {
      return {"result": false, "data": "Format error ${e.message}"};
    }
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = jsonDecode(response.body);
      print(responseJson);
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
