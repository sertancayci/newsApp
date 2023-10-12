import 'package:flutter/cupertino.dart';
import 'package:kartal/kartal.dart';
import 'package:news_app/constants/string_constants.dart';

class TitleText extends StatelessWidget {
  const TitleText({Key? key, required this.value}) : super(key: key);

  final String value;
  @override
  Widget build(BuildContext context) {
    return
        Text(
          value,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        );
  }
}
