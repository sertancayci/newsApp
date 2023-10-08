import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:news_app/constants/image_constants.dart';
import 'package:news_app/constants/string_constants.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/feature/home/home_%20view.dart';
import 'package:news_app/feature/splash/splash_provider.dart';
import 'package:news_app/feature/splash/splash_provider.dart';
import 'package:news_app/widget/text/wavy_text.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {

  final splashProvider = StateNotifierProvider<SplashProvider, SplashState>((ref) {
    return SplashProvider();
  });

  @override
  void initState() {
    super.initState();
    ref.read(splashProvider.notifier).checkAppVersion(''.version);
  }


  @override
  Widget build(BuildContext context) {
    ref.listen(splashProvider, (previous, next) {
      if (next.isRequiredForceUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }
      if (next.isRedirectHome != null) {
        if(next.isRedirectHome == true) {
          context.navigateToPage(HomeView());
          // Navigator.of(context).pushNamed('/home');
        } else {
          // Navigator.of(context).pushNamed('/onboarding');
        }
      }
    });
    return Scaffold(
      backgroundColor: ColorConstants.purplePrimary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconConstants.appIcon.toImage,

            Padding(
              padding: context.paddingNormal,
              child: const WavyBoldText(title: StringConstants.appName),
            ),
          ],
        ),
      ),
    );
  }
}
