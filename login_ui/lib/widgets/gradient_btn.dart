import 'package:flutter/material.dart';
import 'package:login_ui/pallete.dart';

class GradientBtn extends StatelessWidget {
  const GradientBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(187, 63, 221, 1),
            Pallete.gradient2,
            Pallete.gradient3
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(370, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
        ),
        child: const Text(
          'Sign in',
          style: TextStyle(
            color: Pallete.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
