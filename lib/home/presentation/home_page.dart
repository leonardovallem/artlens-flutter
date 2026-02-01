import 'package:artlens/home/presentation/home_bloc.dart';
import 'package:artlens/home/presentation/home_event.dart';
import 'package:artlens/home/presentation/home_state.dart';
import 'package:artlens/home/presentation/widget/artwork_list_item.dart';
import 'package:artlens/shared/domain/model/artwork.dart';
import 'package:artlens/shared/presentation/navigation/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(create: (ctx) => GetIt.I<HomeBloc>()..add(FetchPage()), child: HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ArtLens Home')),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.artworksListState.status == .loadingFirstPage) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.artworksListState.status == .firstPageError) {
            return Center(child: SelectableText('Error: ${state.artworksListState.error}'));
          }

          return PagedListView(
            state: state.artworksListState,
            fetchNextPage: () => context.read<HomeBloc>().add(FetchPage()),
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) => ArtworkListItem(
                artwork: item as Artwork, // TODO check this logic
                onTap: () => context.push(Destination.detail.route, extra: item),
              ),
            ),
          );
        },
      ),
    );
  }
}
