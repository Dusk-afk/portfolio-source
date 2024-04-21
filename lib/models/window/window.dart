import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Window extends Equatable {
  final String title;
  final Widget child;
  final Offset position;
  final bool hidden;

  const Window({
    required this.title,
    required this.child,
    this.position = const Offset(0, 0),
    this.hidden = false,
  });

  @override
  List<Object> get props => [title, child, position, hidden];

  Window copyWith({
    String? title,
    Widget? child,
    Offset? position,
    bool? hidden,
  }) {
    return Window(
      title: title ?? this.title,
      child: child ?? this.child,
      position: position ?? this.position,
      hidden: hidden ?? this.hidden,
    );
  }
}
