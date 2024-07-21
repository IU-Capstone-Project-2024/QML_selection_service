part of 'demo_bloc.dart';

class DemoEvent {}

class ChooseTarget extends DemoEvent {}

class AddPath extends DemoEvent {
  final PlatformFile file;
  AddPath({required this.file});
}

class ListColumns extends DemoEvent {}

class DownloadIndecator extends DemoEvent {
  final Uint8List fileBytes;
  final String fileName;
  final String id;
  final String targetColumn;
  DownloadIndecator(
      {required this.fileBytes,
      required this.fileName,
      required this.id,
      required this.targetColumn});
}

class DemoFormPage extends DemoEvent {}
