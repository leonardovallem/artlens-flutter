// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageDto _$PageDtoFromJson(Map<String, dynamic> json) => PageDto(
  total: (json['total'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
  offset: (json['offset'] as num).toInt(),
  totalPages: (json['total_pages'] as num).toInt(),
  currentPage: (json['current_page'] as num).toInt(),
);

Map<String, dynamic> _$PageDtoToJson(PageDto instance) => <String, dynamic>{
  'total': instance.total,
  'limit': instance.limit,
  'offset': instance.offset,
  'total_pages': instance.totalPages,
  'current_page': instance.currentPage,
};

const _$PageDtoJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'total': {'type': 'integer'},
    'limit': {'type': 'integer'},
    'offset': {'type': 'integer'},
    'total_pages': {'type': 'integer'},
    'current_page': {'type': 'integer'},
  },
  'required': ['total', 'limit', 'offset', 'total_pages', 'current_page'],
};
