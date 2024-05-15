import 'package:dio/dio.dart';

class ApiRepository {
  final String url;
  final Map<String, dynamic> payload;

  ApiRepository({
    required this.url,
    required this.payload,
  });

  final Dio _dio = Dio();

  Future<void> get({
    Function? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    try {
      if (beforeSend != null) {
        beforeSend();
      }

      Response response = await _dio.get(url, queryParameters: payload);

      if (onSuccess != null) {
        onSuccess(response.data);
      }
    } catch (error) {
      if (onError != null) {
        onError(error);
      }
    }
  }
}
