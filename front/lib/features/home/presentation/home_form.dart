import 'package:flutter/material.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({super.key, required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          _Description(),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Read the instruction and try our app',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          _TryButton(
            tabController: controller,
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 500,
      color: Colors.white.withOpacity(0.3),
      child: const Center(
        child: Column(
          children: [
            Text(
              'Description',
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}

class _TryButton extends StatelessWidget {
  const _TryButton({required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(const Size(200, 50)),
      ),
      onPressed: () {
        moveToThirdTab();
      },
      child: const Text(
        'Try',
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  void moveToThirdTab() {
    tabController.animateTo(2);
  }
}
