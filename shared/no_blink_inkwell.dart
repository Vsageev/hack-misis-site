import 'package:flutter/material.dart';

class NoBlinkInkWell extends StatelessWidget {
  const NoBlinkInkWell({Key? key, required this.child, this.onTap})
      : super(key: key);

  final Widget child;
  final void  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: child,
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
