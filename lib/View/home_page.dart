//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:todo_app/Core/Models/user_model.dart';
//
// import 'package:todo_app/Core/Service/shared_pref.dart';
//
// import 'package:todo_app/View/login_page.dart';
//
// import '../Common/Widget/todo_card.dart';
// import '../Core/Provider/service_provider.dart';
//
// import '../Core/Service/login_service.dart';
// import 'show_model.dart';
//
// class MyHomePage extends ConsumerWidget {
//   MyHomePage(  this.model, {super.key});
//
//
//   // final String? userName;
//   // final String? userPicture;
//
//   final UserModel model;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final indexCo = ref.watch(sstreamProvider);
//     return Scaffold(
//       backgroundColor: Colors.blue.shade50,
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade50,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         title: ListTile(
//           leading: CircleAvatar(
//             backgroundColor: Colors.grey.shade500,
//             radius: 25,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(23),
//               child: Image.network(model.photoUrl.toString()
//                 ,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           title: Text(
//             'Account Name',
//             style: TextStyle(
//                 fontSize: 11,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey.shade700),
//           ),
//           subtitle: Text(model.displayName!,
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black)),
//         ),
//         actions: [
//           ///////////////
//           PopupMenuButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8)),
//               elevation: 0,
//               padding: EdgeInsets.all(6),
//               color: Colors.blue.shade200,
//               icon: Icon(
//                 CupertinoIcons.ellipsis_vertical,
//                 color: Colors.black,
//               ),
//               onSelected: (item) => onSelected(context, item),
//               itemBuilder: (context) => [
//                     PopupMenuItem(
//                         value: 0,
//                         child: Row(
//                           children: [
//                             Icon(Icons.info_outline),
//                             Text(
//                               ' About',
//                               style: TextStyle(
//                                   fontSize: 14, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         )),
//                     PopupMenuItem(
//                         value: 1,
//                         child: Row(
//                           children: [
//                             Icon(Icons.exit_to_app),
//                             Text(' Log Out',
//                                 style: TextStyle(
//                                     fontSize: 14, fontWeight: FontWeight.bold))
//                           ],
//                         ))
//                   ])
//         ],
//       ),
//       body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
//         builder:(context,snapshot) {
//         if(snapshot.connectionState==ConnectionState.waiting)
//           {
//             return Center(child: CircularProgressIndicator(),);
//           }else if(snapshot.hasError)
//             {
//               return Center(child: Text('Something Worng!'),);
//             }
//         else if(snapshot.hasData){
//             return Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: SingleChildScrollView(
//                   child: Container(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               children: [
//                                 Text(
//                                   'Today\'s Task',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                       color: Colors.black),
//                                 ),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.symmetric(vertical: 8.0),
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 3.0),
//                                     child: Text(
//                                         DateTime.now().day.toString() +
//                                             '/' +
//                                             DateTime.now().month.toString() +
//                                             '/' +
//                                             DateTime.now().year.toString(),
//                                         style: TextStyle(
//                                             color: Colors.grey.shade700,
//                                             fontWeight: FontWeight.w600)),
//                                   ),
//                                 ),
//                               ],
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                             ),
//                             ElevatedButton(
//                               onPressed: () => showModalBottomSheet(
//                                   isScrollControlled: true,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(15)),
//                                   context: context,
//                                   builder: (context) => AddNewTask_MOdel()),
//                               child: Text(
//                                 '+ New Task',
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.blue.shade100,
//                                   foregroundColor: Colors.blue.shade800,
//                                   elevation: 0,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8))),
//                             )
//                           ],
//                         ),
//                         //List of Tasks
//                         SizedBox(
//                           height: 20,
//                         ),
//
//                         FutureBuilder<Widget>(
//                           builder: (context, snapshot) {
//                             if (indexCo.value!.isEmpty) {
//                               return Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 60.0),
//                                 child: Center(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         height: 65,
//                                       ),
//                                       Image.asset(
//                                         'assets/sadList.png',
//                                         scale: 2,
//                                       ),
//                                       SizedBox(
//                                         height: 20,
//                                       ),
//                                       Text(
//                                         'Add Task Todo',
//                                         style: TextStyle(
//                                             color: Colors.blue.shade200,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 25),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             }
//                             return ListView.builder(
//                                 physics: ScrollPhysics(),
//                                 itemCount: indexCo.value!.length,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) {
//                                   {
//                                     print(indexCo.value!.length);
//                                     return Center(
//                                         child: ToDo_Card_Widget(
//                                       getIndex: index,
//                                     ));
//                                   }
//                                 });
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ));
//           }
//         else{
//           return LogIn_Page();
//         }
//         },
//       ),
//     );
//   }
// }
//
// void onSelected(context, int item) {
//   switch (item) {
//     case 0:
//       break;
//     case 1:
//       {
//         showDialog<String>(
//             context: context,
//             builder: (context) => AlertDialog(
//                   title: Text(
//                     'Sign Out !',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                   ),
//                   content: Text(
//                     'Are you sure? ',
//                     style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey.shade800),
//                   ),
//                   actions: <Widget>[
//                     IconButton(
//                       icon: Icon(
//                         CupertinoIcons.xmark,
//                         color: Colors.red,
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                     Spacer(),
//                     IconButton(
//                       icon: Icon(
//                         CupertinoIcons.check_mark,
//                         color: Colors.green,
//                       ),
//                       onPressed: () async {
//                    //     print(auth.currentUser);
//
//                         Navigator.pop(context);
//                      //   print(auth.currentUser);
//                         await logOut();
//                          Prefs.removeDATA('uid');
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => LogIn_Page()));
//                       },
//                     ),
//                   ],
//                 ));
//       }
//       break;
//   }
//}
//

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/Core/Models/user_model.dart';

