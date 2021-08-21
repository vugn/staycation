import 'dart:async';

import 'package:staycation/data/api_response.dart';
import 'package:staycation/data/repository.dart';
import 'package:staycation/models/detail_page.dart';

import 'package:staycation/models/landing_page.dart';

class HomeApiBloc {
  late Repository _repository;

  var _homeApiController = StreamController<ApiResponse<HomeApi>>();

  StreamSink<ApiResponse<HomeApi>> get ladingPageSink =>
      _homeApiController.sink;

  Stream<ApiResponse<HomeApi>> get landingPageStream =>
      _homeApiController.stream;

  HomeApiBloc() {
    _homeApiController = StreamController<ApiResponse<HomeApi>>();
    _repository = Repository();
    fetchLandingPage();
  }

  fetchLandingPage() async {
    ladingPageSink.add(ApiResponse.loading('Fetching API'));
    try {
      HomeApi data = await _repository.fetchLandingPage();
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

class DetailApiBloc {
  late Repository _repository;

  var _detailApiController = StreamController<ApiResponse<DetailApi>>();

  StreamSink<ApiResponse<DetailApi>> get detailPageSink =>
      _detailApiController.sink;

  Stream<ApiResponse<DetailApi>> get detailPageStream =>
      _detailApiController.stream;

  DetailApiBloc(id) {
    _detailApiController = StreamController<ApiResponse<DetailApi>>();
    _repository = Repository();
    fetchDetailPage(id);
  }

  fetchDetailPage(id) async {
    detailPageSink.add(ApiResponse.loading('Fetching API'));
    try {
      DetailApi data = await _repository.fetchdetailPage(id);
      detailPageSink.add(ApiResponse.completed(data));
    } catch (e) {
      detailPageSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _detailApiController.close();
  }
}
