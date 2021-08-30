part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  const SearchInitial();
  @override
  List<Object> get props => [];
}

class TextState extends SearchState {
  final String text;
  const TextState(this.text);
  @override
  List<Object> get props => [text];
}
