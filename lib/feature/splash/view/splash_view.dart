import 'package:flutter/material.dart';
import 'package:market/core/extensions/context_extansion.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.mainAppColor,
      body: Center(
        child: Text(
          'Welcome Market',
          style: context.normalTextStyle.copyWith(color: context.appWhite, fontSize: 32),
        ),
      ),
    );
  }
}
