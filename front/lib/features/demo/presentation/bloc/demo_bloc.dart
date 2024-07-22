import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import '../../../../core/routing/navigation.dart';

part 'demo_event.dart';
part 'demo_bloc.freezed.dart';
part 'demo_state.dart';

@injectable
class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc() : super(DemoState()) {
    on<ChooseTarget>(_onChooseTarget);
    on<AddPath>(_onAddPath);
    on<ListColumns>(_onListColumns);
    on<DownloadIndecator>(_onDownloadIndecator);
    on<DemoFormPage>(_onDemoFormPage);
  }

  void _onDemoFormPage(
    DemoFormPage event,
    Emitter<DemoState> emit,
  ) {
    emit(state.copyWith(
      initial: true,
      medium: false,
      prev: false,
    ));
  }

  void _onChooseTarget(
    ChooseTarget event,
    Emitter<DemoState> emit,
  ) {
    emit(state.copyWith(initial: false, medium: true));
  }

  void _onAddPath(
    AddPath event,
    Emitter<DemoState> emit,
  ) {
    emit(state.copyWith(file: event.file));
  }

  void _onListColumns(
    ListColumns event,
    Emitter<DemoState> emit,
  ) {
    emit(state.copyWith(medium: false, last: true));
  }

  void _onDownloadIndecator(
    DownloadIndecator event,
    Emitter<DemoState> emit,
  ) async {
    emit(state.copyWith(
      last: false,
      prev: true,
    ));
    var uri = Uri.parse('http://158160.103.114:8181/api/uploadCsv');

    var request = http.MultipartRequest('POST', uri);

    var multipartFile = http.MultipartFile.fromBytes('file', event.fileBytes,
        filename: event.fileName);
    request.files.add(multipartFile);

    var headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer ${event.id}',
    };
    request.headers.addAll(headers);

    // Add the target column to the fields
    request.fields['target_column_name'] = event.targetColumn;

    try {
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      if (responseBody.statusCode == 200) {
        var jsonResponse = jsonDecode(responseBody.body);
        if (kDebugMode) {
          print('File uploaded successfully');
          print('Response JSON: $jsonResponse');
        }
        emit(state.copyWith(prev: false, initial: true));
        NavigationManager.goToTheReportPage(jsonResponse);
      } else {
        if (kDebugMode) {
          print('File upload failed with status: ${responseBody.statusCode}');
          print('Response body: ${responseBody.body}');
        }
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      if (kDebugMode) {
        print('Exception during file upload: $e');
      }
    }
  }
}
