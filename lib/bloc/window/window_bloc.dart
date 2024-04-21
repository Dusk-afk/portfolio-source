import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/data/constants.dart';
import 'package:portfolio/data/global.dart';
import 'package:portfolio/models/window/window.dart';

part 'window_event.dart';
part 'window_state.dart';

class WindowBloc extends Bloc<WindowEvent, WindowState> {
  WindowBloc() : super(WindowInitial()) {
    on<AddWindow>((event, emit) {
      int index = state.windows
          .indexWhere((widget) => widget.title == event.window.title);
      if (index != -1) {
        add(FocusWindow(state.windows[index]));
      } else {
        final windows = List<Window>.from(state.windows)
          ..add(event.window.copyWith(position: const Offset(20, 20)));
        emit(WindowStateSafe(windows));
      }
    });

    on<FocusWindow>((event, emit) {
      final windows = List<Window>.from(state.windows)..remove(event.window);
      windows.add(event.window.copyWith(hidden: false));
      emit(WindowStateSafe(windows));
    });

    on<MoveWindow>((event, emit) {
      int index = state.windows.indexOf(event.window);
      if (index == -1) return;
      final windows = List<Window>.from(state.windows);
      windows.removeAt(index);
      windows.add(event.window.copyWith(position: event.position));
      emit(WindowStateSafe(windows));
    });

    on<CloseWindow>((event, emit) {
      final windows = List<Window>.from(state.windows)..remove(event.window);
      emit(WindowStateSafe(windows));
    });

    on<MinimizeWindow>((event, emit) {
      final windows = List<Window>.from(state.windows)
        ..remove(event.window)
        ..add(event.window.copyWith(hidden: true));
      emit(WindowStateSafe(windows));
    });

    on<ResizeWindow>((event, emit) {
      int index = state.windows.indexOf(event.window);
      if (index == -1) return;
      final windows = List<Window>.from(state.windows);
      windows.removeAt(index);
      windows.add(event.window.copyWith(size: event.size));
      emit(WindowStateSafe(windows));
    });

    on<MaximizeWindow>((event, emit) {
      int index = state.windows.indexOf(event.window);
      if (index == -1) return;

      Size screenSize = MediaQuery.of(Global.rootContext).size;
      screenSize = Size(screenSize.width, screenSize.height - kMenuBarHeight);

      final windows = List<Window>.from(state.windows);
      windows.removeAt(index);
      windows.add(event.window.copyWith(
        position: Offset.zero,
        size: screenSize,
      ));
      emit(WindowStateSafe(windows));
    });
  }
}
