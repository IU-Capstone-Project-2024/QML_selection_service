import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@module
abstract class RegisterFirebaseAuth {
  firebase_auth.FirebaseAuth get firebaseAuth =>
      firebase_auth.FirebaseAuth.instance;
}

@module
abstract class RegisterFirebaseFirestore {
  FirebaseFirestore get firebaseFirestore {
    return FirebaseFirestore.instance
      ..settings = const Settings(persistenceEnabled: true);
  }
}
