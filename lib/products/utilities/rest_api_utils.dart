import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rest_api_project/products/utilities/app_assets.dart';

class RestApiUtilities {
  //static String product_Url = "https://fakestoreapi.com/products"; //production
  static String url = "https:///fakestoreapi.com"; //Dev
  static final String product_Url = "${url}/products";
  static final error_404 = "Resource not found";
  static final error_401 = "Un Authorize Error";
  static final error_Unknown = "Un Authorize Error";
  static final error_Timout = "Timeout Error";
  static final error_Internet_issue = "You are not connected to the Internet";

  static String GetResponseError(int status) {
    switch (status) {
      case 404:
        return error_404;
      case 401:
        return error_401;
      case 420:
        return error_Timout;
      case 430:
        return error_Internet_issue;
      default:
        return error_Unknown;
    }
  }

  static void GetPrintHeaderBodyUrlResponse(url, header, body, response) {
    print("GetResponse: url : $url");
    print("GetResponse: header : $header");
    print("GetResponse: body : $body");
    print("GetResponse: response: ${response.statusCode} , ${response.body}");
  }

  static Widget ShowLoadingView(BuildContext context) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Lottie.asset(AppAsset.loadingView,
                  height: 50, width: 50, fit: BoxFit.fitHeight),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Loading Data',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  } //loading view icon

  static ShowLoadingViewDiaglogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: ShowLoadingView(context),
            ));
  }

  static ShowMessageView(
    BuildContext context,
    String path,
    String title,
  ) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Lottie.asset(path,
                  height: 30, width: 30, fit: BoxFit.fitHeight),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$title',
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
