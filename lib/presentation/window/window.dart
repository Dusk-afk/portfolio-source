import 'package:flutter/material.dart';

class Window extends StatelessWidget {
  final Widget child;
  const Window({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      left: 50,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            const _TitleBar(),
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
              child: Container(
                color: Colors.white,
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleBar extends StatelessWidget {
  const _TitleBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          _buildButton(color: Colors.red, onPressed: () {}),
          _buildButton(color: Colors.yellow, onPressed: () {}),
          _buildButton(color: Colors.green, onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildButton({
    required Color color,
    VoidCallback? onPressed,
  }) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
