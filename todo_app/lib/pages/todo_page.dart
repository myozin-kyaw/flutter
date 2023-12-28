import 'package:flutter/material.dart';
import 'package:todo_app/global_variables.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Column(
          children: [
            Text(
              'My Tasks',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Text(
              'Dec 31, 2023',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              height: 30,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.grey[200],
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                itemCount: weekDays.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 90,
                    child: Card(
                      color: weekDays[index]['is_active'] as bool
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                      elevation: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            weekDays[index]['name'].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: weekDays[index]['is_active'] as bool
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            weekDays[index]['day'].toString(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: weekDays[index]['is_active'] as bool
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(
              height: 40,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.grey[200],
            ),
            const Text(
              'Todo',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('*'),
                          Text(
                            'Do laundary',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        '12:00',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
