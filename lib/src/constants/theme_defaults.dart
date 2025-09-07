/// Package-level defaults and fallback styles used by Theme Wizard widgets.
///
/// These values are intentionally neutral. Consuming apps can override these
/// via widget parameters or theming extensions. They serve as safe fallbacks
/// for layout and colors.
library;

import 'package:flutter/material.dart';

class ThemeDefaults {
  ThemeDefaults._();

  /// Default padding used across widgets.
  static final EdgeInsets defaultPadding = EdgeInsets.all(8);

  /// Default corner radius for rounded elements.
  static const double defaultRadius = 12.0;

  /// Neutral color palette for backgrounds, borders, and text accents.
  // ignore: library_private_types_in_public_api
  static final _DefaultColors defaultColors = _DefaultColors();
}

/// Grouping of neutral default colors.
class _DefaultColors {
  /// Subtle background, e.g., containers.
  final Color background = const Color(0xFFF7F7F7);

  /// Card or elevated backgrounds.
  final Color surface = const Color(0xFFFFFFFF);

  /// Dividers and borders.
  final Color border = const Color(0xFFE0E0E0);

  /// Muted text.
  final Color mutedText = const Color(0xFF6B6B6B);

  /// Primary text.
  final Color text = const Color(0xFF1F1F1F);

  /// Hint/placeholder accents.
  final Color hint = const Color(0xFF9E9E9E);
}
