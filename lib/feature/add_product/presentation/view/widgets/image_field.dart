import 'package:flutter/material.dart';

class ImageField extends StatelessWidget {
  const ImageField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(size: 180, Icons.image_rounded, color: Colors.grey),
    );
  }
}
