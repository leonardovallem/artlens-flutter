import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:artlens/shared/presentation/util/ui_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_state.freezed.dart';

@freezed
abstract class DetailState with _$DetailState {
  const factory DetailState({
    @Default(UiState.loading()) UiState<Artwork> artworkState,
  }) = _DetailState;
}
