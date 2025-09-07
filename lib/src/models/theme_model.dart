/// A data model representing a theme option used by Theme Wizard.
///
/// This model is intentionally minimal and immutable. It carries a human-readable
/// [name], the corresponding Flutter [themeData], and an optional [previewColor]
/// that consumers can use to render small color chips or previews.
library;

import 'package:flutter/material.dart';

class ThemeModel {
  /// Display name for the theme (e.g., "Light", "Dark").
  final String name;

  /// The Flutter [ThemeData] representing this theme.
  final ThemeData themeData;

  /// Optional color used to preview this theme in UI elements.
  final Color? previewColor;

  /// Creates an immutable [ThemeModel].
  const ThemeModel({
    required this.name,
    required this.themeData,
    this.previewColor,
  });

  /// Returns a copy of this model with the given fields replaced.
  ThemeModel copyWith({
    String? name,
    ThemeData? themeData,
    Color? previewColor,
  }) {
    return ThemeModel(
      name: name ?? this.name,
      themeData: themeData ?? this.themeData,
      previewColor: previewColor ?? this.previewColor,
    );
  }

  @override
  String toString() =>
      'ThemeModel(name: $name, themeData: ThemeData(...), previewColor: ${previewColor ?? 'null'})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThemeModel &&
        other.name == name &&
        other.themeData == themeData &&
        other.previewColor == previewColor;
  }

  @override
  int get hashCode => Object.hash(name, themeData, previewColor);
}
