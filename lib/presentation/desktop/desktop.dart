import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/window/window_bloc.dart';
import 'package:portfolio/data/colors.dart';
import 'package:portfolio/models/window/window.dart';
import 'package:portfolio/presentation/pages/about_me.dart/about_me.dart';
import 'package:portfolio/presentation/pages/contact/contact.dart';
import 'package:portfolio/presentation/pages/experience/experience.dart';
import 'package:portfolio/presentation/pages/projects/projects.dart';

int i = 0;

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: TColors.primary,
      child: ListView(
        children: [
          Row(
            children: [
              const SizedBox(width: 40),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: "JetBrains",
                          fontSize: 52,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: "I",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: "'",
                            style: TextStyle(color: TColors.yellow),
                          ),
                          TextSpan(
                            text: "m Piyush Kumar",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: ".",
                            style: TextStyle(color: TColors.pink),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "JetBrains",
                        ),
                        children: [
                          TextSpan(
                            text: "I'm a Flutter Developer specializing"
                                " in building beautiful and high-performance"
                                " mobile applications. Currently, I'm"
                                " working on building a portfolio website"
                                " to showcase my work.",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "JetBrains",
                        ),
                        children: [
                          TextSpan(
                            text: "The world is better with my code in it.",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      "// Quick Links",
                      style: TextStyle(
                        color: Color.fromARGB(255, 112, 112, 112),
                        fontSize: 16,
                        fontFamily: "JetBrains",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _QuickLink(
                                title: "About Me",
                                color: TColors.pink,
                                onPressed: () {
                                  context.read<WindowBloc>().add(
                                        const AddWindow(
                                          Window(
                                            title: "About Me",
                                            child: AboutMe(),
                                          ),
                                        ),
                                      );
                                },
                              ),
                              const SizedBox(height: 20),
                              _QuickLink(
                                title: "Experience",
                                color: TColors.yellow,
                                onPressed: () {
                                  context.read<WindowBloc>().add(
                                        const AddWindow(
                                          Window(
                                            title: "Experience",
                                            child: Experience(),
                                          ),
                                        ),
                                      );
                                },
                              ),
                              const SizedBox(height: 20),
                              _QuickLink(
                                title: "Projects",
                                color: TColors.green,
                                onPressed: () {
                                  context.read<WindowBloc>().add(
                                        const AddWindow(
                                          Window(
                                            title: "Projects",
                                            child: Projects(),
                                          ),
                                        ),
                                      );
                                },
                              ),
                              const SizedBox(height: 20),
                              _QuickLink(
                                title: "Contact",
                                color: TColors.blue,
                                onPressed: () {
                                  context.read<WindowBloc>().add(
                                        const AddWindow(
                                          Window(
                                            title: "Contact",
                                            child: Contact(),
                                          ),
                                        ),
                                      );
                                },
                              ),
                            ],
                          ),
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              const Spacer(flex: 3)
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickLink extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  const _QuickLink({
    super.key,
    required this.title,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith(getBackgroundColor),
        foregroundColor: WidgetStateProperty.resolveWith(getForegroundColor),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 20),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: "JetBrains",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color getBackgroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return TColors.white;
    } else {
      return color;
    }
  }

  Color getForegroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return color;
    } else {
      return TColors.white;
    }
  }
}

class _Section extends StatelessWidget {
  final String number;
  final String title;
  final String content;
  final Color color;

  const _Section({
    super.key,
    required this.number,
    required this.title,
    required this.content,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontFamily: "JetBrains",
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "JetBrains",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: "JetBrains",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
