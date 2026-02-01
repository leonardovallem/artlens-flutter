import 'dart:io';

import 'package:artlens/shared/data/repository/art_repository.dart';
import 'package:artlens/shared/data/source/local/artwork/artwork_dao.dart';
import 'package:artlens/shared/data/source/local/category/category_dao.dart';
import 'package:artlens/shared/data/source/remote/remote_art_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../util/fixture/artwork.dart';
import '../../../util/fixture/networking.dart';
import 'art_repository_test.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<RemoteArtDatasource>(as: #MockRemoteArtDatasource),
    MockSpec<ArtworkDao>(as: #MockArtworkDao),
    MockSpec<CategoryDao>(as: #MockCategoryDao),
  ],
)
void main() {
  late ArtRepositoryImpl sut;

  late MockRemoteArtDatasource remote;
  late MockArtworkDao artworkDao;
  late MockCategoryDao categoryDao;

  setUp(() async {
    remote = MockRemoteArtDatasource();
    artworkDao = MockArtworkDao();
    categoryDao = MockCategoryDao();

    sut = ArtRepositoryImpl(remote, artworkDao, categoryDao);
  });

  tearDown(() async {
    reset(remote);
    reset(artworkDao);
    reset(categoryDao);
  });

  test("given remote retrieval fails, when retrievePage is called, then should try to return local data", () async {
    when(remote.retrievePage(any, any, any)).thenThrow(HttpException(""));
    when(artworkDao.retrievePage(any, any)).thenAnswer((_) async => fakeArtworkEntities());
    when(categoryDao.retrieveCategoriesForArtworks(any)).thenAnswer((_) async => {});

    await sut.retrievePage(1);

    verify(artworkDao.retrievePage(any, any));
  });

  test("given remote retrieval succeeds, when retrievePage is called, then should try to cache remote data", () async {
    when(remote.retrievePage(any, any, any)).thenAnswer((_) async => successHttpResponse(fakeArtworksResponseDto()));

    await sut.retrievePage(1);

    verify(artworkDao.insertAll(any));
  });
}
