import 'package:flutter/material.dart';
import 'package:shopping_app/components/chip_one.dart';
import 'package:shopping_app/components/shoe_card.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/header.dart';
import 'package:shopping_app/shoes/shoe_detail_page.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({super.key});

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
    return SafeArea(
      child: Column(
        children: [
          const Header(),
          const SizedBox(height: 30),
          ChipOne(
            items: items,
            fontSize: 16,
            backgroundColor: const Color.fromRGBO(245, 247, 249, 1),
            hasBorder: false,
            paddingHorizontal: 24,
            paddingVertical: 15,
            borderRadius: 50,
          ),
          const SizedBox(height: 30),
          Expanded(
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                itemCount: shoes.length,
                itemBuilder: (context, index) {
                  final shoe = shoes[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ShoeDetailPage(shoe: shoe);
                          },
                        ),
                      );
                    },
                    child: ShoeCard(
                      title: shoe['title'] as String,
                      price: shoe['price'] as double,
                      image: shoe['image'] as String,
                      backgroundColor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromRGBO(245, 247, 249, 1),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
