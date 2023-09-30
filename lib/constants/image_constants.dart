import 'package:flutter/material.dart';

enum IconConstants {
  microphone('microphone');

  final String _iconName;
  const IconConstants(this._iconName);

  String get toPng => 'assets/icon/$_iconName.png';
}
