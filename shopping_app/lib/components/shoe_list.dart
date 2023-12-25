import 'package:flutter/material.dart';
import 'package:shopping_app/components/shoe_card.dart';
import 'package:shopping_app/pages/shoes/shoe_detail_page.dart';

class ShoeList extends StatelessWidget {
  final Map<String, dynamic> shoe;
  final int index;

  const ShoeList({
    super.key,
    required this.shoe,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
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
  }
}
