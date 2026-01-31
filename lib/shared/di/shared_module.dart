import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SharedModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: "https://api.artic.edu/api",
    )
  );
}
