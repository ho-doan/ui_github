import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: 'Opp',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        TextSpan(
          text: '!',
          style: TextStyle(
            color: Colors.redAccent,
          ),
        ),
      ])),
    );
  }
}
