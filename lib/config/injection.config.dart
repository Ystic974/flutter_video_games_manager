// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:video_games_manager_flutter/api/api_service.dart' as _i173;
import 'package:video_games_manager_flutter/games/game_notifier.dart' as _i259;
import 'package:video_games_manager_flutter/games/game_repository.dart' as _i52;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i173.ApiService>(() => _i173.ApiService());
    gh.factory<_i52.GameRepository>(
        () => _i52.GameRepository(gh<_i173.ApiService>()));
    gh.factory<_i259.GameNotifier>(
        () => _i259.GameNotifier(gh<_i52.GameRepository>()));
    return this;
  }
}
