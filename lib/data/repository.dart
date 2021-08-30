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
}
