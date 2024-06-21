// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/authentication/data/repository/repository.dart' as _i6;
import '../../features/authentication/domain/repository/repository.dart' as _i5;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i7;
import '../../features/signup/bloc/signup_bloc.dart' as _i8;
import '../firebase/firebase.dart' as _i9;

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
    gh.singleton<_i5.AuthenticationRepository>(() =>
        _i6.FirebaseAuthenticationRepository(
            firebaseAuth: gh<_i3.FirebaseAuth>()));
    gh.factory<_i7.LoginBloc>(
        () => _i7.LoginBloc(gh<_i5.AuthenticationRepository>()));
    gh.factory<_i8.SignupBloc>(
        () => _i8.SignupBloc(gh<_i5.AuthenticationRepository>()));
    return this;
  }
}

class _$RegisterFirebaseAuth extends _i9.RegisterFirebaseAuth {}

class _$RegisterFirebaseFirestore extends _i9.RegisterFirebaseFirestore {}
