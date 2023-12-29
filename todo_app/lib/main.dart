import 'package:flutter/material.dart';
import 'package:todo_app/pages/get_started_page.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 55, 55, 55),
          primary: Colors.cyan[300],
        ),
        // checkboxTheme: const CheckboxThemeData(
        //   overlayColor: MaterialStatePropertyAll(
        //     Color.fromRGBO(83, 195, 202, 1),
        //   ),
        //   checkColor: MaterialStatePropertyAll(
        //     Color.fromRGBO(83, 195, 202, 1),
        //   ),
        //   fillColor: MaterialStatePropertyAll(
        //     Colors.white,
        //   ),
        // ),
      ),
      home: const GetStartedPage(),
    );
  }
}
