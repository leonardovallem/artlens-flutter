import 'package:artlens/detail/presentation/detail_bloc.dart';
import 'package:artlens/detail/presentation/detail_state.dart';
import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:artlens/shared/util/ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'detail_event.dart';

class DetailPage extends StatelessWidget {
  final Artwork? _artwork;

  const DetailPage({super.key, Artwork? artwork}) : _artwork = artwork;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (ctx) => GetIt.I<DetailBloc>()..add(LoadArtwork(_artwork)),
    child: const DetailView(),
  );
}

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) => switch (state.artworkState) {
        Loading<Artwork>() => const Center(
          child: CircularProgressIndicator(),
        ),
        Failure<Artwork>(error: final err) => Center(
          child: SelectableText('Error: $err'),
        ),
        Success<Artwork>(data: final artwork) => Column(
          children: [
            // Image.network(state.artwork!.imageUrl),  // TODO
            Text(
              artwork.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(artwork.description),
            ),
          ],
        ),
      },
    ),
  );
}
