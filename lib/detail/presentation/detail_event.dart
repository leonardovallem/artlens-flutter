import 'package:artlens/shared/domain/model/Artwork.dart';

sealed class DetailEvent {
  const DetailEvent();
}

final class LoadArtwork extends DetailEvent {
  final Artwork? artwork;
  const LoadArtwork(this.artwork);
}