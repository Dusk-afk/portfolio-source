import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/colors.dart';

class Background extends StatelessWidget {
  Background({super.key})
      : circles = [
          Positioned(
            top: 100,
            bottom: 100,
            right: 0,
            child: _Circle(size: 600, color: TColors.white.withOpacity(0.1)),
          ),
          Positioned(
            top: -100,
            left: -100,
            child: _Circle(size: 600, color: TColors.pink.withOpacity(0.15)),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: _Circle(size: 600, color: TColors.green.withOpacity(0.15)),
          ),
        ];

  Background.window({super.key})
      : circles = [
          Positioned(
            top: 100,
            bottom: 100,
            right: 0,
            child: _Circle(size: 300, color: TColors.white.withOpacity(0.05)),
          ),
          Positioned(
            top: -100,
            left: -100,
            child: _Circle(size: 300, color: TColors.pink.withOpacity(0.1)),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: _Circle(size: 300, color: TColors.green.withOpacity(0.1)),
          ),
        ];

  final List<Widget> circles;

  @override
  Widget build(BuildContext context) {
    return Blur(
      blur: 100,
      blurColor: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: const Color.fromARGB(255, 0, 1, 24),
            ),
          ),
          ...circles,
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  final double size;
  final Color color;
  const _Circle({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
