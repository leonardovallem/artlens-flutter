import 'package:artlens/detail/presentation/detail_event.dart';
import 'package:artlens/detail/presentation/detail_state.dart';
import 'package:artlens/shared/presentation/util/ui_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailState()) {
    on<LoadArtwork>(_loadArtwork);
  }

  Future<void> _loadArtwork(
    LoadArtwork event,
    Emitter<DetailState> emit,
  ) async {
    emit(state.copyWith(artworkState: event.artwork == null ? UiState.failure("No artwork provided") : UiState.success(event.artwork!)));
  }
}
