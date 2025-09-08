import 'package:flutter/material.dart';
import 'package:theme_wizard/theme_wizard.dart';

void main() {
  runApp(const ThemeWizardDemoApp());
}

/// Minimal example app that showcases all public widgets and models
/// of the theme_wizard package for screenshots and screen recordings.
class ThemeWizardDemoApp extends StatelessWidget {
  const ThemeWizardDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Wizard Example',
      theme: ThemeData.light(useMaterial3: true),
      home: const ThemeWizardHome(),
    );
  }
}

class ThemeWizardHome extends StatefulWidget {
  const ThemeWizardHome({super.key});

  @override
  State<ThemeWizardHome> createState() => _ThemeWizardHomeState();
}

class _ThemeWizardHomeState extends State<ThemeWizardHome> {
  // Define 4 simple themes to demonstrate switching.
  late final List<ThemeModel> allThemes = <ThemeModel>[
    ThemeModel(
      name: 'Light Blue',
      themeData: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      previewColor: Colors.blue,
    ),
    ThemeModel(
      name: 'Forest Green',
      themeData: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      previewColor: Colors.green,
    ),
    ThemeModel(
      name: 'Royal Purple',
      themeData: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      previewColor: Colors.purple,
    ),
    ThemeModel(
      name: 'Sunset Orange',
      themeData: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      previewColor: Colors.deepOrange,
    ),
  ];

  ThemeModel? selectedTheme;

  @override
  void initState() {
    super.initState();
    selectedTheme = allThemes.first;
  }

  @override
  Widget build(BuildContext context) {
    // Custom styles for ThemeSelectorPanel to override defaults.
    final ThemeSelectorStyles customPanelStyles = ThemeSelectorStyles(
      backgroundColor: ThemeDefaults.defaultColors.surface,
      borderColor: ThemeDefaults.defaultColors.border,
      radius: 16.0,
      spacing: 16.0,
      padding: const EdgeInsets.all(12),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Wizard Example')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // SECTION: ThemeSelectorPanel (combined dropdown + preview)
            Text(
              '1) ThemeSelectorPanel (Combined)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ThemeSelectorPanel(
              title: 'Choose a theme',
              themes: allThemes,
              selectedTheme: selectedTheme,
              styles: customPanelStyles, // override defaults
              onChanged: (ThemeModel theme) {
                setState(() => selectedTheme = theme);
              },
            ),

            const SizedBox(height: 24),
            const Divider(),

            // SECTION: ThemeDropdown (standalone)
            Text(
              '2) ThemeDropdown (Standalone)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ThemeDropdown(
              themes: allThemes,
              selectedTheme: selectedTheme,
              hintText: 'Select theme',
              onChanged: (ThemeModel theme) {
                setState(() => selectedTheme = theme);
              },
            ),

            const SizedBox(height: 16),

            // SECTION: ThemePreviewCard (standalone)
            Text(
              '3) ThemePreviewCard (Standalone)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            ThemePreviewCard(
              theme: selectedTheme ?? allThemes.first,
              width: 230,
              height: 120,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tapped ${selectedTheme?.name ?? 'Theme'}'),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
            const Divider(),

            // SECTION: ThemeDefaults (demonstrate defaults in a simple container)
            Text(
              '4) ThemeDefaults (Fallback Styles)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Container(
              padding: ThemeDefaults.defaultPadding,
              decoration: BoxDecoration(
                color: ThemeDefaults.defaultColors.surface,
                borderRadius: BorderRadius.circular(
                  ThemeDefaults.defaultRadius,
                ),
                border: Border.all(color: ThemeDefaults.defaultColors.border),
              ),
              child: Text(
                'Using ThemeDefaults padding, radius, and neutral colors.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),

            const SizedBox(height: 24),
            const Divider(),

            // SECTION: ThemeModel (show the currently selected model values)
            Text(
              '5) ThemeModel (Selected)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Selected: ${selectedTheme?.name ?? 'None'}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
