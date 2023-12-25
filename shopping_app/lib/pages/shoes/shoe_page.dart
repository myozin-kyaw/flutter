import 'package:flutter/material.dart';
import 'package:shopping_app/components/chip_one.dart';
import 'package:shopping_app/components/shoe_card.dart';
import 'package:shopping_app/components/shoe_list.dart';
import 'package:shopping_app/global_variable.dart';
import 'package:shopping_app/header.dart';
import 'package:shopping_app/pages/shoes/shoe_detail_page.dart';

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
    final size = MediaQuery.of(context).size;
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1080) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                    ),
                    itemCount: shoes.length,
                    itemBuilder: (context, index) {
                      return ShoeList(shoe: shoes[index], index: index);
                    },
                  );
                } else {
                  return SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: shoes.length,
                      itemBuilder: (context, index) {
                        return ShoeList(shoe: shoes[index], index: index);
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
