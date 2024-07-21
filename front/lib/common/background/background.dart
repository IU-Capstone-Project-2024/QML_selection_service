import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SvgPicture.asset(
        'assets/background.svg',
        fit: BoxFit.cover,
      ),
    );
  }
}
