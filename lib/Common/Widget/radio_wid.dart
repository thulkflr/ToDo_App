import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Core/Provider/radio_provider.dart';


class Radio_Widget extends ConsumerWidget {
  const Radio_Widget({
    super.key,
    required this.titleRadio,
    required this.CatColor,
    required this.value,
    required this.onChangedValue,
  });

  final String titleRadio;
  final Color CatColor;
  final int value;
  final VoidCallback onChangedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radioPr = ref.watch(radioProvider);
    return Theme(
      data: ThemeData(unselectedWidgetColor: CatColor),
      child: RadioListTile(
        activeColor: CatColor,
        contentPadding: EdgeInsets.zero,
        value: value,
        groupValue: radioPr,
        onChanged: (value)=>onChangedValue(),
        title: Transform.translate(
            offset: Offset(-22, 0),
            child: Text(
              titleRadio,
              style: TextStyle(
                  color: CatColor, fontSize: 12, fontWeight: FontWeight.w700),
            )),
      ),
    );
  }
}
