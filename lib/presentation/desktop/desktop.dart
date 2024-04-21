import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/window/window_bloc.dart';
import 'package:portfolio/models/window/window.dart';

int i = 0;

class Desktop extends StatelessWidget {
  const Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF001427),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
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
                        style: TextStyle(color: Colors.yellow),
                      ),
                      TextSpan(
                        text: "m James John",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(
                        text: ".",
                        style: TextStyle(color: Colors.pink),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 18,
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
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: "The world is better with my code in it.",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.read<WindowBloc>().add(AddWindow(
                          Window(
                            title: "${++i}",
                            child: Placeholder(),
                          ),
                        ));
                  },
                  child: Text("A"),
                ),
              ],
            ),
          ),
          const Spacer(flex: 3)
        ],
      ),
    );
  }
}
