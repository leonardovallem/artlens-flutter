// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtworkDto _$ArtworkDtoFromJson(Map<String, dynamic> json) =>
    ArtworkDto(ArtworkDataDto.fromJson(json['data'] as Map<String, dynamic>));

Map<String, dynamic> _$ArtworkDtoToJson(ArtworkDto instance) =>
    <String, dynamic>{'data': instance.data};

const _$ArtworkDtoJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'data': {r'$ref': r'#/$defs/ArtworkDataDto'},
  },
  'required': ['data'],
  r'$defs': {
    'ArtworkThumbnailDto': {
      'type': 'object',
      'properties': {
        'lqip': {'type': 'string'},
        'altText': {'type': 'string'},
      },
      'required': ['lqip', 'altText'],
    },
    'ArtworkDataDto': {
      'type': 'object',
      'properties': {
        'id': {'type': 'integer'},
        'title': {'type': 'string'},
        'description': {'type': 'string'},
        'dateDisplay': {'type': 'string'},
        'thumbnail': {r'$ref': r'#/$defs/ArtworkThumbnailDto'},
        'categoryTitles': {
          'type': 'array',
          'items': {'type': 'string'},
        },
      },
      'required': [
        'id',
        'title',
        'description',
        'dateDisplay',
        'thumbnail',
        'categoryTitles',
      ],
    },
  },
};

ArtworkDataDto _$ArtworkDataDtoFromJson(Map<String, dynamic> json) =>
    ArtworkDataDto(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['description'] as String,
      json['date_display'] as String,
      ArtworkThumbnailDto.fromJson(json['thumbnail'] as Map<String, dynamic>),
      (json['category_titles'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ArtworkDataDtoToJson(ArtworkDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date_display': instance.dateDisplay,
      'thumbnail': instance.thumbnail,
      'category_titles': instance.categoryTitles,
    };

const _$ArtworkDataDtoJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'id': {'type': 'integer'},
    'title': {'type': 'string'},
    'description': {'type': 'string'},
    'date_display': {'type': 'string'},
    'thumbnail': {r'$ref': r'#/$defs/ArtworkThumbnailDto'},
    'category_titles': {
      'type': 'array',
      'items': {'type': 'string'},
    },
  },
  'required': [
    'id',
    'title',
    'description',
    'date_display',
    'thumbnail',
    'category_titles',
  ],
  r'$defs': {
    'ArtworkThumbnailDto': {
      'type': 'object',
      'properties': {
        'lqip': {'type': 'string'},
        'altText': {'type': 'string'},
      },
      'required': ['lqip', 'altText'],
    },
  },
};

ArtworkThumbnailDto _$ArtworkThumbnailDtoFromJson(Map<String, dynamic> json) =>
    ArtworkThumbnailDto(json['lqip'] as String, json['alt_text'] as String);

Map<String, dynamic> _$ArtworkThumbnailDtoToJson(
  ArtworkThumbnailDto instance,
) => <String, dynamic>{'lqip': instance.lqip, 'alt_text': instance.altText};

const _$ArtworkThumbnailDtoJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'lqip': {'type': 'string'},
    'alt_text': {'type': 'string'},
  },
  'required': ['lqip', 'alt_text'],
};
