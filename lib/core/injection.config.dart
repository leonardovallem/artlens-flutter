// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:artlens/detail/presentation/detail_bloc.dart' as _i198;
import 'package:artlens/home/presentation/home_bloc.dart' as _i622;
import 'package:artlens/shared/data/repository/art_repository.dart' as _i910;
import 'package:artlens/shared/data/source/local/app_database.dart' as _i986;
import 'package:artlens/shared/data/source/local/artwork/artwork_dao.dart'
    as _i127;
import 'package:artlens/shared/data/source/local/category/category_dao.dart'
    as _i818;
import 'package:artlens/shared/data/source/remote/remote_art_datasource.dart'
    as _i29;
import 'package:artlens/shared/di/shared_module.dart' as _i1005;
import 'package:artlens/shared/domain/repository/art_repository.dart' as _i385;
import 'package:dio/dio.dart' as _i361;
import 'package:drift/backends.dart' as _i883;
import 'package:drift/drift.dart' as _i500;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedModule = _$SharedModule();
    gh.factory<_i198.DetailBloc>(() => _i198.DetailBloc());
    gh.lazySingleton<_i361.Dio>(() => sharedModule.dio);
    gh.lazySingleton<_i883.QueryExecutor>(() => sharedModule.queryExecutor);
    gh.factory<_i29.RemoteArtDatasource>(
      () => _i29.RemoteArtDatasource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i986.AppDatabase>(
      () => _i986.AppDatabase(gh<_i500.QueryExecutor>()),
    );
    gh.factory<_i127.ArtworkDao>(
      () => _i127.ArtworkDao(gh<_i986.AppDatabase>()),
    );
    gh.factory<_i818.CategoryDao>(
      () => _i818.CategoryDao(gh<_i986.AppDatabase>()),
    );
    gh.factory<_i385.ArtRepository>(
      () => _i910.ArtRepositoryImpl(
        gh<_i29.RemoteArtDatasource>(),
        gh<_i127.ArtworkDao>(),
        gh<_i818.CategoryDao>(),
      ),
    );
    gh.factory<_i622.HomeBloc>(() => _i622.HomeBloc(gh<_i385.ArtRepository>()));
    return this;
  }
}

class _$SharedModule extends _i1005.SharedModule {}