import 'package:todo_app/Core/Service/shared_pref.dart';

import 'package:todo_app/View/login_page.dart';

import '../Common/Widget/todo_card.dart';
import '../Core/Provider/service_provider.dart';

import '../Core/Service/login_service.dart';
import 'about_screen.dart';
import 'show_model.dart';

class MyHomePage extends ConsumerWidget {
  MyHomePage(this.model, {super.key});

  // final String? userName;
  // final String? userPicture;

  final UserModel model;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexCo = ref.watch(sstreamProvider);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        foregroundColor: Colors.black,
        elevation: 0,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade500,
            radius: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Image.network(
                model.photoUrl.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            'Account Name',
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700),
          ),
          subtitle: Text(model.displayName!,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        actions: [
          ///////////////
          PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 0,
              padding: EdgeInsets.all(6),
              color: Colors.blue.shade100,
              icon: Icon(
                CupertinoIcons.ellipsis_vertical,
                color: Colors.black,
              ),
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    PopupMenuItem(
                        value: 0,
                        child: Row(
                          children: [
                            Icon(Icons.info_outline),
                            Text(
                              ' About Me',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    PopupMenuItem(
                        value: 1,
                        child: Row(
                          children: [
                            Icon(Icons.exit_to_app),
                            Text(' Log Out',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold))
                          ],
                        ))
                  ])
        ],
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Today\'s Task',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Text(
                                  DateTime.now().day.toString() +
                                      '/' +
                                      DateTime.now().month.toString() +
                                      '/' +
                                      DateTime.now().year.toString(),
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      ElevatedButton(
                        onPressed: () => showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            context: context,
                            builder: (context) => AddNewTask_MOdel()),
                        child: Text(
                          '+ New Task',
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade100,
                            foregroundColor: Colors.blue.shade800,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                      )
                    ],
                  ),
                  //List of Tasks
                  SizedBox(
                    height: 20,
                  ),
                  if (indexCo.value != null)
                    FutureBuilder<Widget>(
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (indexCo.value != null &&
                            indexCo.value!.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 60.0),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 65,
                                  ),
                                  Image.asset(
                                    'assets/sadList.png',
                                    scale: 2,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Add Task Todo',
                                    style: TextStyle(
                                        color: Colors.blue.shade200,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                        if (indexCo.value!.isNotEmpty) {
                          return ListView.builder(
                              physics: ScrollPhysics(),
                              itemCount: indexCo.value?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                {
                                  print('asdasdas ${indexCo.value?.length}');
                                  return Center(
                                      child: ToDo_Card_Widget(
                                    getIndex: index,
                                  ));
                                }
                              });
                        }
                        return Center(
                          child: Text('No Tasks'),
                        );
                      },
                    ),
                ],
              ),
            ),
          )),
    );
  }
}

void onSelected(context, int item) {
  switch (item) {
    case 0:
      {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AboutScreen()));
      }
      break;
    case 1:
      {
        showDialog<String>(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    'Sign Out !',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  content: Text(
                    'Are you sure? ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.xmark,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.check_mark,
                        color: Colors.green,
                      ),
                      onPressed: () async {
                        //     print(auth.currentUser);
                        Navigator.pop(context);
                        //   print(auth.currentUser);

                        LogInService().logout();

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LogIn_Page()));
                      },
                    ),
                  ],
                ));
      }
      break;
  }
}
