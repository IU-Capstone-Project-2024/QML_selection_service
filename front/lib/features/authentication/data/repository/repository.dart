import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../../domain/models/exceptions.dart';
import '../../domain/repository/repository.dart';

@Singleton(as: AuthenticationRepository)
class FirebaseAuthenticationRepository implements AuthenticationRepository {
  FirebaseAuthenticationRepository();

  @override
  Future<void> signUp({required String email, required String password}) async {
    final Uri url = Uri.parse('http://158.160.103.114:8181/api/auth/register');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': 'super',
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('User registered successfully.');
        }
      } else {
        // Handle error response
        throw Exception('Failed to register user. Error: ${response.body}');
      }
    } catch (e) {
      // Handle exceptions
      if (kDebugMode) {
        print('Exception occurred: $e');
      }
      throw Exception('Failed to register user.');
    }
  }

  @override
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final Uri url = Uri.parse('http://158.160.103.114:8181/api/auth/login');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['userId'] ?? responseData['token'] ?? '';
      } else {
        throw Exception('Failed to login. Error: ${response.body}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception occurred: $e');
      }
      throw Exception('Failed to login.');
    }
  }

  @override
  Future<void> logOut() async {
    try {
      await Future.wait([]);
    } catch (_) {
      throw const FirebaseAuthFailure();
    }
  }
}
