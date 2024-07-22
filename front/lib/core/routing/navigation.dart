import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

extension NavigationManager on BuildContext {
  static void goToPage(String path) {
    final url = path;
    html.window.open(url, '_blank');
  }

  static void goToTheReportPage(String path) {
    final url = 'http://158160.103.114:8181$path';
    html.window.open(url, '_blank');
  }

  void goToLoginPage() {
    go('/login');
  }

  void goToHomePage(String id) {
    go('/home/$id');
  }

  void goToSignupPage() {
    go('/login/signup');
  }

  void closeCurrentPage() {
    _closeCurrentTab();
  }

  Future<void> _openInNewTab(String url) async {
    final uri = Uri.base.replace(path: url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        webOnlyWindowName: '_blank',
      );
    } else {
      throw 'Could not launch $uri';
    }
  }

  void _closeCurrentTab() {
    html.window.close();
  }
}
