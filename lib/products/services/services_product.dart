import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:rest_api_project/products/model/model_post.dart';

import 'package:rest_api_project/products/utilities/rest_api_utils.dart';

class ServiceProduct {
  static var client = http.Client();

  static var duration = Duration(seconds: 10);

  static Future<List<Welcome>> LoadProducts() async {
    List<Welcome> list = [];

    try {
      Map<String, String> header = {};
      Map<String, String> body = {};

      http.Response response = await client
          .get(Uri.parse(RestApiUtilities.product_Url))
          .timeout(duration);

      RestApiUtilities.GetPrintHeaderBodyUrlResponse(
          RestApiUtilities.product_Url, header, body, response);

      if (response.statusCode == 200) {
        list = welcomeFromJson(response.body);
        return list;
      } else {
        print(RestApiUtilities.GetResponseError(response.statusCode));
        return list;
      }
    } on TimeoutException {
      print(RestApiUtilities.GetResponseError(420));
      return list;
    } on SocketException {
      print(RestApiUtilities.GetResponseError(430));
      return list;
    } catch (e) {
      print("Error: ${e.toString()}");
      return list;
    }
  }
}
