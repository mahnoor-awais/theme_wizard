/// A panel that combines a [ThemeDropdown] and [ThemePreviewCard].
///
/// Shows a dropdown to select a [ThemeModel] and a visual preview card
/// for the current selection. Default styling uses [ThemeDefaults], which
/// can be overridden via [ThemeSelectorStyles].
///
/// Example:
/// ```dart
/// ThemeSelectorPanel(
///   themes: allThemes,
///   selectedTheme: currentTheme,
///   onChanged: (theme) => setState(() => currentTheme = theme),
///   title: 'Choose theme',
/// )
/// ```
library;

import 'package:flutter/material.dart';
import 'package:theme_wizard/src/constants/theme_defaults.dart';
import 'package:theme_wizard/src/models/theme_model.dart';
import 'package:theme_wizard/src/models/theme_selector_styles.dart';
import 'package:theme_wizard/src/utils/style_helpers.dart';
import 'package:theme_wizard/src/widgets/theme_dropdown.dart';
import 'package:theme_wizard/src/widgets/theme_preview_card.dart';

class ThemeSelectorPanel extends StatelessWidget {
  /// Available themes to choose from.
  final List<ThemeModel> themes;

  /// Current selection.
  final ThemeModel? selectedTheme;

  /// Called when selection changes.
  final ValueChanged<ThemeModel> onChanged;

  /// Optional panel title.
  final String? title;

  /// Optional panel padding.
  final EdgeInsets? padding;

  /// Optional style overrides.
  final ThemeSelectorStyles? styles;

  const ThemeSelectorPanel({
    super.key,
    required this.themes,
    required this.onChanged,
    this.selectedTheme,
    this.title,
    this.padding,
    this.styles,
  });

  @override
  Widget build(BuildContext context) {
    final EdgeInsets panelPadding =
        mergeWithDefaults<EdgeInsets>(padding, ThemeDefaults.defaultPadding);
    final double radius =
        mergeWithDefaults<double>(styles?.radius, ThemeDefaults.defaultRadius);
    final Color bg = mergeWithDefaults<Color>(
        styles?.backgroundColor, ThemeDefaults.defaultColors.surface);
    final double spacing = mergeWithDefaults<double>(styles?.spacing, 12.0);

    final BorderRadius borderRadius = BorderRadius.circular(radius);

    final List<Widget> columnChildren = <Widget>[
      if (title != null)
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ThemeDropdown(
        themes: themes,
        selectedTheme: selectedTheme,
        onChanged: onChanged,
      ),
      SizedBox(height: spacing),
      ThemePreviewCard(
        theme: selectedTheme ??
            (themes.isNotEmpty
                ? themes.first
                : ThemeModel(
                    name: 'Default', themeData: Theme.of(context).copyWith())),
      ),
    ];

    return Container(
      padding: panelPadding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: columnChildren,
      ),
    );
  }
}
