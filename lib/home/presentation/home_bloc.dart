import 'package:artlens/home/presentation/home_event.dart';
import 'package:artlens/home/presentation/home_state.dart';
import 'package:artlens/shared/domain/repository/art_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../shared/presentation/util/ui_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ArtRepository _artsRepository;

  HomeBloc(this._artsRepository) : super(HomeState()) {
    on<HomeStart>(_onStart);
  }

  Future<void> _onStart(HomeStart event, Emitter<HomeState> emit) async {
    emit(state.copyWith(artworksState: const UiState.loading()));
    final result = await _artsRepository.retrieveAll();

    result.onSuccess((data) {
      emit(state.copyWith(artworksState: UiState.success(data)));
    }).onFailure((err) {
      emit(state.copyWith(artworksState: UiState.failure(err)));
    });
  }
}