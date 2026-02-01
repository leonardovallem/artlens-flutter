import 'package:artlens/shared/domain/model/artwork.dart';

sealed class DetailEvent {
  const DetailEvent();
}

final class LoadArtwork extends DetailEvent {
  final Artwork? artwork;
  const LoadArtwork(this.artwork);
}