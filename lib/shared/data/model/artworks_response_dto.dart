import 'package:artlens/shared/data/model/page.dart';
import 'package:json_annotation/json_annotation.dart';

import 'artwork_dto.dart';

part 'artworks_response_dto.g.dart';

@JsonSerializable(createJsonSchema: true, fieldRename: .snake)
class ArtworksResponseDto {
  final List<ArtworkDataDto> data;
  final ArtworkConfigDto config;
  final PageDto pagination;

  ArtworksResponseDto({
    required this.data,
    required this.config,
    required this.pagination,
  });

  factory ArtworksResponseDto.fromJson(Map<String, dynamic> json) => _$ArtworksResponseDtoFromJson(json);
}
