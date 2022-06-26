import 'package:delivery_hero_challenge/app/app_defaults.dart';
import 'package:delivery_hero_challenge/models/movie_list_model.dart';
import 'package:delivery_hero_challenge/utils/network_error_handler.dart';
import 'package:dio/dio.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    final baseOptions = BaseOptions(
      baseUrl: AppDefaults.kBaseUrl,
      queryParameters: {
        'api_key': AppDefaults.kApiKey,
      },
    );
    _dio = Dio(baseOptions);
  }

  Future<MovieListModel> getPopularMovies(Map<String, dynamic> params,
      {String endPoint = "movie/popular"}) async {
    try {
      final result = await _dio.get(endPoint, queryParameters: params);
      final json = result.data;
      return MovieListModel.fromMap(json);
    } on DioError catch (error) {
      final errorMsg = handleNetworkError(error);
      return MovieListModel.withError(errorMsg);
    }
  }
}
