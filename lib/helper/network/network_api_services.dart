import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../app_exception.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10));
      if (kDebugMode) {
        print('Api Url : $url');
      }
      responseJson = returnRequest(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(data))
          .timeout(const Duration(seconds: 10));
      if (kDebugMode) {
        print('Api Url : $url');
      }
      responseJson = returnRequest(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // dynamic returnRequest(response) {
  //   switch (response.statusCode) {
  //     case 200:
  //       dynamic responseJson = jsonDecode(response.body);
  //       if (kDebugMode) {
  //         print('response 200: $responseJson');
  //       }
  //       return responseJson;
  //     case 400:
  //       throw BadRequestException(response.body.toString());
  //     case 404:
  //       throw UnauthorisedException(response.body.toString());
  //     case 500:
  //     default:
  //       throw FetchDataException(
  //           'Error accrued while communicating with server with status code${response.statusCode}');
  //   }
  // }
  dynamic returnRequest(http.Response response) {
    if (kDebugMode) {
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
    }

    switch (response.statusCode) {
    // 1xx Informational
      case 100: // Continue
        return 'Continue';
      case 101: // Switching Protocols
        return 'Switching Protocols';
      case 102: // Processing
        return 'Processing';

    // 2xx Success
      case 200: // OK
      case 201: // Created
      case 202: // Accepted
      case 203: // Non-Authoritative Information
      case 204: // No Content
        return response.statusCode == 204 ? null : jsonDecode(response.body);
      case 205: // Reset Content
        return 'Reset Content';
      case 206: // Partial Content
        return jsonDecode(response.body);
      case 207: // Multi-Status
      case 208: // Already Reported
      case 226: // IM Used
        return jsonDecode(response.body);

    // 3xx Redirection
      case 300: // Multiple Choices
      case 301: // Moved Permanently
      case 302: // Found
      case 303: // See Other
      case 304: // Not Modified
      case 305: // Use Proxy
      case 307: // Temporary Redirect
      case 308: // Permanent Redirect
        throw FetchDataException(
            'Redirected to another URL: ${response.headers['location'] ?? 'Unknown'}');

    // 4xx Client Errors
      case 400: // Bad Request
        throw BadRequestException('Bad Request: ${response.body}');
      case 401: // Unauthorized
        throw UnauthorisedException('Unauthorized: ${response.body}');
      case 402: // Payment Required
        throw FetchDataException('Payment Required: ${response.body}');
      case 403: // Forbidden
        throw UnauthorisedException('Forbidden: ${response.body}');
      case 404: // Not Found
        throw UnauthorisedException('Not Found: ${response.body}');
      case 405: // Method Not Allowed
        throw FetchDataException('Method Not Allowed: ${response.body}');
      case 406: // Not Acceptable
        throw FetchDataException('Not Acceptable: ${response.body}');
      case 407: // Proxy Authentication Required
        throw FetchDataException('Proxy Authentication Required: ${response.body}');
      case 408: // Request Timeout
        throw FetchDataException('Request Timeout: ${response.body}');
      case 409: // Conflict
        throw FetchDataException('Conflict: ${response.body}');
      case 410: // Gone
        throw FetchDataException('Gone: ${response.body}');
      case 411: // Length Required
        throw FetchDataException('Length Required: ${response.body}');
      case 412: // Precondition Failed
        throw FetchDataException('Precondition Failed: ${response.body}');
      case 413: // Payload Too Large
        throw FetchDataException('Payload Too Large: ${response.body}');
      case 414: // URI Too Long
        throw FetchDataException('URI Too Long: ${response.body}');
      case 415: // Unsupported Media Type
        throw FetchDataException('Unsupported Media Type: ${response.body}');
      case 416: // Range Not Satisfiable
        throw FetchDataException('Range Not Satisfiable: ${response.body}');
      case 417: // Expectation Failed
        throw FetchDataException('Expectation Failed: ${response.body}');
      case 418: // I'm a teapot 😄
        throw FetchDataException('I\'m a teapot: ${response.body}');
      case 421: // Misdirected Request
        throw FetchDataException('Misdirected Request: ${response.body}');
      case 422: // Unprocessable Entity
        throw BadRequestException('Validation Error: ${response.body}');
      case 425: // Too Early
        throw FetchDataException('Too Early: ${response.body}');
      case 426: // Upgrade Required
        throw FetchDataException('Upgrade Required: ${response.body}');
      case 428: // Precondition Required
        throw FetchDataException('Precondition Required: ${response.body}');
      case 429: // Too Many Requests
        throw FetchDataException('Too Many Requests: ${response.body}');
      case 431: // Request Header Fields Too Large
        throw FetchDataException('Request Header Fields Too Large: ${response.body}');
      case 451: // Unavailable For Legal Reasons
        throw FetchDataException('Unavailable For Legal Reasons: ${response.body}');

    // 5xx Server Errors
      case 500: // Internal Server Error
        throw FetchDataException('Internal Server Error: ${response.body}');
      case 501: // Not Implemented
        throw FetchDataException('Not Implemented: ${response.body}');
      case 502: // Bad Gateway
        throw FetchDataException('Bad Gateway: ${response.body}');
      case 503: // Service Unavailable
        throw FetchDataException('Service Unavailable: ${response.body}');
      case 504: // Gateway Timeout
        throw FetchDataException('Gateway Timeout: ${response.body}');
      case 505: // HTTP Version Not Supported
        throw FetchDataException('HTTP Version Not Supported: ${response.body}');
      case 506: // Variant Also Negotiates
        throw FetchDataException('Variant Also Negotiates: ${response.body}');
      case 507: // Insufficient Storage
        throw FetchDataException('Insufficient Storage: ${response.body}');
      case 508: // Loop Detected
        throw FetchDataException('Loop Detected: ${response.body}');
      case 510: // Not Extended
        throw FetchDataException('Not Extended: ${response.body}');
      case 511: // Network Authentication Required
        throw FetchDataException('Network Authentication Required: ${response.body}');

    // Default for any other codes
      default:
        throw FetchDataException(
            'Unexpected Error: ${response.statusCode} - ${response.body}');
    }
  }

}


