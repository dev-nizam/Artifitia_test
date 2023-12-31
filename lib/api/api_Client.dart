import 'dart:convert';
import 'dart:developer';

import 'package:artifitia_test/api/api_exception.dart';
import 'package:http/http.dart';



class ApiClient {
  static final String basePath =
      "http://api.weatherapi.com/v1/current.json?key=a372d3b686be43d48d552834232106&q=";
  // String apiKey = "a372d3b686be43d48d552834232106";

  Future<Response> invokeApi(String path, String method, Object? body) async {
    Map<String, String> headerparams = {
      'X-RapidAPI-Key': '11e4b161bfmsh1b58c2cd21f6829p10ba09jsn5ae9055a4b23',
      'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
    };
    Response response;

    String url = basePath + path+"&aqi=no";
    print(url);

    final nullableHeaderParams = (headerparams.isEmpty) ? null : headerparams;

    switch (method) {
      case "POST":
        response = await post(Uri.parse(url),
            headers: {
              "content-Type": "application/json",
            },
            body: body);
        break;
      case "PUT":
        response = await put(Uri.parse(url),
            headers: {
              'content-Type': 'application/json',
            },
            body: body);
        break;
      case "DELETE":
        response = await delete(Uri.parse(url), headers: nullableHeaderParams);
        break;
      case "POST_":
        response = await post(
          Uri.parse(url),
          headers: {},
          body: body,
        );
        break;
      case "GET_":
        response = await post(
          Uri.parse(url),
          headers: headerparams,
          body: body,
        );
        break;
      default:
        response = await get(Uri.parse(url), headers: headerparams);
    }
    print('status of $path =>' + (response.statusCode).toString());
    print(response.body);
    if (response.statusCode >= 400) {
      log(path +
          ' : ' +
          response.statusCode.toString() +
          ' : ' +
          response.body);

      throw ApiException(
          message: _decodeBodyBytes(response), statusCode: response.statusCode);
    }
    return response;
  }

  String _decodeBodyBytes(Response response) {
    var contentType = response.headers["content-type"];
    if (contentType != null && contentType.contains("application/json")) {
      return jsonDecode(response.body)['message'];
    } else {
      return response.body;
    }
  }
}