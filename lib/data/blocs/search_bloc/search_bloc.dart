import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());

  @override
  void onTransition(Transition<SearchEvent, SearchState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is TextChanged) {
      yield TextState(event.text);
    }
  }
}
