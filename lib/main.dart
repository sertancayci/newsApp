import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/constants/string_constants.dart';
import 'package:news_app/feature/auth/authentication_view.dart';
import 'package:news_app/feature/home/home_%20view.dart';
import 'package:news_app/feature/splash/splash_view.dart';
import 'package:news_app/firebase_options.dart';
import 'package:news_app/initiallize/application_start.dart';
import 'package:news_app/initiallize/basic_app_theme.dart';


Future<void> main() async {

  await ApplicationStart.init();

  runApp(ProviderScope(child: MyApp()));
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appName,
      home: AuthenticationView(),
      theme: AppTheme(context).theme,
    );
  }
}
