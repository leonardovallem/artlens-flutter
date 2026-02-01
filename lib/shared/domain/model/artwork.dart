import 'dart:convert';
import 'dart:typed_data';

class Artwork {
  final int id;
  final String title;
  final String? description;
  final String? dateDisplay;
  final String? imageUrl;
  final List<String> categories;

  Artwork(this.id, this.title, this.description, this.dateDisplay, this.imageUrl, this.categories);

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
}
