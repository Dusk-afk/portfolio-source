import 'package:flutter/material.dart';
import 'package:portfolio/data/colors.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 800,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "experience",
              style: TextStyle(
                fontFamily: "JetBrains",
                fontSize: 40,
                color: TColors.yellow,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "My experience has equipped me with a solid understanding of Flutter, allowing me to create complex UI designs and animations effectively. Furthermore, my backend knowledge complements my skills in Flutter development, enabling me to develop efficient and integrated solutions.",
              style: TextStyle(
                fontFamily: "JetBrains",
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            _Section(
              role: "SDE",
              company: "Synmiles Technologies Pvt Ltd",
              date: "Mar 2022 - Nov 2022 (9 Months)",
              companyDescription:
                  "Synmiles is a technology company that undertakes various projects to provide assistance to others.",
              achievements: [
                "Excelled as a Flutter Developer, contributing to the seamless development of mobile applications.",
                "Successfully conceived, developed, and deployed a cross-platform app, ensuring its availability on both Android and iOS platforms.",
                "Implemented innovative solutions that significantly improved app performance or user experience.",
                "Acquired foundational backend development skills, bridging the gap between frontend and backend to create comprehensive and integrated solutions.",
              ],
            ),
            SizedBox(height: 20),
            _Section(
              role: "SDE - Intern",
              company: "Autocomp Mechatronix",
              date: "Jan 2022 - Mar 2022 (3 Months)",
              companyDescription: "Technical consultancy company",
              achievements: [
                "Worked on a Flutter-based e-commerce app and optimising user interfaces for multi-platform functionality.",
                "Contributed significantly to the development of a web-based CRM application, streamlining user interactions and enhancing data management.",
                "Collaborated on debugging sessions, addressing technical challenges alongside senior developers to enhance software stability.",
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String role;
  final String company;
  final String date;
  final String companyDescription;
  final List<String> achievements;

  const _Section({
    super.key,
    required this.role,
    required this.company,
    required this.date,
    required this.companyDescription,
    required this.achievements,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          role,
          style: const TextStyle(
            fontFamily: "JetBrains",
            fontSize: 24,
            color: TColors.pink,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          company,
          style: const TextStyle(
            fontFamily: "JetBrains",
            fontSize: 16,
            color: TColors.green,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          date,
          style: const TextStyle(
            fontFamily: "JetBrains",
            fontSize: 16,
            color: TColors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          companyDescription,
          style: const TextStyle(
            fontFamily: "JetBrains",
            fontSize: 16,
            color: TColors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 10),
        for (final achievement in achievements)
          Text(
            "• $achievement",
            style: const TextStyle(
              fontFamily: "JetBrains",
              fontSize: 16,
              color: TColors.white,
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}
