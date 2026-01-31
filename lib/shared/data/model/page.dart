import 'package:json_annotation/json_annotation.dart';

part 'page.g.dart';

@JsonSerializable(createJsonSchema: true, fieldRename: .snake)
class PageDto {
  final int total;
  final int limit;
  final int offset;
  final int totalPages;
  final int currentPage;

  PageDto({
    required this.total,
    required this.limit,
    required this.offset,
    required this.totalPages,
    required this.currentPage,
  });

  factory PageDto.fromJson(Map<String, dynamic> json) => _$PageDtoFromJson(json);
}