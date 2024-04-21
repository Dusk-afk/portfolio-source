import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
        final screenSize = MediaQuery.of(Global.rootContext).size;
        Offset position = Offset(
          screenSize.width / 2 - event.window.size.width / 2,
          screenSize.height / 2 - event.window.size.height / 2,
        );
        final windows = List<Window>.from(state.windows)
          ..add(event.window.copyWith(position: position));
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
      windows.add(
          event.window.copyWith(position: event.position, maximized: false));
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

      final windows = List<Window>.from(state.windows);
      windows.removeAt(index);
      windows.add(event.window.copyWith(
        maximized: !event.window.maximized,
      ));
      emit(WindowStateSafe(windows));
    });

    on<WindowScreenSizeChanged>((event, emit) {
      final windows = state.windows.map((window) {
        if (window.position.dx + window.size.width > event.to.width ||
            window.position.dy + window.size.height > event.to.height) {
          Offset diff = (event.from - event.to) as Offset;
          diff = Offset(
            diff.dx.clamp(0, double.infinity),
            diff.dy.clamp(0, double.infinity),
          );
          Offset position = window.position - diff;
          position = Offset(
            position.dx.clamp(0.0, double.infinity),
            position.dy.clamp(0.0, double.infinity),
          );

          return window.copyWith(
            position: position,
          );
        }
        return window;
      }).toList();
      emit(WindowStateSafe(windows));
    });
  }
}
