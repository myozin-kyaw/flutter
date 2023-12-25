import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class ShopCartPage extends StatelessWidget {
  const ShopCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carts = context.watch<CartProvider>().carts;
    print(carts);
    print(context.watch<CartProvider>().selectedItem);
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
            // final cart = carts[index];
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
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Delete Shoe',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: Text(
                          'Are you sure to remove this shoe!',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.read<CartProvider>().removeItem(cart);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
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
