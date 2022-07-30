import 'package:flutter/material.dart';

class PartialDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider (
      thickness: 1,
      color: Color(0xFF151517),
      indent: 20.0,
      endIndent: 0.0,
      height: 0,
    );
  }
}