import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  const MyButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
        child: child,
      ),
    );
  }
}
