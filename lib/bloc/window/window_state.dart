part of 'window_bloc.dart';

sealed class WindowState extends Equatable {
  final List<Window> windows;

  const WindowState(this.windows);

  @override
  List<Object> get props => [windows];
}

final class WindowInitial extends WindowState {
  WindowInitial() : super([]);
}

final class WindowStateSafe extends WindowState {
  const WindowStateSafe(super.windows);
}
