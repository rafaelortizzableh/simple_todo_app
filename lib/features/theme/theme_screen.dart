import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'theme_export.dart';

class ThemeView extends ConsumerWidget {
  const ThemeView({Key? key}) : super(key: key);

  static const routeName = '/theme';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(themeControllerProvider.notifier);
    final currentThemeMode = ref.watch(themeControllerProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.theme ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: currentThemeMode,
          onChanged: controller.updateThemeMode,
          items: [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('${l10n?.systemTheme}'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('${l10n?.lightTheme}'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('${l10n?.darkTheme}'),
            ),
          ],
        ),
      ),
    );
  }
}
