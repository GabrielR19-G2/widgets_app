import 'package:flutter/material.dart';

///Colores
const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

///Para los estilos de la aplicación
class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  ///Para asegurarnos que no seleccionen un color que no se encuentra
  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  /// Para aplicar el tema
  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],

      ///Configuración por defecto de los appbar
      appBarTheme: const AppBarTheme(centerTitle: false));
}
