import 'package:artlens/shared/data/model/artwork_dto.dart';

class Artwork {
  final int id;
  final String title;
  final String description;
  final String? dateDisplay;
  final ArtworkThumbnail? thumbnail;
  final List<String> categories;

  Artwork(
    this.id,
    this.title,
    this.description,
    this.dateDisplay,
    this.thumbnail,
    this.categories,
  );

  static Artwork? fromDto(ArtworkDataDto dto) {
    if (dto.id == null || dto.title == null) return null;

    return Artwork(
      dto.id!,
      dto.title!,
      dto.description ?? "No description",
      dto.dateDisplay,
      ArtworkThumbnail.fromDto(dto.thumbnail),
      dto.categoryTitles ?? [],
    );
  }
}

class ArtworkThumbnail {
  final String lqip;
  final String altText;

  ArtworkThumbnail(this.lqip, this.altText);

  static ArtworkThumbnail? fromDto(ArtworkThumbnailDto? dto) {
    if (dto == null || dto.lqip == null || dto.altText == null) return null;
    return ArtworkThumbnail(dto.lqip!, dto.altText!);
  }
}
