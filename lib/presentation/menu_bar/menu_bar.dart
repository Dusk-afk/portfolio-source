import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/window/window_bloc.dart';
import 'package:portfolio/data/colors.dart';
import 'package:portfolio/data/constants.dart';
import 'package:portfolio/models/window/window.dart';
import 'package:portfolio/presentation/menu_bar/menu_bar_time.dart';

class CustomMenuBar extends StatelessWidget {
  const CustomMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WindowBloc, WindowState>(
      builder: (context, state) {
        List<Window> windows =
            state.windows.where((window) => !window.hidden).toList();
        String title = windows.isNotEmpty ? windows.last.title : "Desktop";

        return Container(
          height: kMenuBarHeight,
          color: TColors.white.withOpacity(0.05),
          child: Row(
            children: [
              const SizedBox(width: 40),
              Text(
                title,
                style: const TextStyle(
                  color: TColors.white,
                  fontSize: 14,
                  fontFamily: "JetBrains",
                ),
              ),
              // _buildItem("01.", "about me", TColors.pink),
              // const SizedBox(width: 30),
              // _buildItem("02.", "experience", TColors.yellow),
              // const SizedBox(width: 30),
              // _buildItem("03.", "projects", TColors.green),
              // const SizedBox(width: 30),
              // _buildItem("04.", "contact", TColors.blue),
              const Spacer(),
              const MenuBarTime(),
              const SizedBox(width: 40),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(String first, String second, Color color) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: "JetBrains",
          fontSize: 14,
        ),
        children: [
          TextSpan(
            text: first,
            style: TextStyle(
              color: color,
            ),
          ),
          TextSpan(
            text: second,
            style: const TextStyle(
              color: TColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
