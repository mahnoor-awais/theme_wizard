/// A reusable card that visually previews a given [ThemeModel].
///
/// The card shows three color swatches (primary, secondary, background)
/// and a sample text styled using the theme's typography. It is tappable
/// and suitable for displaying theme options in grids or lists.
///
/// Example:
/// ```dart
/// ThemePreviewCard(
///   theme: themeModel,
///   onTap: () => print('Tapped ' + themeModel.name),
///   width: 160,
///   height: 120,
/// )
/// ```
library;

import 'package:flutter/material.dart';
import 'package:theme_wizard/src/constants/theme_defaults.dart';
import 'package:theme_wizard/src/models/theme_model.dart';

class ThemePreviewCard extends StatelessWidget {
  /// Theme to preview.
  final ThemeModel theme;

  /// Optional tap callback.
  final VoidCallback? onTap;

  /// Optional width of the card.
  final double? width;

  /// Optional height of the card.
  final double? height;

  const ThemePreviewCard({
    super.key,
    required this.theme,
    this.onTap,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData previewTheme = theme.themeData;
    final ColorScheme scheme = previewTheme.colorScheme;

    final BorderRadius borderRadius =
        BorderRadius.circular(ThemeDefaults.defaultRadius);

    final Widget swatchRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _ColorSwatch(color: scheme.primary),
        _ColorSwatch(color: scheme.secondary),
        _ColorSwatch(color: scheme.surface),
      ],
    );

    final TextStyle textStyle =
        previewTheme.textTheme.bodyMedium ?? const TextStyle(fontSize: 14);

    final Widget sampleText = Text(
      theme.name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: textStyle.copyWith(color: scheme.onSurface),
    );

    final Widget content = Padding(
      padding: ThemeDefaults.defaultPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          swatchRow,
          const SizedBox(height: 8),
          sampleText,
        ],
      ),
    );

    final Widget card = Material(
      color: ThemeDefaults.defaultColors.surface,
      elevation: 2,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: content,
        ),
      ),
    );

    if (width != null || height != null) {
      return SizedBox(
        width: width,
        height: height,
        child: card,
      );
    }

    return card;
  }
}

class _ColorSwatch extends StatelessWidget {
  final Color color;

  const _ColorSwatch({required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 18,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ThemeDefaults.defaultColors.border),
        ),
      ),
    );
  }
}
