import 'dart:async';

import 'package:staycation/data/api_response.dart';
import 'package:staycation/data/landing_page_repository.dart';

import 'package:staycation/models/landing_page.dart';

class HomeApiBloc {
  late LandingPageRepository _landingPageRepository;

  // ignore: close_sinks
  var _homeApiController = StreamController<ApiResponse<HomeApi>>();

  StreamSink<ApiResponse<HomeApi>> get ladingPageSink =>
      _homeApiController.sink;

  Stream<ApiResponse<HomeApi>> get landingPageStream =>
      _homeApiController.stream;

  HomeApiBloc() {
    _homeApiController = StreamController<ApiResponse<HomeApi>>();
    _landingPageRepository = LandingPageRepository();
    fetchLandingPage();
  }

  fetchLandingPage() async {
    ladingPageSink.add(ApiResponse.loading('Fetching API'));
    try {
      HomeApi data = await _landingPageRepository.fetchLandingPage();
      ladingPageSink.add(ApiResponse.completed(data));
    } catch (e) {
      ladingPageSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _homeApiController.close();
  }
}
