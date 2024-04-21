import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class MenuBarTime extends StatefulWidget {
  const MenuBarTime({super.key});

  @override
  State<MenuBarTime> createState() => _MenuBarTimeState();
}

class _MenuBarTimeState extends State<MenuBarTime> {
  late Timer _timer;
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String hour = (_dateTime.hour % 12).toString().padLeft(2, '0');
    String minute = _dateTime.minute.toString().padLeft(2, '0');
    String period = _dateTime.hour < 12 ? "AM" : "PM";

    return RichText(
      text: TextSpan(
        style: const TextStyle(fontFamily: "JetBrains"),
        children: [
          TextSpan(
            text: formatDate(
              _dateTime,
              [D, ', ', M, ' ', d, ' • '],
            ),
          ),
          TextSpan(
            text: hour,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: ":",
            style: TextStyle(
              color:
                  _dateTime.second.isEven ? Colors.white : Colors.transparent,
            ),
          ),
          TextSpan(
            text: "$minute $period",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
