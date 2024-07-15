import 'package:flutter/material.dart';
import 'package:front/features/demo/presentation/demo_page.dart';
import 'package:front/features/home/presentation/home_page.dart';
import 'package:front/features/info/presentation/info_page.dart';
import 'package:front/features/price_list/presentation/price_list_page.dart';
import '../../reports/presentation/reports_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  NavigationState createState() => NavigationState();
}

class NavigationState extends State<Navigation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void moveToSecondTab() {
    _tabController.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: const [
              Tab(text: 'Home'),
              Tab(text: 'Reports'),
              Tab(text: 'Demo'),
              Tab(text: 'Price list'),
              Tab(text: 'Info'),
            ],
          ),
          toolbarHeight: 0,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomePage(
              controller: _tabController,
            ),
            const ReportsPage(),
            const DemoPage(),
            const PriceListPage(),
            const InfoPage(),
          ],
        ),
      ),
    );
  }
}
