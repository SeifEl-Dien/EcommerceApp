import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextformfield extends StatelessWidget {
  final String text;
  final String hint;
  //final Function onsave;
  final FormFieldSetter<String>? onsave;
  final FormFieldValidator<String>? validator;

  const CustomTextformfield({
    Key? key,
    required this.text,
    required this.hint,
    required this.onsave,
    required this.validator,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            color: Colors.grey.shade900,
            fontsize: 14,
          ),
          TextFormField(
            //onSaved: (newValue) => onsave,
            onSaved: onsave,
            validator: validator,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.white),
          )
        ],
      ),
    );
  }
}
