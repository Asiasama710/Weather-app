part of 'home_bloc_bloc.dart';

sealed class HomeBlocState extends Equatable {
  const HomeBlocState();
  
  @override
  List<Object> get props => [];
}

final class HomeBlocInitial extends HomeBlocState {}
final class HomeBlocLoading extends HomeBlocState {}

final class HomeBlocSuccess extends HomeBlocState {
  final Weather weather;

  const HomeBlocSuccess(this.weather);

  @override
  List<Object> get props => [weather];
}

final class HomeBlocFailure extends HomeBlocState {
  final String message;

  const HomeBlocFailure(this.message);

  @override
  List<Object> get props => [message];
}
