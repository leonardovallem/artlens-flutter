import 'package:artlens/detail/presentation/detail_bloc.dart';
import 'package:artlens/detail/presentation/detail_state.dart';
import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:artlens/shared/util/ui_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_it/get_it.dart';

import '../../shared/presentation/widget/category_chip.dart';
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
  Widget build(BuildContext context) => BlocBuilder<DetailBloc, DetailState>(
    builder: (context, state) => Scaffold(
      appBar: AppBar(
        title: switch (state.artworkState) {
          Loading<Artwork>() => const Text('Loading artwork'),
          Failure<Artwork>() => const Text('Error loading artwork'),
          Success<Artwork>(data: final artwork) => Text(artwork.title),
        },
      ),
      body: switch (state.artworkState) {
        Loading<Artwork>() => const Center(child: CircularProgressIndicator()),
        Failure<Artwork>(error: final err) => Center(
          child: SelectableText('Error: $err'),
        ),
        Success<Artwork>(data: final artwork) => SingleChildScrollView(
          child: Column(
            spacing: 12,
            children: [
              if (artwork.imageUrl != null)
                CachedNetworkImage(
                  imageUrl: artwork.imageUrl!,
                  width: double.infinity,
                  fit: .fitHeight,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ...artwork.categories.map(
                    (category) => CategoryChip(category: category),
                  ),
                ],
              ),
              if (artwork.description != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Html(data: artwork.description!),
                )
              else
                Text(
                  "No description available",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
            ],
          ),
        ),
      },
    ),
  );
}
