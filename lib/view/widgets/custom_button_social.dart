import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String text;
  final String imageasset;
  final Function() onPressed;

  const CustomButtonSocial(
      {Key? key,
      required this.text,
      required this.imageasset,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade100),
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Row(
            children: [
              Image.asset(imageasset),
              const SizedBox(width: 90),
              CustomText(
                text: text,
              )
            ],
          )),
    );
  }
}
