import 'package:flutter/material.dart';

class LocalErrorWidget extends StatelessWidget {
  const LocalErrorWidget({Key? key, required this.errorText}) : super(key: key);
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorText, textAlign: TextAlign.center),
    );
  }
}
