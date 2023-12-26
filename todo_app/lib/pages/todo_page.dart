import 'package:flutter/material.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            height: 250,
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(83, 195, 202, 1),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/images/todo_get_started.jpeg'),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Welcome User',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Tasks List',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 16.0),
          Container(
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const Column(
              children: [Text('data')],
            ),
          ),
        ],
      ),
    );
  }
}
