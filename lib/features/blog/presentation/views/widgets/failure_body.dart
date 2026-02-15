import 'package:flutter/material.dart';

class FailureBody extends StatelessWidget {
  const FailureBody({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errMessage));
  }
}
