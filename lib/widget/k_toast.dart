// Copyright (C) 2021 d1y <chenhonzhou@gmail.com>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

// copy by https://github.com/appdev/FlutterToast

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum ToastGravity {
  bottom,
  center,
  top,
}

class Toast {
  static void show(
    String msg,
    BuildContext context, {
    Duration duration = const Duration(seconds: 1),
    ToastGravity gravity = ToastGravity.bottom,
    Color backgroundColor = const Color(0xAA000000),
    textStyle = const TextStyle(fontSize: 15, color: Colors.white),
    double backgroundRadius = 20,
    bool? rootNavigator,
    Border? border,
  }) {
    ToastView.dismiss();
    ToastView.createView(
      msg,
      context,
      duration,
      gravity,
      backgroundColor,
      textStyle,
      backgroundRadius,
      border,
      rootNavigator,
    );
  }
}

class ToastView {
  static final ToastView _singleton = ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();

  static OverlayState? overlayState;
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void createView(
    String msg,
    BuildContext context,
    Duration duration,
    ToastGravity gravity,
    Color background,
    TextStyle textStyle,
    double backgroundRadius,
    Border? border,
    bool? rootNavigator,
  ) async {
    overlayState = Overlay.of(
      context,
      rootOverlay: rootNavigator ?? false,
    );

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ToastWidget(
        widget: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(backgroundRadius),
                border: border,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: Text(msg, softWrap: true, style: textStyle),
            ),
          ),
        ),
        gravity: gravity,
      ),
    );
    _isVisible = true;
    overlayState!.insert(_overlayEntry!);
    await Future.delayed(duration);
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget extends StatelessWidget {
  const ToastWidget({
    Key? key,
    required this.widget,
    required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final ToastGravity gravity;

  @override
  Widget build(BuildContext context) {
    double? _top =
        gravity == ToastGravity.top ? MediaQuery.of(context).viewInsets.top + 50 : null;

    double? _bottom =
        gravity == ToastGravity.bottom ? MediaQuery.of(context).viewInsets.bottom + 50 : null;

    return Positioned(
      top: _top,
      bottom: _bottom,
      // Fix to: https://github.com/appdev/FlutterToast/issues/18#issue-580337821
      child: IgnorePointer(
        child: Material(
          color: Colors.transparent,
          child: widget,
        ),
      ),
    );
  }
}
