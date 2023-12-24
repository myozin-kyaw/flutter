import 'package:flutter/material.dart';

class ChipOne extends StatefulWidget {
  final List<String> items;
  final int fontSize;
  final Color backgroundColor;
  final bool hasBorder;
  final double paddingVertical;
  final double paddingHorizontal;
  final double borderRadius;

  const ChipOne({
    super.key,
    required this.items,
    required this.fontSize,
    required this.backgroundColor,
    required this.hasBorder,
    required this.paddingVertical,
    required this.paddingHorizontal,
    required this.borderRadius,
  });

  @override
  State<ChipOne> createState() => _ChipOneState();
}

class _ChipOneState extends State<ChipOne> {
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.items[0];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = widget.items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = item;
                });
              },
              child: Chip(
                label: Text(item),
                backgroundColor: selectedItem == item
                    ? Theme.of(context).colorScheme.primary
                    : const Color.fromRGBO(245, 247, 249, 1),
                labelStyle: const TextStyle(
                  fontSize: 16,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: widget.paddingHorizontal,
                  vertical: widget.paddingVertical,
                ),
                side: widget.hasBorder
                    ? const BorderSide(style: BorderStyle.solid)
                    : BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
