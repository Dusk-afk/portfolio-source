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
              role: "Flutter Developer Intern",
              company: "UrbanMatch",
              date: "Jul 2024 - Present",
              companyDescription:
                  "UrbanMatch is the ultimate matchmaking app designed to help you find your perfect partner",
              achievements: [
                "Recreated 80% of the app’s screens while transitioning from Flutter 2 to Flutter 3, reducing app bundle size by 23% (113.5 MB to 86.9 MB)",
                "Established a fully responsive design ensuring 100% compatibility across all mobile displays, enhancing user experience on various devices",
                "Integrated payments through 3 gateways (Apple Pay, Razorpay, PayPal) using Flutter and Django for seamless transaction",
                "Implemented OAuth sign-in functionality with Google and Apple, increasing user sign-up efficiency by 30% and improving user retention",
              ],
            ),
            SizedBox(height: 20),
            _Section(
              role: "Software Developer Intern",
              company: "Synmiles Technologies Pvt Ltd",
              date: "Mar 2022 - Nov 2022 (9 Months)",
              companyDescription:
                  "Synmiles is a technology company that undertakes various projects to provide assistance to others.",
              achievements: [
                "Built and maintained a cross-platform mobile app using Flutter, scaling it to over 1,000 users on both Android and iOS platforms",
                "Engineered a push notification system using WebSockets, increasing user retention by 28%",
                "Optimized network calls from the app, improving app performance by 16%, resulting in faster load times",
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
