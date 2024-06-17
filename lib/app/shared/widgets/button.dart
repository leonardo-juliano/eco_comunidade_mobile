import 'package:flutter/material.dart';
import 'package:project_firebase/app/shared/theme/app_theme.dart';

class Button extends StatelessWidget {
  Button({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: 10
    , vertical: 15),
  });

  final String text;
  final Function onPressed;
  final Color color;
  final AppTheme appTheme = AppTheme();
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
        child: TextButton.icon(
          onPressed: () => onPressed(),
          label:
              Text(text, style: TextStyle(fontSize: 20, color: appTheme.white)),
          style: TextButton.styleFrom(
            backgroundColor: color,
            padding:padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          ),
        ));
  }
}
