import 'package:dio/dio.dart';
import 'package:dio_log/dio_log.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SharedModule {
  @lazySingleton
  Dio get dio {
    DioLogInterceptor.enablePrintLog = true;

    return Dio(BaseOptions(baseUrl: "https://api.artic.edu/api"))
      ..interceptors.add(DioLogInterceptor());
  }
}
