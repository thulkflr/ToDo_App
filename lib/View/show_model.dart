import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/Common/Widget/radio_wid.dart';


import '../Common/Widget/date_time_wid.dart';
import '../Common/Widget/text_field_wid.dart';
import '../Consts/app_style.dart';
import '../Core/Models/todo_model.dart';
import '../Core/Provider/date_time_provder.dart';
import '../Core/Provider/radio_provider.dart';
import '../Core/Provider/service_provider.dart';

class AddNewTask_MOdel extends ConsumerWidget {
  AddNewTask_MOdel({super.key});

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datePr = ref.watch(dateProvider);


    return Container(
      padding: EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: double.infinity,
                child: Text(
                  'New Task Todo',
                  textAlign: TextAlign.center,
                  style: AppStyles.headStyle1,
                )),
            Divider(
              thickness: 1.2,
              color: Colors.grey.shade200,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Title Task',
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
            ),
            SizedBox(
              height: 6,
            ),
            TextField_Widget(
              hint_text: 'Add Task Name ',
              max_lines: 1,
              textEditingController: titleController,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Description',
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
            ),
            SizedBox(
              height: 6,
            ),
            TextField_Widget(
              hint_text: 'Add Descriptions',
              max_lines: 5,
              textEditingController: descriptionController,

            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Category',
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Radio_Widget(
                  CatColor: Colors.red,
                  titleRadio: 'Learn',
                  value: 1,
                  onChangedValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 1),
                )),
                Expanded(
                    child: Radio_Widget(
                  CatColor: Colors.green,
                  titleRadio: 'Work',
                  value: 2,
                  onChangedValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 2),
                )),
                Expanded(
                    child: Radio_Widget(
                  CatColor: Colors.blue,
                  titleRadio: 'General',
                  value: 3,
                  onChangedValue: () =>
                      ref.read(radioProvider.notifier).update((state) => 3),
                )),
              ],
            ),
            //Date and Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                  dataText: datePr,
                  iconDa: CupertinoIcons.calendar,
                  text: 'Date',
                  onTap: () async {
                    final getValue = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2031));
                    if (getValue != null) {
                      final format = DateFormat.yMd();
                      ref
                          .read(dateProvider.notifier)
                          .update((state) => format.format(getValue));
                    }
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                DateTimeWidget(
                  dataText: ref.watch(timeProvider),
                  iconDa: CupertinoIcons.time,
                  text: 'Time',
                  onTap: () async {
                    final getTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    if (getTime != null) {
                       ref
                          .read(timeProvider.notifier)
                          .update((state) => getTime.format(context));
                    }
                  },
                )
              ],
            ),
            //Button Section
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade700,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      side: BorderSide(color: Colors.blue.shade800),
                      padding: EdgeInsets.symmetric(vertical: 12)),
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.symmetric(vertical: 12)),
                  onPressed: () {
                    final categoryValue = ref.read(radioProvider);
                    final dateValue = ref.read(dateProvider);
                    final timeValue = ref.read(timeProvider);

                    String cat = '';
                    switch (categoryValue) {
                      case 1:
                        cat = 'Learn';
                        break;
                      case 2:
                        cat = 'Work';
                        break;
                      case 3:
                        cat = 'General';
                        break;
                    }
                    ref.read(serviceProvider).addNewTask(TODO_Model(
                        title: titleController.text,
                        description: descriptionController.text,
                        category: cat,
                        date: dateValue,
                        time: timeValue,
                        status: false));

                    print('AAAAAAAAAAAADDDDDDDDDDDDDEEEEEEEEEEEDDDDDDDDDDD');
                    titleController.clear();
                    descriptionController.clear();
                    ref.read(radioProvider.notifier).update((state) => 0);
                    Navigator.pop(context);
                  },
                  child: Text('Create'),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
