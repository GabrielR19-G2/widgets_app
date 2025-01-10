import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = "theme_changer_screen";
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // por ahora:
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon(isDarkMode
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined),
            onPressed: () {
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            },
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    ///No se usa read porque riverpod sabe qué y cómo va a cambiar (también porque se puede hacer dinámico)
    final List<Color> colors = ref.watch(colorsListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    // ListView para mostrar todos los colores
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index]; //Color seleccionado
        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index,
          groupValue: selectedColor, //Valor seleccionado
          onChanged: (value) {
            // TODO: notificar cambio
            ref.read(selectedColorProvider.notifier).state = value ?? 0;
          },
        );
      },
    );
  }
}
