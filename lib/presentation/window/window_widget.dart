import 'package:flutter/material.dart';
import 'package:portfolio/models/window/window.dart';

class WindowWidget extends StatefulWidget {
  final Window window;
  const WindowWidget({super.key, required this.window});

  @override
  State<WindowWidget> createState() => _WindowWidgetState();
}

class _WindowWidgetState extends State<WindowWidget> {
  Offset _position = const Offset(50, 50);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _position.dy,
      left: _position.dx,
      child: SizedBox(
        width: 400,
        child: Column(
          children: [
            _TitleBar(
              window: widget.window,
              onDrag: (position) {
                setState(() {
                  _position = position;
                });
              },
            ),
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
              child: Container(
                color: Colors.white,
                child: widget.window.child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TitleBar extends StatefulWidget {
  const _TitleBar({
    required this.window,
    required this.onDrag,
  });

  final Window window;
  final void Function(Offset) onDrag;

  @override
  State<_TitleBar> createState() => _TitleBarState();
}

class _TitleBarState extends State<_TitleBar> {
  Offset _mouseOffset = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        _mouseOffset = event.localPosition;
      },
      onPointerMove: (event) {
        Offset position = event.position;
        position -= _mouseOffset;
        position = Offset(
          position.dx.clamp(
            0,
            MediaQuery.of(context).size.width - 100,
          ),
          position.dy.clamp(
            0,
            MediaQuery.of(context).size.height - 30,
          ),
        );
        widget.onDrag(position);
      },
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              child: Row(
                children: [
                  _buildButton(color: Colors.red, onPressed: () {}),
                  _buildButton(color: Colors.yellow, onPressed: () {}),
                  _buildButton(color: Colors.green, onPressed: () {}),
                ],
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(widget.window.title),
              ),
            )
          ],
        ),
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
