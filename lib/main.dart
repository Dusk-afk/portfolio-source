import 'package:flutter/material.dart';
import 'package:portfolio/models/window/window.dart';
import 'package:portfolio/presentation/desktop/desktop.dart';
import 'package:portfolio/presentation/dock/dock.dart';
import 'package:portfolio/presentation/window/window_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Desktop(),
            WindowWidget(
              window: Window(
                title: "title",
                child: SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                      "Hello World",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Dock(),
            ),
          ],
        ),
      ),
    );
  }
}
