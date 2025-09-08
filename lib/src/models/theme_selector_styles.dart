/// Style overrides for [ThemeSelectorPanel].
///
/// Consumers can provide this to customize colors, spacing, and radius
/// in the selector panel. All fields are optional; unspecified fields
/// fall back to [ThemeDefaults].
library;

import 'package:flutter/material.dart';

class ThemeSelectorStyles {
  /// Panel background color.
  final Color? backgroundColor;

  /// Border color around dropdown or panel.
  final Color? borderColor;

  /// Radius for rounded widgets within the panel.
  final double? radius;

  /// Spacing between elements.
  final double? spacing;

  /// Internal padding for the panel.
  final EdgeInsets? padding;

  const ThemeSelectorStyles({
    this.backgroundColor,
    this.borderColor,
    this.radius,
    this.spacing,
    this.padding,
  });

  ThemeSelectorStyles copyWith({
    Color? backgroundColor,
    Color? borderColor,
    double? radius,
    double? spacing,
    EdgeInsets? padding,
  }) {
    return ThemeSelectorStyles(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      radius: radius ?? this.radius,
      spacing: spacing ?? this.spacing,
      padding: padding ?? this.padding,
    );
  }

  @override
  String toString() =>
      'ThemeSelectorStyles(bg: ${backgroundColor?.toString() ?? 'null'}, border: ${borderColor?.toString() ?? 'null'}, radius: ${radius?.toString() ?? 'null'}, spacing: ${spacing?.toString() ?? 'null'}, padding: ${padding?.toString() ?? 'null'})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThemeSelectorStyles &&
        other.backgroundColor == backgroundColor &&
        other.borderColor == borderColor &&
        other.radius == radius &&
        other.spacing == spacing &&
        other.padding == padding;
  }

  @override
  int get hashCode =>
      Object.hash(backgroundColor, borderColor, radius, spacing, padding);
}
