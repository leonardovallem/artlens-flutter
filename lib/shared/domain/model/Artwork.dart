import 'dart:convert';
import 'dart:typed_data';

import 'package:artlens/shared/data/model/artwork_dto.dart';

class Artwork {
  final int id;
  final String title;
  final String description;
  final String? dateDisplay;
  final String? imageUrl;
  final List<String> categories;

  Artwork(
    this.id,
    this.title,
    this.description,
    this.dateDisplay,
    this.imageUrl,
    this.categories,
  );

  static Artwork? fromDto(ArtworkDataDto dto, String? imageBaseUrl) {
    if (dto.id == null || dto.title == null) return null;

    return Artwork(
      dto.id!,
      dto.title!,
      dto.description ?? "No description",
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
