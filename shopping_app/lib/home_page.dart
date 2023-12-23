import 'package:flutter/material.dart';
import 'package:shopping_app/components/chip_one.dart';
import 'package:shopping_app/header.dart';
import 'package:shopping_app/shoes/shoe_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> items = const [
    'All',
    'Addiads',
    'Nike',
    'Bata',
    'Ikea',
    'Ipenema'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: 30),
            ChipOne(
              items: items,
              fontSize: 16,
              backgroundColor: const Color.fromRGBO(245, 247, 249, 1),
            ),
            const SizedBox(height: 30),
            const ShoePage(),
          ],
        ),
      ),
    );
  }
}
