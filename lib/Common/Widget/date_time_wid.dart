import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget(
      {super.key,
      required this.text,
      required this.dataText,
      required this.iconDa,
      required this.onTap});

  final String text;
  final String dataText;
  final VoidCallback onTap;
  final IconData iconDa;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            )),
        SizedBox(
          height: 6,
        ),
        Material(
          child: Ink(
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => onTap(),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent),
                  child: Row(
                    children: [
                      Icon(iconDa),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        dataText,
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      )
                    ],
                  )),
            ),
          ),
        )
      ])),
    );
  }
}
