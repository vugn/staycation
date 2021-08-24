part of 'bloc.dart';

abstract class ApiState extends Equatable {
  const ApiState();
}

class ApiInitial extends ApiState {
  const ApiInitial();
  @override
  List<Object> get props => [];
}

class ApiLoading extends ApiState {
  const ApiLoading();
  @override
  List<Object> get props => [];
}

class HomeApiLoaded extends ApiState {
  final HomeApi homeApi;
  const HomeApiLoaded(this.homeApi);
  @override
  List<Object> get props => [homeApi];
}

class DetailApiLoaded extends ApiState {
  final DetailApi detailApi;
  const DetailApiLoaded(this.detailApi);
  @override
  List<Object> get props => [detailApi];
}

class ApiError extends ApiState {
  final String message;
  const ApiError(this.message);
  @override
  List<Object> get props => [message];
}
