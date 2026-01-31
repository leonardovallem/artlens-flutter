import 'package:json_annotation/json_annotation.dart';

part 'artwork_dto.g.dart';

@JsonSerializable(createJsonSchema: true, fieldRename: .snake)
class ArtworkDto {
  final ArtworkDataDto? data;

  ArtworkDto(this.data);

  factory ArtworkDto.fromJson(Map<String, dynamic> json) => _$ArtworkDtoFromJson(json);
}

@JsonSerializable(createJsonSchema: true, fieldRename: .snake)
class ArtworkDataDto {
  final int? id;
  final String? title;
  final String? description;
  final String? dateDisplay;
  final String? imageId;
  final ArtworkThumbnailDto? thumbnail;
  final List<String>? categoryTitles;

  ArtworkDataDto(
    this.id,
    this.title,
    this.description,
    this.dateDisplay,
    this.imageId,
    this.thumbnail,
    this.categoryTitles,
  );

  factory ArtworkDataDto.fromJson(Map<String, dynamic> json) => _$ArtworkDataDtoFromJson(json);
}

@JsonSerializable(createJsonSchema: true, fieldRename: .snake)
class ArtworkThumbnailDto {
  final String? lqip;
  final String? altText;

  ArtworkThumbnailDto(this.lqip, this.altText);

  factory ArtworkThumbnailDto.fromJson(Map<String, dynamic> json) => _$ArtworkThumbnailDtoFromJson(json);
}

@JsonSerializable(createJsonSchema: true, fieldRename: .snake)
class ArtworkConfigDto {
  final String? iiifUrl;

  ArtworkConfigDto(this.iiifUrl);

  factory ArtworkConfigDto.fromJson(Map<String, dynamic> json) => _$ArtworkConfigDtoFromJson(json);
}