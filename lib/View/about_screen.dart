import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'About Me',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.blue.shade50,
          foregroundColor: Colors.blue),
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CircleAvatar(
                radius: 70, backgroundImage: AssetImage('assets/my_photo.jpg')),
            SizedBox(
              height: 20,
            ),
            Text(
              'Thu Al-Kfl Rababa\'a',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  letterSpacing: 2.5,
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                thickness: 1.3,
                color: Colors.blue,
              ),
            ),
            Card(
              color: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
                title: Text(
                  '+962797291525',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Card(
              color: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                title: Text(
                  'thualkflrbabah@gmail.com',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Card(
              color: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.facebook,
                  color: Colors.white,
                ),
                title: Text(
                  'Thoalkafel M Rababaa',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
