import 'package:http/http.dart' as http;
import 'package:staycation/models/landing_page.dart';
import 'dart:convert';
import 'dart:async';

class LandingPage {
  static Future<HomeApi> fetchHomeApi() async {
    final response = await http.get(Uri.parse(
        'https://staycation-rand.herokuapp.com/api/v1/member/landing-page'));

    if (response.statusCode == 200) {
      return HomeApi.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
