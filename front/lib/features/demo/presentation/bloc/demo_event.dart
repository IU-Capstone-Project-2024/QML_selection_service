part of 'demo_bloc.dart';

class DemoEvent {}

class ChooseTarget extends DemoEvent {}

class AddPath extends DemoEvent {
  final PlatformFile file;
  AddPath({required this.file});
}

class ListColumns extends DemoEvent {}

class DownloadIndecator extends DemoEvent {}
