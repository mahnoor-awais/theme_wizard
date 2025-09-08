## theme_wizard

[![pub package](https://img.shields.io/pub/v/theme_wizard.svg)](https://pub.dev/packages/theme_wizard)
[![likes](https://img.shields.io/pub/likes/theme_wizard)](https://pub.dev/packages/theme_wizard/score)
[![popularity](https://img.shields.io/pub/popularity/theme_wizard)](https://pub.dev/packages/theme_wizard/score)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![pub package](https://img.shields.io/pub/v/theme_wizard.svg)](https://pub.dev/packages/theme_wizard)


Theme Wizard helps you add theme switching to your Flutter apps with clean, customizable UI widgets and sensible defaults. Bring your own ThemeData and state; Theme Wizard handles the UI.

### Features

- Clean, reusable widgets to switch themes
- Theme dropdown with color chips
- Visual theme preview card
- Combined selector panel for quick integration
- Sensible defaults with simple overrides
- Dart 3, null-safety, and documented APIs

### Install

```bash
flutter pub add theme_wizard
```

Import:

```dart
import 'package:theme_wizard/theme_wizard.dart';
```

### Quick Start

```dart
final themes = <ThemeModel>[
  ThemeModel(
    name: 'Blue',
    themeData: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
    previewColor: Colors.blue,
  ),
  ThemeModel(
    name: 'Green',
    themeData: ThemeData(useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
    previewColor: Colors.green,
  ),
];

ThemeModel? current = themes.first;

ThemeSelectorPanel(
  title: 'Choose a theme',
  themes: themes,
  selectedTheme: current,
  styles: const ThemeSelectorStyles(radius: 16.0, spacing: 16.0),
  onChanged: (t) => setState(() => current = t),
);

// Or use the pieces separately
ThemeDropdown(
  themes: themes,
  selectedTheme: current,
  onChanged: (t) => setState(() => current = t),
);

ThemePreviewCard(theme: current!);
```

### Example App

This package includes an `example/` showcasing all widgets with labels for screenshots.

Run it:

```bash
cd example
flutter run
```

### Contributing

- Pull requests are welcome. Please open an issue for discussion first.
- Follow effective Dart style and keep widgets documented.
- Roadmap:
  - Additional widgets (toggle)
  - Extended style system
  - Theming extensions and presets

### Screenshots / GIFs

https://github.com/user-attachments/assets/86fc5f6e-c778-4550-83fa-bd3bd5270257

### License

MIT. See [LICENSE](LICENSE).
