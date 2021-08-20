import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final id;
  DetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(id),
      ),
    );
  }
}
