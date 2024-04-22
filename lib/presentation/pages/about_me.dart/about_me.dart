import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/data/colors.dart';
import 'package:portfolio/provider/screen_provider.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = context.watch<ScreenProvider>().isMobile;

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        isMobile = true;
      } else {
        isMobile = false;
      }
      return Container(
        constraints: const BoxConstraints(
          maxWidth: 800,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    if (isMobile)
                      SizedBox(
                        width: 200,
                        child: _me(),
                      ),
                    const SizedBox(height: 20),
                    const Text(
                      "about me",
                      style: TextStyle(
                        fontFamily: "JetBrains",
                        fontSize: 40,
                        color: TColors.pink,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "I'm a student pursuing a Bachelor of Technology (B.Tech) in Computer Science and Engineering. I have a passion for creating software that is both beautiful and functional. I have experience in web development, mobile development, and desktop development. I'm always looking for new opportunities to learn and grow.",
                      style: TextStyle(
                        fontFamily: "JetBrains",
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "On the backend, I'm skilled in building RESTful APIs, implementing continuous integration and delivery pipelines, and deploying applications to the cloud.",
                      style: TextStyle(
                        fontFamily: "JetBrains",
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "I love programming, coffee, gaming and everything in-between.",
                      style: TextStyle(
                        fontFamily: "JetBrains",
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "stack",
                      style: TextStyle(
                        fontFamily: "JetBrains",
                        fontSize: 24,
                        color: TColors.pink,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1e1e2e),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontFamily: "JetBrains",
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: "1\t\t\t",
                              style: TextStyle(color: TColors.grey),
                            ),
                            TextSpan(
                              text: "<stack>\n",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "2\t\t\t",
                              style: TextStyle(color: TColors.grey),
                            ),
                            TextSpan(
                              text: "\t\t<",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "flutter",
                              style: TextStyle(color: TColors.blue),
                            ),
                            TextSpan(
                              text: ">\n",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "3\t\t\t",
                              style: TextStyle(color: TColors.grey),
                            ),
                            TextSpan(
                              text: "\t\t<",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "dart",
                              style: TextStyle(color: TColors.green),
                            ),
                            TextSpan(
                              text: ">\n",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "4\t\t\t",
                              style: TextStyle(color: TColors.grey),
                            ),
                            TextSpan(
                              text: "\t\t<",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "flask",
                              style: TextStyle(color: TColors.yellow),
                            ),
                            TextSpan(
                              text: ">\n",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "5\t\t\t",
                              style: TextStyle(color: TColors.grey),
                            ),
                            TextSpan(
                              text: "\t\t<",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "python",
                              style: TextStyle(color: TColors.pink),
                            ),
                            TextSpan(
                              text: ">\n",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "6\t\t\t",
                              style: TextStyle(color: TColors.grey),
                            ),
                            TextSpan(
                              text: "\t\t<",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "react",
                              style: TextStyle(color: TColors.blue),
                            ),
                            TextSpan(
                              text: ">\n",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "7\t\t\t",
                              style: TextStyle(color: TColors.grey),
                            ),
                            TextSpan(
                              text: "\t\t<",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "ts/js",
                              style: TextStyle(color: TColors.green),
                            ),
                            TextSpan(
                              text: ">\n",
                              style: TextStyle(color: TColors.white),
                            ),
                            TextSpan(
                              text: "8\t\t\t",
                              style: TextStyle(color: TColors.grey),
                            ),
                            TextSpan(
                              text: "<and more...>",
                              style: TextStyle(color: TColors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            if (!isMobile)
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _me(),
                ),
              ),
            const SizedBox(width: 20),
          ],
        ),
      );
    });
  }

  Widget _me() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset("assets/me.jpeg"),
    );
  }
}
