
import 'package:delivery_hero_challenge/app/app_defaults.dart';
import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    final baseOptions = BaseOptions(
      baseUrl: AppDefaults.kBaseUrl,
      queryParameters: {'api_key': AppDefaults.kApiKey},
    );
    _dio = Dio(baseOptions);
  }
}
