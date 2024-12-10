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
import 'package:video_games_manager_flutter/app/auth/auth_notifier.dart'
    as _i369;
import 'package:video_games_manager_flutter/app/auth/firebase/auth_repository.dart'
    as _i85;
import 'package:video_games_manager_flutter/games/game_notifier.dart' as _i259;
import 'package:video_games_manager_flutter/games/game_repository.dart' as _i52;
import 'package:video_games_manager_flutter/search/search_notifier.dart'
    as _i18;

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
    gh.factory<_i85.AuthRepository>(() => _i85.AuthRepository());
    gh.singleton<_i173.ApiService>(() => _i173.ApiService());
    gh.factory<_i369.AuthNotifier>(
        () => _i369.AuthNotifier(gh<_i85.AuthRepository>()));
    gh.factory<_i52.GameRepository>(
        () => _i52.GameRepository(gh<_i173.ApiService>()));
    gh.factory<_i18.GameNotifier>(
        () => _i18.GameNotifier(gh<_i52.GameRepository>()));
    gh.factory<_i259.GameNotifier>(
        () => _i259.GameNotifier(gh<_i52.GameRepository>()));
    return this;
  }
}
