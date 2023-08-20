


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Core/Service/login_service.dart';
import 'home_page.dart';


class LogIn_Page extends StatelessWidget {
  LogIn_Page({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome ',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800),
          ),
          SizedBox(
            height: 50,
          ),
          Image.asset('assets/Todo.png'),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade100,
                foregroundColor: Colors.blue.shade700,
                elevation: 0,
                side: BorderSide(color: Colors.blue.shade50),
              ),
              onPressed: () async {
                var result=   await LogInService().signInWithGoogle(context);
                var userData =    await  LogInService().getUserData(result);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyHomePage(
                                userData)));

              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'G',
                    style: TextStyle(color: Colors.blue.shade800),
                  ),
                  Text(
                    'o',
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(
                    'o',
                    style: TextStyle(color: Colors.amber),
                  ),
                  Text(
                    'g',
                    style: TextStyle(color: Colors.blue.shade800),
                  ),
                  Text(
                    'l',
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    'e',
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(' Log In',
                      style: TextStyle(color: Colors.blue.shade800)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

