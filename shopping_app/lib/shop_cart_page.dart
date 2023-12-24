import 'package:flutter/material.dart';
import 'package:shopping_app/global_variable.dart';

class ShopCartPage extends StatelessWidget {
  const ShopCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: carts.length,
          itemBuilder: (context, index) {
            final cart = carts[index];
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(
                  cart['image'].toString(),
                ),
              ),
              title: Text(
                cart['title'].toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              subtitle: Text(
                'Size: ${cart['size'].toString()}',
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
