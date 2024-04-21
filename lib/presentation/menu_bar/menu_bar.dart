import 'package:flutter/material.dart';
import 'package:portfolio/data/colors.dart';
import 'package:portfolio/data/constants.dart';

class CustomMenuBar extends StatelessWidget {
  const CustomMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMenuBarHeight,
      color: TColors.primaryDark,
      child: Row(
        children: [
          const SizedBox(width: 40),
          _buildItem("01.", "about me", TColors.pink),
          const SizedBox(width: 30),
          _buildItem("02.", "experience", TColors.yellow),
          const SizedBox(width: 30),
          _buildItem("03.", "projects", TColors.green),
          const SizedBox(width: 30),
          _buildItem("04.", "contact", TColors.blue),
        ],
      ),
    );
  }

  Widget _buildItem(String first, String second, Color color) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: "JetBrains",
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: first,
            style: TextStyle(
              color: color,
            ),
          ),
          TextSpan(
            text: second,
            style: const TextStyle(
              color: TColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
