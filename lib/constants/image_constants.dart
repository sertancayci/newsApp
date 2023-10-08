import 'package:flutter/material.dart';

enum IconConstants {
  microphone('microphone'),
  appIcon('app_logo'),
  ;

  final String iconName;
  const IconConstants(this.iconName);

  String get toPng => '/assets/icon/$iconName.png';
  Image get toImage => Image.asset(toPng);
}
