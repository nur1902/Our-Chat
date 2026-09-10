import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:our_chat/Paths/asset_paths.dart';
class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Expanded(
        child: Stack(
          children: [
            SvgPicture.asset(
                AssetPaths.background,
            fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            child,


            ],
        ),
      ),
    );
  }
}
