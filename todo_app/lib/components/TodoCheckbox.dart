import 'package:flutter/material.dart';

class TodoCheckbox extends StatefulWidget {
  final bool? isChecked;

  const TodoCheckbox({
    super.key,
    required this.isChecked,
  });

  @override
  State<TodoCheckbox> createState() => _TodoCheckboxState();
}

class _TodoCheckboxState extends State<TodoCheckbox> {
  late bool? isCheck;

  @override
  void initState() {
    super.initState();
    isCheck = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: const BorderSide(
        color: Colors.black12,
        strokeAlign: 3,
      ),
      value: isCheck,
      onChanged: (bool? value) {
        setState(() {
          isCheck = value;
        });
      },
    );
  }
}
