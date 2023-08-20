import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextField_Widget extends StatelessWidget {
  const TextField_Widget(
      {super.key,
      required this.hint_text,
      required this.max_lines,
      required this.textEditingController});

  final String hint_text;
  final int max_lines;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
          controller: textEditingController,
          // onSubmitted: (value){
          //   log('askjdaklsd : $value');
          //   textEditingController.text = value;
          // },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            suffix: IconButton(
              icon: Icon(
                CupertinoIcons.xmark,
                color: Colors.red,
              ),
              onPressed: () {
                 textEditingController.clear();
              },
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hint_text,
          ),
          maxLines: max_lines,
        ));
  }
}
