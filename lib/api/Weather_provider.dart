import 'package:artifitia_test/Model/Weathermodel.dart';
import 'package:artifitia_test/api/weatherapi.dart';
import 'package:flutter/material.dart';


class WeatherProvider with ChangeNotifier{
  late Weathermodel weathermodel;
  WeatherApi weatherApi = WeatherApi();

  bool loading =false;

  getWeatherApiData(context, String place) async{
    loading = true;
    weathermodel = await weatherApi.getWeather(place: place);
    loading = false;
    notifyListeners();
  }
}