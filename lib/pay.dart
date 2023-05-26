import 'package:flutter/material.dart';

class PayScreen extends StatelessWidget {
  PayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container();
        },
      ),
    );
  }
}
