import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/home_page.dart';
import 'package:shopping_app/providers/cart_provider.dart';

void main() {
  runApp(const MyShoppingApp());
}

// Provider
// ChangeNotifierProvider
// FutureProvider
// StreamProvider

class MyShoppingApp extends StatelessWidget {
  const MyShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(119, 119, 119, 1),
              fontWeight: FontWeight.bold,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            titleSmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
