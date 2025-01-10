import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
// final counterProvider = StateProvider((ref) => 5);

final isDarkModeProvider = StateProvider((ref) => false);

/// Provider que no se puede cambiar
/// Listado de colores inmutable (no cambia)
final colorsListProvider = Provider((ref) => colorList);

/// Provider para saber cuál es el color seleccionado
final selectedColorProvider = StateProvider((ref) => 0);

/// Objeto de tipo AppTheme(custom) |
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) =>
      ThemeNotifier(), //Creando la primera instancia (por defecto inicializa el tema)
);

// Controller o notifier
// Encargado de mantener el estado/instancia del appTheme
class ThemeNotifier extends StateNotifier<AppTheme> {
  // Creando la primera instancia de apptheme (con valores por defecto)
  // State = Estado = new AppTheme();
  ThemeNotifier() : super(AppTheme());

  void toggleDarkmode() {
    // state = state.copyWith(isDarkmode: !state.isDarkmode);
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}

// State -> Mantener pieza de estado.
// Provider -> Algo inmutable.
// StateNotifier -> Objeto un poco más elaborado.
