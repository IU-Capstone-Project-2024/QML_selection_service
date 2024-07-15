// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:flutter/material.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/bloc/app_bloc.dart' as _i5;
import '../../common/counter/counter.dart' as _i7;
import '../../features/authentication/data/repository/repository.dart' as _i10;
import '../../features/authentication/domain/repository/repository.dart' as _i9;
import '../../features/demo/presentation/bloc/demo_bloc.dart' as _i6;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i12;
import '../../features/signup/presentation/bloc/signup_bloc.dart' as _i11;
import '../firebase/firebase.dart' as _i13;

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
    final registerFirebaseAuth = _$RegisterFirebaseAuth();
    final registerFirebaseFirestore = _$RegisterFirebaseFirestore();
    gh.factory<_i3.FirebaseAuth>(() => registerFirebaseAuth.firebaseAuth);
    gh.factory<_i4.FirebaseFirestore>(
        () => registerFirebaseFirestore.firebaseFirestore);
    gh.factory<_i5.AppBloc>(() => _i5.AppBloc());
    gh.factory<_i6.DemoBloc>(() => _i6.DemoBloc());
    gh.factory<_i7.Counter>(() => _i7.Counter(key: gh<_i8.Key>()));
    gh.singleton<_i9.AuthenticationRepository>(() =>
        _i10.FirebaseAuthenticationRepository(
            firebaseAuth: gh<_i3.FirebaseAuth>()));
    gh.factory<_i11.SignupBloc>(
        () => _i11.SignupBloc(gh<_i9.AuthenticationRepository>()));
    gh.factory<_i12.LoginBloc>(
        () => _i12.LoginBloc(gh<_i9.AuthenticationRepository>()));
    return this;
  }
}

class _$RegisterFirebaseAuth extends _i13.RegisterFirebaseAuth {}

class _$RegisterFirebaseFirestore extends _i13.RegisterFirebaseFirestore {}
