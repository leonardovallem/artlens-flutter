// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:artlens/shared/data/repository/art_repository.dart' as _i910;
import 'package:artlens/shared/data/source/remote_art_datasource.dart' as _i708;
import 'package:artlens/shared/di/shared_module.dart' as _i1005;
import 'package:dio/dio.dart' as _i361;
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
    gh.lazySingleton<_i361.Dio>(() => sharedModule.dio);
    gh.factory<_i708.RemoteArtDatasource>(
      () => _i708.RemoteArtDatasource(gh<_i361.Dio>()),
    );
    gh.factory<_i910.ArtRepositoryImpl>(
      () => _i910.ArtRepositoryImpl(gh<_i708.RemoteArtDatasource>()),
    );
    return this;
  }
}

class _$SharedModule extends _i1005.SharedModule {}
