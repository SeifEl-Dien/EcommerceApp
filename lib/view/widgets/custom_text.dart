import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontsize;
  final Color color;
  final Alignment alignment;
  final int maxlines;
  final double height;

  const CustomText(
      {Key? key,
      this.text = '',
      this.fontsize = 16,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.maxlines = 100,
      this.height = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(color: color, fontSize: fontsize, height: height),
        maxLines: maxlines,
      ),
    );
  }
}
