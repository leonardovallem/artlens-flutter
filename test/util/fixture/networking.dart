
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

HttpResponse<T> successHttpResponse<T>(T data) {
  final response = Response(
    requestOptions: RequestOptions(path: ''),
    statusCode: 500,
    data: data,
  );

  return HttpResponse(data, response);
}