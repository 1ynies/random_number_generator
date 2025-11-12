import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_num_generator/data/random_number_repository_imp.dart';
import 'package:random_num_generator/domain/usecases/generate_random_number.dart';
import 'package:random_num_generator/presentation/pages/random_number_generation_screen.dart';
import 'package:random_num_generator/presentation/providers/Input_provider.dart';
import 'package:random_num_generator/presentation/providers/random_number_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize repository and use case
    final repository = RandomNumberRepositoryImpl();
    final generateRandomNumber = GenerateRandomNumber(repository);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => InputProvider()),
        ChangeNotifierProvider(
          create: (context) => RandomNumberProvider(generateRandomNumber),
        ),
      ],
      child: MaterialApp(
        title: 'Random Number Generator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,

          // Color Scheme - White and Deep Purple
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            primary: Colors.deepPurple,
            secondary: Colors.deepPurpleAccent,
            surface: Colors.white,
            background: Colors.white,
            error: Colors.red,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.deepPurple,
            onBackground: Colors.deepPurple,
            brightness: Brightness.light,
          ),

          // Scaffold Background
          scaffoldBackgroundColor: Colors.white,

          // AppBar Theme
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          // Text Theme - Poppins Regular
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 57,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
            displayMedium: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 45,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
            displaySmall: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 36,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
            headlineLarge: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 32,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
            headlineMedium: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 28,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
            headlineSmall: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
            titleLarge: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
            titleMedium: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.deepPurple,
            ),
            titleSmall: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.deepPurple,
            ),
            bodyLarge: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
            bodySmall: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
            labelLarge: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.deepPurple,
            ),
            labelMedium: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.deepPurple,
            ),
            labelSmall: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.deepPurple,
            ),
          ),

          // Input Decoration Theme
          inputDecorationTheme: InputDecorationTheme(
            filled: false,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: Colors.deepPurple,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.deepPurple.shade200,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red, width: 2),
            ),
            labelStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.deepPurple,
            ),
            floatingLabelStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
            ),
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.deepPurple.shade300,
            ),
          ),

          // Elevated Button Theme
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              elevation: 4,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Text Button Theme
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.deepPurple,
              textStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Card Theme
          cardTheme: CardThemeData(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),

          // Dialog Theme
          dialogTheme: DialogThemeData(
            backgroundColor: Colors.white,
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            titleTextStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
            ),
            contentTextStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.deepPurple,
            ),
          ),

          // Snackbar Theme
          snackBarTheme: SnackBarThemeData(
            backgroundColor: Colors.deepPurple,
            contentTextStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            behavior: SnackBarBehavior.floating,
          ),

          // Progress Indicator Theme
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Colors.deepPurple,
          ),
        ),
        home: const RandomNumberGenerationScreen(),
      ),
    );
  }
}
