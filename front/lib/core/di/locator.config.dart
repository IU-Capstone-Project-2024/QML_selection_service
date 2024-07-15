// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/bloc/app_bloc.dart' as _i3;
import '../../features/authentication/data/repository/repository.dart' as _i7;
import '../../features/authentication/domain/repository/repository.dart' as _i6;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i8;
import '../../features/signup/presentation/bloc/signup_bloc.dart' as _i9;
import '../firebase/firebase.dart' as _i10;

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
    gh.factory<_i3.AppBloc>(() => _i3.AppBloc());
    gh.factory<_i4.FirebaseAuth>(() => registerFirebaseAuth.firebaseAuth);
    gh.factory<_i5.FirebaseFirestore>(
        () => registerFirebaseFirestore.firebaseFirestore);
    gh.singleton<_i6.AuthenticationRepository>(() =>
        _i7.FirebaseAuthenticationRepository(
            firebaseAuth: gh<_i4.FirebaseAuth>()));
    gh.factory<_i8.LoginBloc>(
        () => _i8.LoginBloc(gh<_i6.AuthenticationRepository>()));
    gh.factory<_i9.SignupBloc>(
        () => _i9.SignupBloc(gh<_i6.AuthenticationRepository>()));
    return this;
  }
}

class _$RegisterFirebaseAuth extends _i10.RegisterFirebaseAuth {}

class _$RegisterFirebaseFirestore extends _i10.RegisterFirebaseFirestore {}
