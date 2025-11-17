import 'package:flutter/material.dart';

class ToMeter {
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static double? cmToMeter(BuildContext context, double? cm) {
    if (cm == null || cm <= 0) {
      return null;
    }
    return cm / 100;
  }

  static double? inchToMeter(BuildContext context, double? inch) {
    if (inch == null || inch <= 0) {
      return null;
    }
    return inch * 0.0254;
  }

  static double? ftToMeter(BuildContext context, double? ft) {
    if (ft == null || ft <= 0) {
      return null;
    }
    return ft * 0.3048;
  }
}
