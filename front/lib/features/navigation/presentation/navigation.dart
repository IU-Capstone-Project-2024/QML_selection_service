import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/features/demo/presentation/demo_page.dart';
import 'package:front/features/home/presentation/home_page.dart';
import 'package:front/features/info/presentation/info_page.dart';
import 'package:front/features/price_list/presentation/price_list_page.dart';

import '../../reports/presentation/reports_page.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Home',
              ),
              Tab(
                text: 'Reports',
              ),
              Tab(
                text: 'Demo',
              ),
              Tab(
                text: 'Price list',
              ),
              Tab(
                text: 'Info',
              ),
            ],
          ),
          toolbarHeight: 0,
        ),
        body: const TabBarView(
          children: [
            HomePage(),
            ReportsPage(),
            DemoPage(),
            PriceListPage(),
            InfoPage(),
          ],
        ),
      ),
    );
  }
}
