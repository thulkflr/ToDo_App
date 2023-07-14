import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextField_Widget extends StatefulWidget {
  const TextField_Widget(
      {super.key,
      required this.hint_text,
      required this.max_lines,
      required this.textEditingController});

  final String hint_text;
  final int max_lines;
  final TextEditingController textEditingController;


  @override
  State<TextField_Widget> createState() => _TextField_WidgetState();
}

class _TextField_WidgetState extends State<TextField_Widget> {
  @override
  Widget build(BuildContext context) {
// ref.read(radioProvider.notifier).update((state) => 1
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8)),
        child: TextField(
          onSubmitted: (String string) {
            setState(() {

            });
          },
          controller: widget.textEditingController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            suffix: IconButton(
              icon: Icon(
                CupertinoIcons.xmark,
                color: Colors.red,
              ),
              onPressed: () {
                widget.textEditingController.clear();
              },
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: widget.hint_text,
          ),
          maxLines: widget.max_lines,
        ));
  }
}
