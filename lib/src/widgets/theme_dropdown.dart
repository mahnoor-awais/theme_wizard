/// A dropdown widget for switching between provided [ThemeModel]s.
///
/// Displays each theme by its [ThemeModel.name] and, when available, a small
/// color preview using [ThemeModel.previewColor]. Styling uses [ThemeDefaults]
/// for sensible fallbacks.
///
/// Example:
/// ```dart
/// ThemeDropdown(
///   themes: allThemes,
///   selectedTheme: currentTheme,
///   onChanged: (theme) => setState(() => currentTheme = theme),
/// );
/// ```
library;

import 'package:flutter/material.dart';
import 'package:theme_wizard/src/constants/theme_defaults.dart';
import 'package:theme_wizard/src/models/theme_model.dart';

class ThemeDropdown extends StatelessWidget {
  /// List of available themes to select from.
  final List<ThemeModel> themes;

  /// Currently selected theme, if any.
  final ThemeModel? selectedTheme;

  /// Callback invoked when the user selects a different theme.
  final ValueChanged<ThemeModel> onChanged;

  /// Optional hint text shown when no theme is selected.
  final String? hintText;

  const ThemeDropdown({
    super.key,
    required this.themes,
    required this.onChanged,
    this.selectedTheme,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius =
        BorderRadius.circular(ThemeDefaults.defaultRadius);
    final Color borderColor = ThemeDefaults.defaultColors.border;
    final Color fillColor = ThemeDefaults.defaultColors.surface;

    return DropdownButtonFormField<ThemeModel>(
      value: selectedTheme,
      isExpanded: true,
      items: themes
          .map(
            (ThemeModel theme) => DropdownMenuItem<ThemeModel>(
              value: theme,
              child: Row(
                children: <Widget>[
                  if (theme.previewColor != null)
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: theme.previewColor,
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: borderColor),
                      ),
                    ),
                  Flexible(child: Text(theme.name)),
                ],
              ),
            ),
          )
          .toList(),
      onChanged: (ThemeModel? value) {
        if (value != null) {
          onChanged(value);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        contentPadding: ThemeDefaults.defaultPadding,
        filled: true,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
