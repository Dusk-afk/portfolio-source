import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/window/window_bloc.dart';
import 'package:portfolio/models/window/window.dart';

class Dock extends StatelessWidget {
  const Dock({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF00274d),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const _DockItems(),
        ),
        const Spacer(),
      ],
    );
  }
}

class _DockItems extends StatelessWidget {
  const _DockItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WindowBloc, WindowState>(
      builder: (context, state) {
        return Row(
          children: state.windows.map((Window window) {
            return GestureDetector(
              onTap: () {
                context.read<WindowBloc>().add(FocusWindow(window));
              },
              child: Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
