import 'dart:convert';
import 'dart:typed_data';

import 'package:artlens/shared/data/model/artwork_dto.dart';

import '../../data/source/local/app_database.dart';

class Artwork {
  final int id;
  final String title;
  final String? description;
  final String? dateDisplay;
  final String? imageUrl;
  final List<String> categories;

  Artwork(this.id, this.title, this.description, this.dateDisplay, this.imageUrl, this.categories);

  factory Artwork.fromEntity(ArtworkEntity entity, List<CategoryEntity> categories) => Artwork(
    entity.id,
    entity.title,
    entity.description,
    entity.dateDisplay,
    entity.imageUrl,
    categories.map((c) => c.name).toList(),
  );

  ArtworkEntity toEntity() => ArtworkEntity(
    id: id,
    title: title,
    description: description,
    dateDisplay: dateDisplay,
    imageUrl: imageUrl,
  );

  static Artwork? fromDto(ArtworkDataDto dto, String? imageBaseUrl) {
    if (dto.id == null || dto.title == null) return null;

    return Artwork(
      dto.id!,
      dto.title!,
      dto.description,
      dto.dateDisplay,
      _buildImageUrl(imageBaseUrl, dto.imageId),
      dto.categoryTitles ?? [],
    );
  }

  static String? _buildImageUrl(String? baseUrl, String? imageId) {
    if (baseUrl == null || imageId == null) return null;
    return '$baseUrl/$imageId/full/843,/0/default.jpg';
  }

  @override
  String toString() => "$title (image = $imageUrl)";
}

class ArtworkThumbnail {
  final String lqip;
  final String altText;

  ArtworkThumbnail(this.lqip, this.altText);

  Uint8List bytes() {
    final cleanString = lqip.contains(',') ? lqip.split(',').last : lqip;
    return base64Decode(cleanString);
  }

  static ArtworkThumbnail? fromDto(ArtworkThumbnailDto? dto) {
    if (dto == null || dto.lqip == null || dto.altText == null) return null;
    return ArtworkThumbnail(dto.lqip!, dto.altText!);
  }
}
