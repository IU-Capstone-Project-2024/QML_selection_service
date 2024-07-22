import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0000FF), Color(0xFFFF0000)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
      /**SvgPicture.asset(
        'assets/background.svg',
        fit: BoxFit.cover,
      ),*/
    );
  }
}
