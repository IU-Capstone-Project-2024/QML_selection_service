import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

extension NavigationManager on BuildContext {
  void goToLoginPage() {
    go('/login');
  }

  void goToHomePage(String id) {
    go('/home/$id');
  }

  void goToSignupPage() {
    _openInNewTab('/login/signup');
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
