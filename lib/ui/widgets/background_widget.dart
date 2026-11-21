import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/ui/utility/assest_paths.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child,});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssestPaths.backgroundSVG,
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          child
        ],
      ),
    );
  }
}
