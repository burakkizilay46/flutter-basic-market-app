import 'package:flutter/material.dart';
import 'package:market/core/extensions/context_extansion.dart';
import 'package:market/feature/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(),
      child: _SplashContent(),
    );
  }
}

class _SplashContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final splashProvider = Provider.of<SplashProvider>(context);

    splashProvider.startTimer();

    return Scaffold(
      backgroundColor: context.mainAppColor,
      body: Center(
        child: Text(
          '${splashProvider.pageTimeIsDone}',
          style: context.normalTextStyle.copyWith(color: context.appWhite, fontSize: 32),
        ),
      ),
    );
  }
}
