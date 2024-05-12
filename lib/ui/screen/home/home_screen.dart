import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'home_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
            child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Align(
                        alignment: const AlignmentDirectional(4, -0.2),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff6832d7)),
                        )),
                    Align(
                        alignment: const AlignmentDirectional(-4, -0.2),
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff6832d7)),
                        )),
                    Align(
                        alignment: const AlignmentDirectional(-1, -1.3),
                        child: Container(
                          width: 600,
                          height: 300,
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Color(0xffffc84f)),
                        )),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                      child: Container(
                        decoration:
                        const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    BlocBuilder<HomeBloc,HomeBlocState>(
                      builder: (context, state) {
                        if (state is HomeBlocSuccess){
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    '📍 ${state.weather.areaName}, ${state.weather.country}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Good Morning',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Center(
                                  child: _getWeatherIcon(
                                      state.weather.weatherConditionCode!),
                                ),
                                 Center(
                                  child: Text('${state.weather.temperature!.celsius!.floor()}°C',
                                      style: const TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      )),
                                ),
                                Center(
                                  child: Text(state.weather.weatherDescription!.toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      )),
                                ),
                                const SizedBox(height: 4),
                                 Center(
                                  child: Text(
                                    DateFormat('EEEE d - hh:mm a').format(state.weather.date!),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white,
                                      )),
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  _WeatherItem(
                                      title: 'Sunrise',
                                      value: DateFormat('hh:m a')
                                          .format(state.weather.sunrise!),
                                      assetsIcon: 'assets/11.png'),
                                  _WeatherItem(
                                      title: 'Sunset',
                                      value: DateFormat('hh:m a')
                                          .format(state.weather.sunset!),
                                      assetsIcon: 'assets/12.png'),
                                ],
                              ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Divider(color: Colors.grey,thickness: 0.5),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _WeatherItem(
                                       title:      'Temp Max',
                                       value:      '${state.weather.tempMax!.celsius!.floor()}°C',
                                       assetsIcon: 'assets/13.png'),
                                    _WeatherItem(
                                       title:      'Temp Min',
                                       value:      '${state.weather.tempMin!.celsius!.floor()}°C',
                                       assetsIcon: 'assets/14.png'),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }else{
                          return const Center(child: CircularProgressIndicator());
                        }
                      }
                    )
                  ],
                ))));
  }

  Widget _weatherItem(String title, String value, String assetsIcon) {
    return Row(
      children: [
        Image.asset(
          assetsIcon,
          width: 50,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300)),
            Text(value,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
          ],
        )
      ],
    );
  }

  Widget _getWeatherIcon(int icon) {
    if(icon >= 200 && icon < 300){
      return Image.asset(
        'assets/1.png',

      );
    }else if(icon >= 300 && icon < 400){
      return Image.asset(
        'assets/2.png',

      );
    }else if(icon >= 500 && icon < 600){
      return Image.asset(
        'assets/3.png',

      );
    }else if(icon >= 600 && icon < 700){
      return Image.asset(
        'assets/4.png',

      );
    }else if(icon >= 700 && icon < 800){
      return Image.asset(
        'assets/5.png',

      );
    }else if(icon == 800){
      return Image.asset(
        'assets/6.png',

      );
    }else if(icon > 800 && icon <= 804){
      return Image.asset(
        'assets/7.png',

      );
    }else{
      return Image.asset(
        'assets/7.png',

      );
    }
  }
}

class _WeatherItem extends StatelessWidget {
  const _WeatherItem(
      {super.key,
      required this.title,
      required this.value,
      required this.assetsIcon});

  final String title;
  final String value;
  final String assetsIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Image.asset(
            assetsIcon,
            width: 50,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w300)),
            Text(value,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
          ],
        )
      ],
    );
  }
}