import 'package:flutter/material.dart';

class RemoveImageButton extends StatelessWidget {
  final void Function()? onPressed;

  const RemoveImageButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.primary,
        ),
        child: const Icon(size: 40, Icons.close_rounded, color: Colors.white),
      ),
    );
  }
}
