import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      borderRadius: .circular(8),
      color: Colors.deepPurple,
    ),
    child: Text(
      category,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: .w700,
        fontSize: 10,
      ),
    ),
  );
}
