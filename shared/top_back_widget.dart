import 'package:flutter/material.dart';
import 'package:hack_misis_site/shared/colors.dart' as clrs;

class TopBackWidget extends StatelessWidget {
  const TopBackWidget(
    this.backContext, {
    this.text,
    this.onPressed,
    this.child,
    Key? key,
  }) : super(key: key);

  final BuildContext backContext;
  final void Function()? onPressed;
  final String? text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          iconSize: 35,
          icon: Icon(Icons.arrow_back_ios),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          color: clrs.text,
          onPressed: onPressed ??
              () {
                Navigator.pop(backContext);
              },
        ),
        child == null
            ? Text(
                text ?? "",
                style: TextStyle(color: clrs.text, fontSize: 30),
              )
            : child!,
      ],
    );
  }
}
