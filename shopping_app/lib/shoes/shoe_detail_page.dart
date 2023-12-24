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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20.0),
                    Text(
                      '\$${shoe['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20.0),
                    ChipOne(
                      items: shoe['sizes'] as List<String>,
                      fontSize: 16,
                      backgroundColor: const Color.fromRGBO(216, 240, 253, 1),
                      hasBorder: true,
                      paddingHorizontal: 10,
                      paddingVertical: 5,
                      borderRadius: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        label: const Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
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
