import 'package:flutter/material.dart';
import 'package:shopping_app/components/shoe_card.dart';
import 'package:shopping_app/global_variable.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: ListView.builder(
          itemCount: shoes.length,
          itemBuilder: (context, index) {
            final shoe = shoes[index];

            return ShoeCard(
              title: shoe['title'] as String,
              price: shoe['price'] as double,
              image: shoe['image'] as String,
              backgroundColor: index.isEven
                  ? const Color.fromRGBO(216, 240, 253, 1)
                  : const Color.fromRGBO(245, 247, 249, 1),
            );
          },
        ),
      ),
    );
  }
}
