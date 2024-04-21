import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/window/window_bloc.dart';
import 'package:portfolio/presentation/desktop/desktop.dart';
import 'package:portfolio/presentation/dock/dock.dart';
import 'package:portfolio/presentation/menu_bar/menu_bar.dart';
import 'package:portfolio/presentation/window/window_canvas.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WindowBloc>(
          create: (_) => WindowBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "JetBrains",
        ),
        home: const Scaffold(
          body: Column(
            children: [
              CustomMenuBar(),
              Expanded(
                child: Stack(
                  children: [
                    Desktop(),
                    WindowCanvas(),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Dock(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
