import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Core/Provider/service_provider.dart';


class ToDo_Card_Widget extends ConsumerWidget {
  const ToDo_Card_Widget({super.key, required this.getIndex});

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(sstreamProvider);
    return todoData.when(
      data: (todoData) {
        Color catColor = Colors.white;
        final getCategory = todoData[getIndex].category;
        switch (getCategory) {
          case 'Learn':
            catColor = Colors.red;
            break;
          case 'Work':
            catColor = Colors.green;
            break;
          case 'General':
            catColor = Colors.blue;
            break;
        }

        return Container(
          margin: EdgeInsets.symmetric(vertical: 6),
          child: Row(children: [
            Container(
              decoration: BoxDecoration(
                color: catColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
              ),
              width: 12,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: IconButton(
                        icon: Icon(CupertinoIcons.trash),
                        onPressed: () => ref
                            .read(serviceProvider)
                            .deleteTask(todoData[getIndex].documentID),
                      ),
                      title: Text(
                        todoData[getIndex].title!,
                        style: TextStyle(
                            decoration: todoData[getIndex].status!
                                ? TextDecoration.lineThrough
                                : null),
                        maxLines: 1,
                      ),
                      contentPadding: EdgeInsets.zero,
                      subtitle: Text(
                        style: TextStyle(
                            decoration: todoData[getIndex].status!
                                ? TextDecoration.lineThrough
                                : null),
                        todoData[getIndex].description!,
                        maxLines: 2,
                      ),
                      trailing: Checkbox(
                          activeColor: Colors.blue.shade800,
                          value: todoData[getIndex].status,
                          onChanged: (value) => ref
                              .read(serviceProvider)
                              .updateTask(
                                  todoData[getIndex].documentID, value)),
                    ),
                    Transform.translate(
                      offset: Offset(0, -12),
                      child: Container(
                        child: Column(
                          children: [
                            Divider(
                              thickness: 1.4,
                              color: Colors.grey.shade200,
                            ),
                            Row(
                              children: [

                                SizedBox(
                                  width: 5,
                                ),
                                Text(todoData[getIndex].date! +
                                    "  " +
                                    todoData[getIndex].time!)
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
            ))
          ]),
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.white),
        );
      },
      error: (error, stackTrace) => Center(
        child: Text(stackTrace.toString()),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
