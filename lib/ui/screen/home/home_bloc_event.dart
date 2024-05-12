part of 'home_bloc_bloc.dart';

sealed class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();

  @override
  List<Object> get props => [];
}

final class FetchWeather extends HomeBlocEvent {
  final Position position;

  const FetchWeather(this.position);

  @override
  List<Object> get props => [position];
}