import 'package:dio/dio.dart';
import 'package:yara/locator.dart';

import '../constants/api_routes.dart';
import '../constants/data_state.dart';
import '../models/user_model.dart';

Future<void> main() async {
  Response r = await ApiManager().verifyAndLogin('+989382849191', '833343');
  logger.i(r.data);
}

class ApiManager {
  final Dio _dio = Dio();
  final ApiRoutes _apiRoutes = ApiRoutes();

  ApiManager();

  Future<dynamic> sendSmsVerificationCode(String phoneNumber) async {
    try {
      var response = await _dio.post(
        _apiRoutes.sendOTPCode(),
        data: {'phone': phoneNumber},
      );
      logger.e(response.data);
      if (response.statusCode == 200) {
        return const DataSuccess(null);
      } else {
        return DataFailed('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<dynamic> verifyAndLogin(String phone, String otp) async {
    logger.i('hey');
    try {
      var response = await _dio.post(
        _apiRoutes.loginUser(),
        data: {
          'phone': phone,
          'otp': otp,
        },
      );
      logger.i(response.data);
      if (response.statusCode == 200) {
        return DataSuccess(UserModel.fromJson(response.data));
      } else {
        return DataFailed('Error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
