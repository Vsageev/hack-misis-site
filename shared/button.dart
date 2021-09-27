import 'package:flutter/material.dart';
import 'package:hack_misis_site/shared/colors.dart';

class Button extends StatefulWidget {
  Button({
    Key? key,
    this.child,
    required this.onTap,
    this.color = bright,
    this.tapColor,
    this.width,
    this.borderRadius,
    this.padding,
    this.margin,
    this.text,
  }) : super(key: key);

  final Widget? child;
  final Color color;
  final String? text;
  final Color? tapColor;
  final double? width;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final void Function() onTap;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  late Color currColor = widget.color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: widget.padding ?? EdgeInsets.all(15),
        margin: widget.margin,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 100),
            color: currColor),
        child: (() {
          if (widget.text == null) {
            return widget.child;
          }
          return Center(
            child: Text(
              widget.text!,
              style: TextStyle(color: textReverse),
            ),
          );
        }()),
      ),
      onTapDown: (details) {
        setState(() {
          currColor = widget.tapColor ??
              HSLColor.fromColor(widget.color)
                  .withLightness(
                      HSLColor.fromColor(widget.color).lightness * 0.8)
                  .toColor();
        });
      },
      onTapCancel: () {
        setState(() {
          currColor = widget.color;
        });
      },
      onTap: () {
        widget.onTap();
        setState(() {
          currColor = widget.color;
        });
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
