import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/window/window_bloc.dart';
import 'package:portfolio/models/window/window.dart';
import 'package:portfolio/presentation/window/window_widget.dart';

class WindowCanvas extends StatelessWidget {
  const WindowCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WindowBloc, WindowState>(
      builder: (context, state) {
        return Stack(
          children: state.windows
              .where((widget) => !widget.hidden)
              .map((Window window) {
            return Positioned(
              key: ValueKey(window.title),
              left: window.position.dx,
              top: window.position.dy,
              child: WindowWidget(window: window),
            );
          }).toList(),
        );
      },
    );
  }
}
