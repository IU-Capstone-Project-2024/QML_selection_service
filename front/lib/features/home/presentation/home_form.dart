import 'package:flutter/cupertino.dart';
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
            style: TextStyle(fontSize: 20, color: Colors.white),
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
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        border: Border.all(
          color: Colors.blue, // Border color
          width: 2.0, // Border width
        ),
      ),
      child: const Center(
        child: Column(
          children: [
            Text(
              'Description',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Welcome to Quantum Feature Selection Service (QFSS), a pioneering web-based platform designed for feature selection in machine learning classification datasets utilizing the advanced capabilities of quantum annealing. QFS harnesses the power of quantum computing to enhance the accuracy and efficiency of your machine learning models by identifying the most relevant features in your dataset.',
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
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
        minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
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
