import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset('assets/images/todo_get_started.jpeg'),
              const Spacer(),
              Text(
                'Gets things done with TODO',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16.0),
              Text(
                'In this application you can write down your everyday business to do, mentioned what you did and save it Also you can save your time instead of writing on the paper.',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const TodoPage();
                      },
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  elevation: 4,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
