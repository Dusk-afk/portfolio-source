import 'package:flutter/material.dart';

class Dock extends StatelessWidget {
  const Dock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF00274d),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
