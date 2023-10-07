import 'package:flutter/material.dart';

enum IconConstants {
  microphone('microphone'),
  appIcon('app_logo'),
  ;

  final String _iconName;
  const IconConstants(this._iconName);

  String get toPng => 'assets/icon/$_iconName.png';
  Image get toImage => Image.asset(toPng);
}
