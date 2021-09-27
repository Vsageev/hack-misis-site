import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm({
    Key? key,
    required this.textController,
    this.enabled = true,
    this.onChaned,
    this.hintStyle,
    this.margin,
    this.hintText,
    this.width,
    this.inputType,
    this.maxLines,
    this.maxLength,
  }) : super(key: key);

  final TextEditingController textController;
  final bool enabled;
  final Function(String)? onChaned;
  final TextStyle? hintStyle;
  final EdgeInsetsDirectional? margin;
  final String? hintText;
  final double? width;
  final TextInputType? inputType;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // padding: EdgeInsets.symmetric(horizontal: 3, vertical: 0),
      margin: margin,
      child: TextField(
        maxLength: maxLength,
        onChanged: onChaned,
        maxLines: maxLines,
        enabled: enabled,
        controller: textController,
        style: TextStyle(fontSize: 20, color: Colors.black),
        keyboardType: inputType,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.all(8),
          hintText: hintText,
          hintStyle: hintStyle ??
              TextStyle(
                color: Colors.grey,
              ),
          // border: InputBorder.none,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
