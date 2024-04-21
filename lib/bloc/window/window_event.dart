part of 'window_bloc.dart';

sealed class WindowEvent extends Equatable {
  const WindowEvent();

  @override
  List<Object> get props => [];
}

class AddWindow extends WindowEvent {
  final Window window;

  const AddWindow(this.window);

  @override
  List<Object> get props => [window];
}

class FocusWindow extends WindowEvent {
  final Window window;

  const FocusWindow(this.window);

  @override
  List<Object> get props => [window];
}

class MoveWindow extends WindowEvent {
  final Window window;
  final Offset position;

  const MoveWindow(this.window, this.position);

  @override
  List<Object> get props => [position, window];
}

class CloseWindow extends WindowEvent {
  final Window window;

  const CloseWindow(this.window);

  @override
  List<Object> get props => [window];
}

class MinimizeWindow extends WindowEvent {
  final Window window;

  const MinimizeWindow(this.window);

  @override
  List<Object> get props => [window];
}

class ResizeWindow extends WindowEvent {
  final Window window;
  final Size size;

  const ResizeWindow(this.window, this.size);

  @override
  List<Object> get props => [size, window];
}

class MaximizeWindow extends WindowEvent {
  final Window window;

  const MaximizeWindow(this.window);

  @override
  List<Object> get props => [window];
}
