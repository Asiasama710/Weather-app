import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../../../data/constant.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(HomeBlocLoading());
      try {
        WeatherFactory weatherFactory = WeatherFactory(API_KEY,language: Language.ENGLISH);
        Weather weather = await weatherFactory.currentWeatherByLocation(event.position.latitude, event.position.longitude) ;
        print("weather is :$weather");

        emit(HomeBlocSuccess(weather));

      } catch (e) {
        emit(HomeBlocFailure(e.toString()));
      }
    },
    );
  }
}
