// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artworks_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtworksResponseDto _$ArtworksResponseDtoFromJson(Map<String, dynamic> json) =>
    ArtworksResponseDto(
      data: (json['data'] as List<dynamic>)
          .map((e) => ArtworkDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      config: ArtworkConfigDto.fromJson(json['config'] as Map<String, dynamic>),
      pagination: PageDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtworksResponseDtoToJson(
  ArtworksResponseDto instance,
) => <String, dynamic>{
  'data': instance.data,
  'config': instance.config,
  'pagination': instance.pagination,
};

const _$ArtworksResponseDtoJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'data': {
      'type': 'array',
      'items': {r'$ref': r'#/$defs/ArtworkDataDto'},
    },
    'config': {r'$ref': r'#/$defs/ArtworkConfigDto'},
    'pagination': {r'$ref': r'#/$defs/PageDto'},
  },
  'required': ['data', 'config', 'pagination'],
  r'$defs': {
    'ArtworkThumbnailDto': {
      'type': 'object',
      'properties': {
        'lqip': {'type': 'string'},
        'altText': {'type': 'string'},
      },
    },
    'ArtworkDataDto': {
      'type': 'object',
      'properties': {
        'id': {'type': 'integer'},
        'title': {'type': 'string'},
        'description': {'type': 'string'},
        'dateDisplay': {'type': 'string'},
        'imageId': {'type': 'string'},
        'thumbnail': {r'$ref': r'#/$defs/ArtworkThumbnailDto'},
        'categoryTitles': {
          'type': 'array',
          'items': {'type': 'string'},
        },
      },
    },
    'ArtworkConfigDto': {
      'type': 'object',
      'properties': {
        'iiif_url': {'type': 'string'},
      },
    },
    'PageDto': {
      'type': 'object',
      'properties': {
        'total': {'type': 'integer'},
        'limit': {'type': 'integer'},
        'offset': {'type': 'integer'},
        'totalPages': {'type': 'integer'},
        'currentPage': {'type': 'integer'},
      },
      'required': ['total', 'limit', 'offset', 'totalPages', 'currentPage'],
    },
  },
};
