import 'package:staycation/data/api_base_helper.dart';
import 'package:staycation/models/landing_page.dart';

class LandingPageRepository {
  ApiBaseHelper _helper = ApiBaseHelper();

  Future<HomeApi> fetchLandingPage() async {
    final response = await _helper.get("landing-page");
    return HomeApi.fromJson(response);
  }
}
