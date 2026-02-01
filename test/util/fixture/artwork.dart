import 'package:artlens/shared/data/model/artwork_dto.dart';
import 'package:artlens/shared/data/model/artworks_response_dto.dart';
import 'package:artlens/shared/data/model/page.dart';
import 'package:artlens/shared/data/source/local/app_database.dart';

ArtworksResponseDto fakeArtworksResponseDto() => ArtworksResponseDto(
  data: [ArtworkDataDto(1, "", null, null, null, null, [])],
  config: ArtworkConfigDto(null),
  pagination: PageDto(total: 1, limit: 0, offset: 0, totalPages: 1, currentPage: 1),
);

List<ArtworkEntity> fakeArtworkEntities() => [
  ArtworkEntity(id: 1, title: "", description: null, imageUrl: null),
];
