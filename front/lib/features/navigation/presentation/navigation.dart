import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/app/app.dart';
import 'package:front/features/demo/presentation/demo_page.dart';
import 'package:front/features/home/presentation/home_page.dart';
import 'package:front/features/info/presentation/info_page.dart';
import 'package:front/features/price_list/presentation/price_list_page.dart';
import '../../reports/presentation/reports_page.dart';
import 'package:http/http.dart' as http;

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

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

  Future<void> handleLogout(BuildContext context, String id) async {
    final Uri url = Uri.parse('http://localhost:8181/api/auth/logout');

    try {
      // Dispatch the logout event to the AppBloc

      // Make the HTTP POST request
      final response = await http.post(
        url,
        headers: <String, String>{
          'Authorization': 'Bearer $id',
        },
        body: {}, // You can omit this line if no body is needed
      );
      // Check the response status code
      if (response.statusCode == 200) {
        context.read<AppBloc>().add(Logout());
        if (kDebugMode) {
          print('User logged out successfully.');
        }
      } else {
        throw Exception('Failed to log out. Error: ${response.body}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      // Optionally, show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to log out. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          String id = state.id;
          return Scaffold(
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
                  Tab(text: 'Create Report'),
                  Tab(text: 'Price list'),
                  Tab(text: 'Log out'),
                ],
                onTap: (index) {
                  // Handle tab switching here if needed
                  if (index == 4) {
                    handleLogout(
                        context, id); // Logout when "Log out" tab is tapped
                  }
                  if (index == 1) {
                    context.read<AppBloc>().add(DownloadReports(token: id));
                  }
                },
              ),
              toolbarHeight: 0,
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                HomePage(controller: _tabController),
                const ReportsPage(),
                const DemoPage(),
                const PriceListPage(),
                InfoPage(),
              ],
            ),
          );
        },
      ),
    );
  }
}
