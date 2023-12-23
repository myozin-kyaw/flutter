import 'package:flutter/material.dart';
import 'package:shopping_app/components/chip_one.dart';

class ShoeDetailPage extends StatelessWidget {
  final Map<String, Object> shoe;

  const ShoeDetailPage({
    super.key,
    required this.shoe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_circle_left),
          )
        ],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                shoe['title'] as String,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  shoe['image'] as String,
                ),
              ),
              const Spacer(flex: 2),
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(245, 247, 249, 1),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      '\$${shoe['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16.0),
                    const ChipOne(
                      items: ['1', '2', '3'], // shoe['sizes'] as List<String>,
                      fontSize: 16,
                      backgroundColor: Color.fromRGBO(216, 240, 253, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
