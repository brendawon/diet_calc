import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent(
      {required IconData this.icon,
      this.iconColor,
      required this.subtitle,
      this.subtitleStyle});

  final icon;
  final Color? iconColor;
  final subtitle;
  final subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          // color: Color(0xFF686F7A),
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          subtitle,
          style: subtitleStyle,
        ),
      ],
    );
  }
}
