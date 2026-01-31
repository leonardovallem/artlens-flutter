import 'package:artlens/detail/presentation/detail_page.dart';
import 'package:artlens/home/presentation/home_page.dart';
import 'package:artlens/shared/presentation/navigation/route.dart';
import 'package:go_router/go_router.dart';

import '../shared/domain/model/Artwork.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Destination.home.route,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: Destination.detail.route,
      builder: (context, state) => DetailPage(artwork: state.extra as Artwork?),
    ),
  ],
);
