extension StringExtensions on String {
  String stripHtmlTags() => replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
}