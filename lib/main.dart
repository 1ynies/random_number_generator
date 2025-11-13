import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_num_generator/data/random_number_repository_imp.dart';
import 'package:random_num_generator/domain/usecases/generate_random_number.dart';
import 'package:random_num_generator/presentation/pages/random_number_generation_screen.dart';
import 'package:random_num_generator/presentation/pages/splashscreen.dart';
import 'package:random_num_generator/presentation/providers/Input_provider.dart';
import 'package:random_num_generator/presentation/providers/random_number_provider.dart';
import 'package:random_num_generator/presentation/theme/app_theme.dart';

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
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
