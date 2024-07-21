// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/bloc/app_bloc.dart' as _i3;
import '../../common/counter/counter.dart' as _i5;
import '../../features/authentication/data/repository/repository.dart' as _i8;
import '../../features/authentication/domain/repository/repository.dart' as _i7;
import '../../features/demo/presentation/bloc/demo_bloc.dart' as _i4;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i10;
import '../../features/signup/presentation/bloc/signup_bloc.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.AppBloc>(() => _i3.AppBloc());
    gh.factory<_i4.DemoBloc>(() => _i4.DemoBloc());
    gh.factory<_i5.Counter>(() => _i5.Counter(key: gh<_i6.Key>()));
    gh.singleton<_i7.AuthenticationRepository>(
        () => _i8.FirebaseAuthenticationRepository());
    gh.factory<_i9.SignupBloc>(
        () => _i9.SignupBloc(gh<_i7.AuthenticationRepository>()));
    gh.factory<_i10.LoginBloc>(
        () => _i10.LoginBloc(gh<_i7.AuthenticationRepository>()));
    return this;
  }
}
