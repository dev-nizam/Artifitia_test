import 'dart:convert';

import 'package:artifitia_test/Model/Weathermodel.dart';
import 'package:artifitia_test/api/api_Client.dart';

import 'package:http/http.dart';

class WeatherApi {
  ApiClient apiClient = ApiClient();

  Future<Weathermodel> getWeather({required String place}) async {
    Response response = await apiClient.invokeApi(place, 'GET', null);
    return Weathermodel.fromJson(jsonDecode(response.body));
  }
}