import 'package:egr302_empty_room/ProfilePage.dart';
import 'package:flutter/material.dart';

class TEMP_NavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Example of a button to navigate onto additional pages
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => YOUR_PAGE_NAME()),
            //     );
            //   },
            //   child: Text('Go to YOUR PAGE NAME'),
            // ),
          ],
        ),
      ),
    );
  }
}