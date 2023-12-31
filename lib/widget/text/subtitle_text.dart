import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/constants/string_constants.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({Key? key, required this.value, this.color}) : super(key: key);

  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: context.textTheme.titleMedium?.copyWith(
        color: color,
      ),
    );
  }
}
