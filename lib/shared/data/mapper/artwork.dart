import 'package:artlens/shared/data/model/artwork_dto.dart';
import 'package:artlens/shared/domain/model/artwork.dart';

import '../source/local/app_database.dart';

extension DomainArtworkToEntity on Artwork {
  ArtworkEntity toEntity() => ArtworkEntity(
    id: id,
    title: title,
    description: description,
    dateDisplay: dateDisplay,
    imageUrl: imageUrl,
  );
}

extension ArtworkEntityToDomain on ArtworkEntity {
  Artwork toDomain(List<CategoryEntity> categories) => Artwork(
    id,
    title,
    description,
    dateDisplay,
    imageUrl,
    categories.map((c) => c.name).toList(),
  );
}

extension ArtworkDtoToDomain on ArtworkDataDto {
  Artwork? toDomain(String? imageBaseUrl) {
    if (id == null || title == null) return null;

    return Artwork(
      id!,
      title!,
      description,
      dateDisplay,
      _buildImageUrl(imageBaseUrl, imageId),
      categoryTitles ?? [],
    );
  }

  static String? _buildImageUrl(String? baseUrl, String? imageId) {
    if (baseUrl == null || imageId == null) return null;
    return '$baseUrl/$imageId/full/843,/0/default.jpg';
  }
}

extension ArtworkThumbnailDtoToDomain on ArtworkThumbnailDto {
  ArtworkThumbnail? toDomain() {
    if (lqip == null || altText == null) return null;
    return ArtworkThumbnail(lqip!, altText!);
  }
}