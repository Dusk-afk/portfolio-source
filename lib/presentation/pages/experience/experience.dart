import 'package:flutter/material.dart';
import 'package:portfolio/data/colors.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            "experience",
            style: TextStyle(
              fontFamily: "JetBrains",
              fontSize: 40,
              color: TColors.yellow,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "I'm a software engineer based in the Philippines. I have a passion for creating software that is both beautiful and functional. I have experience in web development, mobile development, and desktop development. I'm always looking for new opportunities to learn and grow.",
            style: TextStyle(
              fontFamily: "JetBrains",
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
