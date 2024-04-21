import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/window/window_bloc.dart';
import 'package:portfolio/data/colors.dart';
import 'package:portfolio/data/global.dart';
import 'package:portfolio/presentation/background/background.dart';
import 'package:portfolio/presentation/desktop/desktop.dart';
import 'package:portfolio/presentation/menu_bar/menu_bar.dart';
import 'package:portfolio/presentation/window/window_canvas.dart';
import 'package:portfolio/provider/screen_provider.dart';
import 'package:provider/provider.dart';

Size? lastScreenSize;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    lastScreenSize ??= MediaQuery.of(context).size;

    return MaterialApp(
      title: "Piyush Kumar",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "JetBrains",
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStateProperty.all(TColors.pink),
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WindowBloc>(
            create: (_) => WindowBloc(),
          ),
          ChangeNotifierProvider(create: (_) => ScreenProvider()),
        ],
        child: Builder(builder: (context) {
          Global.rootContext = context;
          Size screenSize = MediaQuery.of(context).size;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<ScreenProvider>().isMobile = screenSize.width < 800;
          });
          if (lastScreenSize != screenSize) {
            context
                .read<WindowBloc>()
                .add(WindowScreenSizeChanged(lastScreenSize!, screenSize));
            lastScreenSize = screenSize;
          }

          return Scaffold(
            body: Stack(
              children: [
                Background(),
                const Column(
                  children: [
                    CustomMenuBar(),
                    Expanded(
                      child: Stack(
                        children: [
                          Desktop(),
                          WindowCanvas(),
                          // Positioned(
                          //   bottom: 20,
                          //   left: 0,
                          //   right: 0,
                          //   child: Dock(),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
