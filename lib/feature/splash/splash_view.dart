import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/color_constants.dart';
import 'package:news_app/constants/image_constants.dart';
import 'package:news_app/constants/string_constants.dart';
import 'package:kartal/kartal.dart';

class SplashView extends ConsumerWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IconConstants.appIcon.toImage,

          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20.0,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText(StringConstants.appName,
                    textStyle: context.textTheme.headlineSmall
                        ?.copyWith(color: ColorConstants.white)),
              ],
              isRepeatingAnimation: true,
            ),
          ),
          ],
        ),
      ),
    );
  }
}
