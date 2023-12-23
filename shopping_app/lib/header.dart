import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    const outlineBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(119, 119, 119, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'Shoes\nCollection',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: outlineBorder,
              focusedBorder: outlineBorder,
            ),
          ),
        )
      ],
    );
  }
}
