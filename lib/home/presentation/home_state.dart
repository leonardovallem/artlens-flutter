import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({required PagingState<int, Artwork> artworksListState}) = _HomeState;

  factory HomeState.initial() =>
      HomeState(artworksListState: PagingState(hasNextPage: false, isLoading: false));
}
