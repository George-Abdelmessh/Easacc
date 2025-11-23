import 'package:flutter/material.dart';

class OutlineShadowInputBorder extends OutlineInputBorder {
  /// Creates a rounded rectangle outline border for an [InputDecorator].
  ///
  /// If the [borderSide] parameter is [BorderSide.none], it will not draw a
  /// border. However, it will still define a shape (which you can see if
  /// [InputDecoration.filled] is true).
  ///
  /// If an application does not specify a [borderSide] parameter of
  /// value [BorderSide.none], the input decorator substitutes its own, using
  /// [copyWith], based on the current theme and [InputDecorator.isFocused].
  ///
  /// The [borderRadius] parameter defaults to a value where all four
  /// corners have a circular radius of 4.0. The [borderRadius] parameter
  /// must not be null and the corner radii must be circular, i.e. their
  /// [Radius.x] and [Radius.y] values must be the same.
  const OutlineShadowInputBorder({
    required this.boxShadow,
    super.borderSide,
    super.borderRadius,
    super.gapPadding,
    this.backgroundColor = Colors.white,
  });

  final Color backgroundColor;
  final List<BoxShadow> boxShadow;

  /// Draw a rounded rectangle around [rect] using [borderRadius].
  ///
  /// The [borderSide] defines the line's color and weight.
  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    for (final bs in boxShadow) {
      final paint = bs.toPaint();
      final bounds = rect.shift(bs.offset).inflate(bs.spreadRadius);
      canvas.drawRRect(borderRadius.toRRect(bounds), paint);
    }

    final outer = borderRadius.toRRect(rect);
    final center = outer.deflate(borderSide.width / 2.0);

    // canvas.drawShadow(Path()..addRRect(center), Colors.black, 4, true);

    final backgroundPaint = Paint()
      ..strokeWidth = 0
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRRect(center, backgroundPaint);

    final borderPaint = borderSide.toPaint();
    canvas.drawRRect(center, borderPaint);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is OutlineShadowInputBorder &&
        other.borderSide == borderSide &&
        other.borderRadius == borderRadius &&
        other.gapPadding == gapPadding &&
        other.backgroundColor == backgroundColor &&
        other.boxShadow == boxShadow;
  }

  // @override
  // int get hashCode => hashValues(
  //   borderSide,
  //   borderRadius,
  //   gapPadding,
  //   backgroundColor,
  //   boxShadow,
  // );
}
