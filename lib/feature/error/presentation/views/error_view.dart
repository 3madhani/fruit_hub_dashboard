import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Error 404: Page Not Found',
          style: TextStyle(fontSize: 18, color: Colors.red),
        ),
      ),
    );
  }
}
