part of 'bloc.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();
}

class GetApiList extends BlocEvent {
  @override
  List<Object> get props => [];
}

class GetDetailApiList extends BlocEvent {
  final String id;
  GetDetailApiList({required this.id});
  @override
  List<Object> get props => [id];
}
