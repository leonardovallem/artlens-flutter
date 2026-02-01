import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:artlens/shared/presentation/util/ui_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(UiState.loading()) UiState<List<Artwork>> artworksState,
  }) = _HomeState;
}
