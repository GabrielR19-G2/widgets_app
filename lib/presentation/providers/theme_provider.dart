import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
// TODO -> Crear estado para manejar un bool
// final counterProvider = StateProvider((ref) => 5);

final isDarkModeProvider = StateProvider((ref) => false);

/// Provider que no se puede cambiar
/// Listado de colores inmutable (no cambia)
final colorsListProvider = Provider((ref) => colorList);

///Provider para saber cuál es el color seleccionado
final selectedColorProvider = StateProvider((ref) => 0);
