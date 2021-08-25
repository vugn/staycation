import 'dart:convert';

import 'package:staycation/data/api_base_helper.dart';
import 'package:staycation/models/detail_page.dart';
import 'package:staycation/models/landing_page.dart';

class Repository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<HomeApi> fetchLandingPage() async {
    final response = await _helper.get("landing-page");
    return HomeApi.fromJson(response);
  }

  Future<DetailApi> fetchdetailPage(id) async {
    final response = await _helper.get("detail-page/$id");
    return DetailApi.fromJson(response);
  }

  Future<DetailApi> fetchCheckout(dynamic body) async {
    final response = await _helper.post("checkout", {
      "image": body != null
          ? 'data:image/png;base64,' + base64Encode(body.readAsBytesSync())
          : '',
      "idItem": body.id,
      "duration": body.duration,
      "bookingStartDate": body.startDate,
      "bookingEndDate": body.endDate,
      "firstName": body.firstName,
      "lastName": body.lastName,
      "email": body.email,
      "phoneNumber": body.phoneNumber,
      "accountHolder": body.accountHolder,
      "bankFrom": body.bankFrom,
    });
    return DetailApi.fromJson(response);
  }
}
