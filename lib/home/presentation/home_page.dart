import 'package:artlens/home/presentation/home_bloc.dart';
import 'package:artlens/home/presentation/home_event.dart';
import 'package:artlens/home/presentation/home_state.dart';
import 'package:artlens/shared/domain/model/Artwork.dart';
import 'package:artlens/shared/presentation/navigation/route.dart';
import 'package:artlens/shared/util/extensions/string.dart';
import 'package:artlens/shared/util/ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (ctx) => GetIt.I<HomeBloc>()..add(HomeStart()),
    child: HomeView(),
  );
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ArtLens Home')),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => switch (state.artworksState) {
          Loading<List<Artwork>>() => const Center(
            child: CircularProgressIndicator(),
          ),
          Failure<List<Artwork>>(error: final err) => Center(
            child: SelectableText('Error: $err'),
          ),
          Success<List<Artwork>>(data: final artworks) => ListView.builder(
            itemCount: artworks.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(artworks[index].title),
              subtitle: Text(artworks[index].description.stripHtmlTags(), overflow: .ellipsis),
              onTap: () {
                context.push(Destination.detail.route, extra: artworks[index]);
              },
            ),
          ),
        },
      ),
    );
  }
}
