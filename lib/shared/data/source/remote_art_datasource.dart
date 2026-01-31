import 'package:artlens/shared/data/model/artwork_dto.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'remote_art_datasource.g.dart';

@injectable
@RestApi()
abstract class RemoteArtDatasource {
  @factoryMethod
  factory RemoteArtDatasource(Dio dio) = _RemoteArtDatasource;

  @GET("/v1/artworks")
  Future<HttpResponse<List<ArtworkDto>>> retrieveAll();
}