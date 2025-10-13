// // ignore_for_file: depend_on_referenced_packages
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:date_your_love/helper/app_exception.dart';
// import 'package:date_your_love/helper/network/base_api_services.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
//
// class NetworkApiServices extends BaseApiServices {
//   @override
//   Future getGetApiResponse(String url) async {
//     dynamic responseJson;
//     try {
//       final response = await http
//           .get(Uri.parse(url))
//           .timeout(const Duration(seconds: 10));
//       if (kDebugMode) {
//         print('Api Url : $url');
//       }
//       responseJson = returnRequest(response);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     }
//     return responseJson;
//   }
//
//   @override
//   Future getPostApiResponse(String url, dynamic data) async {
//     dynamic responseJson;
//     try {
//       final response = await http
//           .post(Uri.parse(url),
//               headers: {
//                 'Content-Type': 'application/json; charset=UTF-8',
//               },
//               body: jsonEncode(data))
//           .timeout(const Duration(seconds: 10));
//       if (kDebugMode) {
//         print('Api Url : $url');
//       }
//       responseJson = returnRequest(response);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     }
//     return responseJson;
//   }
//
//   dynamic returnRequest(response) {
//     switch (response.statusCode) {
//       case 200:
//         dynamic responseJson = jsonDecode(response.body);
//         if (kDebugMode) {
//           print('response 200: $responseJson');
//         }
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       case 404:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//       default:
//         throw FetchDataException(
//             'Error accrued while communicating with server with status code${response.statusCode}');
//     }
//   }
// }
// lib/services/network_api_services.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


import '../app_exception.dart';
import 'base_api_services.dart'; // 👈 import navigatorKey from main

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url, {BuildContext? context}) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
        const Duration(seconds: 10),
      );

      if (kDebugMode) {
        print('Api Url : $url');
      }

      responseJson = returnRequest(response, context: context);
    } on SocketException {
      Fluttertoast.showToast(
        msg: "No Internet Connection",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data, {BuildContext? context}) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      )
          .timeout(const Duration(seconds: 10));

      if (kDebugMode) {
        print('Api Url : $url');
      }

      responseJson = returnRequest(response, context: context);
    } on SocketException {
      Fluttertoast.showToast(
        msg: "No Internet Connection",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnRequest(http.Response response, {BuildContext? context}) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        if (kDebugMode) {
          print('response 200: $responseJson');
        }
        return responseJson;

      case 503:
        print("❗️503 Error. Trying to show popup...");
        // DialogUtil.showErrorDialog(context, "Server is busy. Try again later.");
        throw FetchDataException('Server Busy - 503');

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnauthorisedException(response.body.toString());

      case 500:
      default:
        throw FetchDataException(
          'Error occurred while communicating with server. Status code: ${response.statusCode}',
        );
    }
  }
}

// class DialogUtil {
//   static void showErrorDialog(BuildContext? context, String message) {
//     // final ctx = context ?? navigatorKey.currentContext;
//
//     if (ctx != null) {
//       Future.delayed(Duration.zero, () {
//         showDialog(
//           context: ctx,
//           builder: (ctx2) => AlertDialog(
//             title: const Text("Error"),
//             content: Text(message),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.of(ctx2).pop(),
//                 child: const Text("OK"),
//               ),
//             ],
//           ),
//         );
//       });
//     } else {
//       print("❌ Both passed and global context are null. Can't show dialog.");
//     }
//   }
// }
