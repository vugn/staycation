import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:staycation/models/detail_page.dart';
import 'package:staycation/models/landing_page.dart';
import 'package:staycation/data/repository.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class HomeApiBloc extends Bloc<BlocEvent, ApiState> {
  final Repository _apiRepository = Repository();

  HomeApiBloc() : super(ApiInitial());

  @override
  Stream<ApiState> mapEventToState(
    BlocEvent event,
  ) async* {
    if (event is GetApiList) {
      try {
        yield ApiLoading();
        final homeData = await _apiRepository.fetchLandingPage();
        yield HomeApiLoaded(homeData);
      } catch (e) {
        yield ApiError(e.toString());
      }
    }
  }
}

class DetailApiBloc extends Bloc<BlocEvent, ApiState> {
  final Repository _apiRepository = Repository();

  DetailApiBloc() : super(ApiInitial());

  @override
  Stream<ApiState> mapEventToState(
    BlocEvent event,
  ) async* {
    if (event is GetDetailApiList) {
      try {
        yield ApiLoading();
        final DetailApi detail = await _apiRepository.fetchdetailPage(event.id);
        yield DetailApiLoaded(detail);
      } catch (e) {
        yield ApiError(e.toString());
      }
    }
  }
}
