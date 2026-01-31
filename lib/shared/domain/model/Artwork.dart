class Artwork {
  final int id;
  final String title;
  final String description;
  final String dateDisplay;
  final ArtworkThumbnail thumbnail;
  final List<String> categories;

  Artwork(this.id, this.title, this.description, this.dateDisplay, this.thumbnail, this.categories);

  factory Artwork.fromDto(dynamic dto) {
    return Artwork(
      dto.data.id,
      dto.data.title,
      dto.data.description,
      dto.data.dateDisplay,
      ArtworkThumbnail(dto.data.thumbnail.lqip, dto.data.thumbnail.altText),
      List<String>.from(dto.data.categoryTitles),
    );
  }
}

class ArtworkThumbnail {
  final String lqip;
  final String altText;

  ArtworkThumbnail(this.lqip, this.altText);
}