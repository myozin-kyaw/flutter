import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/chip_one.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class ShoeDetailPage extends StatefulWidget {
  final Map<String, dynamic> shoe;

  const ShoeDetailPage({
    super.key,
    required this.shoe,
  });

  @override
  State<ShoeDetailPage> createState() => _ShoeDetailPageState();
}

class _ShoeDetailPageState extends State<ShoeDetailPage> {
  void addToCart() {
    if (context.read<CartProvider>().selectedItem != '') {
      context.read<CartProvider>().addItem({
        'id': widget.shoe['id'],
        'title': widget.shoe['title'],
        'price': widget.shoe['price'],
        'company': widget.shoe['company'],
        'size': context.read<CartProvider>().selectedItem,
        'image': widget.shoe['image'],
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Shoe added successfully',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select size',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }
  }

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
                widget.shoe['title'] as String,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image.asset(
                  widget.shoe['image'] as String,
                  height: 250,
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
                      '\$${widget.shoe['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20.0),
                    ChipOne(
                      items: widget.shoe['sizes'] as List<String>,
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
                        onPressed: () => addToCart(),
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          fixedSize: const Size(370, 50),
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
