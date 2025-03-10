import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/resume_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else if (_themeMode == ThemeMode.dark) {
        _themeMode = ThemeMode.light;
      } else {
        // If system, default to light
        _themeMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yasir Subhani - Resume',
      debugShowCheckedModeBanner: false,
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: _themeMode,
      home: ResumeScreen(onThemeToggle: toggleTheme),
    );
  }

  ThemeData _buildLightTheme() {
    final base = ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF3949AB), // Indigo 600
        brightness: Brightness.light,
        primary: const Color(0xFF3949AB), // Indigo 600
        primaryContainer: const Color(0xFFE8EAF6), // Indigo 50
        secondary: const Color(0xFF00897B), // Teal 600
        secondaryContainer: const Color(0xFFB2DFDB), // Teal 100
        tertiary: const Color(0xFFFF8F00), // Amber 800
        tertiaryContainer: const Color(0xFFFFECB3), // Amber 100
        error: const Color(0xFFD32F2F), // Red 700
        surface: Colors.white,
        background: const Color(0xFFF5F7FA),
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.black,
      ),
      useMaterial3: true,
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme),
      cardTheme: CardTheme(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: base.colorScheme.primaryContainer,
        foregroundColor: base.colorScheme.primary,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: base.colorScheme.primary,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: base.colorScheme.outlineVariant,
        thickness: 1,
        space: 24,
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    final base = ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF5C6BC0), // Indigo 400
        brightness: Brightness.dark,
        primary: const Color(0xFF5C6BC0), // Indigo 400
        primaryContainer: const Color(0xFF1A237E).withOpacity(0.7), // Indigo 900
        secondary: const Color(0xFF26A69A), // Teal 400
        secondaryContainer: const Color(0xFF004D40).withOpacity(0.7), // Teal 900
        tertiary: const Color(0xFFFFB300), // Amber 600
        tertiaryContainer: const Color(0xFF663D00).withOpacity(0.7), // Amber 900
        error: const Color(0xFFEF5350), // Red 400
        surface: const Color(0xFF1E1E2E), // Dark surface
        background: const Color(0xFF121212), // Dark background
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onTertiary: Colors.black,
      ),
      useMaterial3: true,
    );

    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme),
      cardTheme: CardTheme(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: const Color(0xFF1E1E2E), // Dark card color
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: base.colorScheme.primaryContainer,
        foregroundColor: base.colorScheme.onPrimaryContainer,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: base.colorScheme.primary,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: base.colorScheme.onSurface.withOpacity(0.2),
        thickness: 1,
        space: 24,
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
    );
  }
}