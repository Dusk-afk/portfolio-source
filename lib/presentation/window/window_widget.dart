import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/window/window_bloc.dart';
import 'package:portfolio/data/colors.dart';
import 'package:portfolio/data/constants.dart';
import 'package:portfolio/models/window/window.dart';

class WindowWidget extends StatefulWidget {
  final Window window;
  const WindowWidget({super.key, required this.window});

  @override
  State<WindowWidget> createState() => _WindowWidgetState();
}

class _WindowWidgetState extends State<WindowWidget> {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        context.read<WindowBloc>().add(FocusWindow(widget.window));
      },
      child: Container(
        width: 800,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 32, 29, 44).withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 10,
              offset: const Offset(0, 0),
            )
          ],
        ),
        child: Column(
          children: [
            _TitleBar(
              window: widget.window,
            ),
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
              child: Container(
                color: TColors.primary,
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
  });

  final Window window;

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
            kMenuBarHeight,
            MediaQuery.of(context).size.height - 30,
          ),
        );
        position -= const Offset(0, kMenuBarHeight);
        context.read<WindowBloc>().add(MoveWindow(widget.window, position));
      },
      child: Container(
        height: 30,
        decoration: const BoxDecoration(
          color: TColors.primaryDark,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              child: Row(
                children: [
                  _buildButton(
                      color: TColors.pink,
                      onPressed: () {
                        context
                            .read<WindowBloc>()
                            .add(CloseWindow(widget.window));
                      }),
                  _buildButton(
                      color: TColors.yellow,
                      onPressed: () {
                        context
                            .read<WindowBloc>()
                            .add(MinimizeWindow(widget.window));
                      }),
                  _buildButton(color: TColors.green, onPressed: () {}),
                ],
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Text(
                  widget.window.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "JetBrains",
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 1,
                color: Colors.white,
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
