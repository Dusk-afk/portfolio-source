import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Window extends Equatable {
  final String title;
  final Widget child;
  final Offset position;
  final Size size;
  final bool hidden;
  final bool maximized;

  const Window({
    required this.title,
    required this.child,
    this.position = const Offset(0, 0),
    this.size = const Size(800, 600),
    this.hidden = false,
    this.maximized = false,
  });

  @override
  List<Object> get props => [title, child, position, size, hidden, maximized];

  Window copyWith({
    String? title,
    Widget? child,
    Offset? position,
    Size? size,
    bool? hidden,
    bool? maximized,
  }) {
    return Window(
      title: title ?? this.title,
      child: child ?? this.child,
      position: position ?? this.position,
      size: size ?? this.size,
      hidden: hidden ?? this.hidden,
      maximized: maximized ?? this.maximized,
    );
  }
}
