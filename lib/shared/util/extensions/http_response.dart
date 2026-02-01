
import 'package:retrofit/dio.dart';

extension HttpResponseExtension<T> on HttpResponse<T> {
  bool get isSuccess {
    final statusCode = response.statusCode ?? 0;
    return statusCode >= 200 && statusCode < 300;
  }
}