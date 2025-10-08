import 'package:flutter/material.dart';
import 'dart:async';

import '../res/sizing_const.dart';


class Utils {
  static OverlayEntry? _overlayEntry;
  static bool _isShowing = false;

  static void show(String message, BuildContext context, {Color? color}) {
    final overlay = Overlay.of(context);

    if (overlay == null) return;

    if (_isShowing) {
      _overlayEntry?.remove();
    }

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom + 50, // bottom-safe area
        left: 30,
        right: 30,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: color ?? Colors.blueGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
    _isShowing = true;

    _startTimer();
  }

  static void _startTimer() {
    Timer(const Duration(seconds: 2), () {
      if (_overlayEntry?.mounted ?? false) {
        _overlayEntry!.remove();
        _overlayEntry = null;
        _isShowing = false;
      }
    });
  }

  static OverlayEntry? _overlayImgEntry;
  static bool _isShowingImg = false;

  static void showImage(String imagePath, BuildContext context, {int duration = 2}) {
    final overlay = Overlay.of(context);

    if (overlay == null) return;

    if (_isShowingImg) {
      _overlayImgEntry?.remove();
    }

    _overlayImgEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: MediaQuery.of(context).viewInsets.bottom + 50, // bottom-safe area
        left: 30,
        right: 30,
        child: Material(
          color: Colors.transparent,
          child: Container(
            height: Sizes.screenWidth * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayImgEntry!);
    _isShowingImg = true;

    _startImgTimer(duration);
  }

  static void _startImgTimer(int duration) {
    Timer(Duration(seconds: duration), () {
      if (_overlayImgEntry?.mounted ?? false) {
        _overlayImgEntry!.remove();
        _overlayImgEntry = null;
        _isShowingImg = false;
      }
    });
  }
}
