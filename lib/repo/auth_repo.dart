
import 'package:flutter/foundation.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';
import '../res/api_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

// Login Api
  Future<dynamic> loginApi(dynamic data) async {
    try {
      print(data);
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.login, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during loginApi: $e');
      }
      rethrow;
    }

  }
  Future<dynamic> verifyOtpApi(dynamic phone,dynamic otp ) async {
    print("fcgdsghhsfjbskeflnl$phone");
    try {
      dynamic response =
      await _apiServices.getGetApiResponse('${ApiUrl.verifyOtp}$phone&otp=$otp');
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during verifyOtpApi: $e');
      }
      rethrow;
    }
  }
  Future<dynamic> sendOtpApi(dynamic mobile,) async {
    print("gfhjfkhljkgjkld $mobile");
    try {
      dynamic response =
      await _apiServices.getGetApiResponse('${ApiUrl.sendOtp}$mobile');
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during sendOtpApi: $e');
      }
      rethrow;
    }
  }
//
//
//
// Register Api
  Future<dynamic> registerApi(dynamic data) async {
    print("pagal $data");
    try {
      print(data);
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.register, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during registerApi: $e');
      }
      rethrow;
    }
  }
  // Future<dynamic> verifyOtpApi(dynamic phone,dynamic otp ) async {
  //   try {
  //     dynamic response =
  //     await _apiServices.getGetApiResponse('${ApiUrl.verifyOtp}$phone&otp=$otp');
  //     return response;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error occurred during verifyOtpApi: $e');
  //     }
  //     rethrow;
  //   }
  // }
  // Future<dynamic> sendOtpApi(dynamic mobile,) async {
  //   try {
  //     dynamic response =
  //     await _apiServices.getGetApiResponse('${ApiUrl.sendOtp}$mobile');
  //     return response;
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error occurred during sendOtpApi: $e');
  //     }
  //     rethrow;
  //   }
  // }

//   Future<dynamic> requestOtpApi(dynamic data) async {
//     try {
//       print(data);
//       dynamic response =
//       await _apiServices.getPostApiResponse(ApiUrl.requestOtp, data);
//       return response;
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error occurred during requestApiApi: $e');
//       }
//       rethrow;
//     }
//   }
//
//   Future<dynamic> verifyAppApi(dynamic data ) async {
//     try {
//       dynamic response =
//       await _apiServices.getPostApiResponse(ApiUrl.verifyApp, data);
//       return response;
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error occurred during verifyAppApi: $e');
//       }
//       rethrow;
//     }
//   }
//
//   Future<dynamic> registerApi(dynamic data) async {
//     try {
//       print(data);
//       dynamic response =
//       await _apiServices.getPostApiResponse(ApiUrl.register, data);
//       return response;
//     } catch (e) {
//       if (kDebugMode) {
//         print('Error occurred during registerApi: $e');
//       }
//       rethrow;
//     }
//   }

}