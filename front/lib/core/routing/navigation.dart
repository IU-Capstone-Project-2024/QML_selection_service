import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;

extension NavigationManager on BuildContext {
  void goToLoginPage() {
    go('/login');
  }

  void goToHomePage() {
    go('/home');
  }

  void goToSignupPage() {
    _openInNewTab('/login/signup');
  }

  void closeCurrentPage() {
    _closeCurrentTab();
  }

  Future<void> _openInNewTab(String url) async {
    final uri = Uri.base.replace(path: url);
    if (await canLaunch(uri.toString())) {
      await launch(
        uri.toString(),
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
