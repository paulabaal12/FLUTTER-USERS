import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/users_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 11, 44, 88), 
      brightness: Brightness.light,
    );

    return MaterialApp(
      title: 'Lista de Usuarios',
      theme: ThemeData(
        colorScheme: colorScheme,
        textTheme: GoogleFonts.montserratTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const UsersPage(),
    );
  }
}
