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
            height: 50,
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
    );
  }
}

class _TryButton extends StatelessWidget {
  const _TryButton({required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        moveToThirdTab();
      },
      child: const Text('Try'),
    );
  }

  void moveToThirdTab() {
    tabController.animateTo(2);
  }
}
