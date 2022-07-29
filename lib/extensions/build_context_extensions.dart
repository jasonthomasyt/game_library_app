import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width <= 600;
  bool get isTablet =>
      MediaQuery.of(this).size.width < 900 &&
      MediaQuery.of(this).size.width > 600;
}
