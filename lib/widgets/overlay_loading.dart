import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CircularProgressIndicator(),
            ),
            SizedBox(height: 12),
            Text(
              'Please Wait...',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );
}
