import 'package:flutter/material.dart';

/// Tema global do aplicativo.
/// Fundo branco, AppBar roxa (#6563FF), contraste suave em cards.
class AppTheme {
  static const Color primaryColor = Color(0xFF6563FF);
  static const Color accentColor = Color(0xFF5C6BC0);

  /// Tema claro
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      cardColor: const Color(0xFFF8F8FF),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        bodyMedium: TextStyle(color: Colors.black87),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      iconTheme: const IconThemeData(color: primaryColor),
      dividerTheme: const DividerThemeData(color: Color(0xFFE0E0E0)),
      cardTheme: CardThemeData(
        color: const Color(0xFFF8F8FF),
        surfaceTintColor: Colors.white,
        elevation: 1,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
        contentTextStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  /// Tema escuro
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF121212),
      cardColor: const Color(0xFF1E1E1E), // leve contraste com fundo escuro
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      iconTheme: const IconThemeData(color: Colors.white70),
      dividerTheme: const DividerThemeData(color: Colors.white24),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E1E1E),
        surfaceTintColor: Colors.black,
        elevation: 1,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.grey.shade900,
        contentTextStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
