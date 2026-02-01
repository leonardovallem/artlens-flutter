import 'package:artlens/home/presentation/home_event.dart';
import 'package:artlens/home/presentation/home_state.dart';
import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:artlens/shared/domain/repository/art_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ArtRepository _artsRepository;

  HomeBloc(this._artsRepository) : super(HomeState.initial()) {
    on<FetchPage>(_onLoadNextPage);
  }

  Future<void> _onLoadNextPage(FetchPage event, Emitter<HomeState> emit) async {
    void updateArtworksListState(PagingState<int, Artwork> newState) {
      emit(state.copyWith(artworksListState: newState));
    }

    updateArtworksListState(state.artworksListState.copyWith(isLoading: true));

    final nextKey = (state.artworksListState.keys?.last ?? 0) + 1;
    final result = await _artsRepository.retrievePage(nextKey);

    result
        .onSuccess((newItems) {
          updateArtworksListState(
            state.artworksListState.copyWith(
              pages: [...?state.artworksListState.pages, newItems],
              keys: [...?state.artworksListState.keys, nextKey],
              hasNextPage: newItems.isNotEmpty,
              isLoading: false,
              error: null,
            ),
          );
        })
        .onFailure((err) {
          updateArtworksListState(state.artworksListState.copyWith(isLoading: false, error: err));
        });
  }
}
