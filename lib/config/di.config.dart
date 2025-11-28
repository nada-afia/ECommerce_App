// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../api/api_services.dart' as _i124;
import '../api/data_source/remote/auth/auth_remote_data_source_impl.dart'
    as _i502;
import '../api/dio/dio_module.dart' as _i223;
import '../data/data_source/remote/auth_remote_data_source.dart' as _i1066;
import '../data/repository/auth/auth_repository_impl.dart' as _i779;
import '../domain/repositories/auth/auth_repository.dart' as _i1064;
import '../domain/use_case/login_use_case.dart' as _i772;
import '../domain/use_case/register_use_case.dart' as _i224;
import '../features/ui/auth/login/cubit/login_view_model.dart' as _i1040;
import '../features/ui/auth/register/cubit/register_view_model.dart' as _i586;
import '../features/ui/Home/home_screen/cubit/home_screen_view_model.dart'
    as _i208;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final gitItModule = _$GitItModule();
    gh.factory<_i208.HomeScreenViewModel>(() => _i208.HomeScreenViewModel());
    gh.singleton<_i361.BaseOptions>(() => gitItModule.providerBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => gitItModule.providePrettyDioLogger(),
    );
    gh.factory<_i361.Dio>(
      () => gitItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i124.ApiServices>(
      () => gitItModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i1066.AuthRemoteDataSource>(
      () =>
          _i502.AuthRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i1064.AuthRepository>(
      () => _i779.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i1066.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i772.LoginUseCase>(
      () => _i772.LoginUseCase(authRepository: gh<_i1064.AuthRepository>()),
    );
    gh.factory<_i224.RegisterUseCase>(
      () => _i224.RegisterUseCase(authRepository: gh<_i1064.AuthRepository>()),
    );
    gh.factory<_i1040.LoginViewModel>(
      () => _i1040.LoginViewModel(loginUseCase: gh<_i772.LoginUseCase>()),
    );
    gh.factory<_i586.RegisterViewModel>(
      () =>
          _i586.RegisterViewModel(registerUseCase: gh<_i224.RegisterUseCase>()),
    );
    return this;
  }
}

class _$GitItModule extends _i223.GitItModule {}
