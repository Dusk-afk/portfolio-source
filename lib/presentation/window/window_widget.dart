import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/window/window_bloc.dart';
import 'package:portfolio/data/colors.dart';
import 'package:portfolio/data/constants.dart';
import 'package:portfolio/models/window/window.dart';
import 'package:portfolio/presentation/background/background.dart';
import 'package:portfolio/provider/screen_provider.dart';

double titleBarHeight = 30;

class WindowWidget extends StatefulWidget {
  final Window window;
  const WindowWidget({super.key, required this.window});

  @override
  State<WindowWidget> createState() => _WindowWidgetState();
}

class _WindowWidgetState extends State<WindowWidget> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = context.watch<ScreenProvider>().isMobile;
    titleBarHeight = isMobile ? 50 : 30;

    return Listener(
      onPointerDown: (_) {
        context.read<WindowBloc>().add(FocusWindow(widget.window));
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Background.window(),
            ),
          ),
          Container(
            width: isMobile || widget.window.maximized
                ? MediaQuery.of(context).size.width
                : widget.window.size.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 32, 29, 44).withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 5,
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
                  child: SizedBox(
                    height: (isMobile || widget.window.maximized
                            ? MediaQuery.of(context).size.height -
                                kMenuBarHeight -
                                2
                            : widget.window.size.height) -
                        titleBarHeight,
                    child: SingleChildScrollView(child: widget.window.child),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: _BottomRightAnchor(
                window: widget.window,
              )),
        ],
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
    bool isMobile = context.watch<ScreenProvider>().isMobile;

    return Listener(
      onPointerDown: (event) {
        _mouseOffset = widget.window.maximized
            ? Offset(widget.window.size.width / 2, event.localPosition.dy)
            : event.localPosition;
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
            MediaQuery.of(context).size.height - titleBarHeight,
          ),
        );
        position -= const Offset(0, kMenuBarHeight);
        context.read<WindowBloc>().add(MoveWindow(widget.window, position));
      },
      onPointerUp: (event) {
        if (event.position.dy < kMenuBarHeight + 10) {
          context.read<WindowBloc>().add(MaximizeWindow(widget.window));
        }
      },
      child: Container(
        height: titleBarHeight,
        decoration: BoxDecoration(
          color: TColors.white.withOpacity(0.05),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 16,
              top: 0,
              bottom: 0,
              right: 0,
              child: Row(
                children: [
                  if (!isMobile) ...[
                    _Button(
                        color: TColors.pink,
                        onPressed: () {
                          context
                              .read<WindowBloc>()
                              .add(CloseWindow(widget.window));
                        }),
                    _Button(
                        color: TColors.yellow,
                        onPressed: () {
                          context
                              .read<WindowBloc>()
                              .add(MinimizeWindow(widget.window));
                        }),
                    _Button(
                        color: TColors.green,
                        onPressed: () {
                          context
                              .read<WindowBloc>()
                              .add(MaximizeWindow(widget.window));
                        }),
                  ],
                  if (isMobile) _backButton(),
                  Expanded(
                    child: GestureDetector(
                      onDoubleTap: () {
                        context
                            .read<WindowBloc>()
                            .add(MaximizeWindow(widget.window));
                      },
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: GestureDetector(
                onDoubleTap: () {
                  context.read<WindowBloc>().add(MaximizeWindow(widget.window));
                },
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return GestureDetector(
      onTap: () {
        context.read<WindowBloc>().add(CloseWindow(widget.window));
      },
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          context.read<WindowBloc>().add(CloseWindow(widget.window));
        },
      ),
    );
  }
}

class _Button extends StatefulWidget {
  final Color color;
  final VoidCallback onPressed;

  const _Button({required this.color, required this.onPressed});

  @override
  State<_Button> createState() => __ButtonState();
}

class __ButtonState extends State<_Button> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.watch<ScreenProvider>().isMobile;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: isMobile ? 22 : 14,
          height: isMobile ? 22 : 14,
          margin: EdgeInsets.only(right: isMobile ? 12 : 8),
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
          child: _hovered
              ? Center(
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class _BottomRightAnchor extends StatefulWidget {
  final Window window;
  const _BottomRightAnchor({
    required this.window,
  });

  @override
  State<_BottomRightAnchor> createState() => _BottomRightAnchorState();
}

class _BottomRightAnchorState extends State<_BottomRightAnchor> {
  Offset _dragStart = const Offset(0, 0);
  Size _startSize = const Size(0, 0);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        _dragStart = event.position;
        _startSize = widget.window.size;
      },
      onPointerMove: (event) {
        Offset finalPosition = event.position;
        Offset diff = (finalPosition - _dragStart);
        Size newSize = _startSize + diff;
        newSize = Size(
          newSize.width.clamp(200, MediaQuery.of(context).size.width),
          newSize.height.clamp(
            200,
            MediaQuery.of(context).size.height - kMenuBarHeight - 2,
          ),
        );

        context.read<WindowBloc>().add(ResizeWindow(widget.window, newSize));
      },
      child: const MouseRegion(
        cursor: SystemMouseCursors.resizeUpLeftDownRight,
        child: SizedBox(
          width: 10,
          height: 10,
        ),
      ),
    );
  }
}
