import 'package:egr302_empty_room/ProfilePage.dart';
import 'package:egr302_empty_room/RoomDetailScreen.dart';
import 'package:egr302_empty_room/MainScreen.dart';
import 'package:egr302_empty_room/login_page.dart';
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
            //TODO: Copy the code below to create a button that navigates to your page
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => YOUR_PAGE_NAME()),
            //     );
            //   },
            //   child: Text('Go to YOUR PAGE NAME'),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoomDetailScreen()),
                );
              },
              child: Text('Go to Room Detail Screen',
              style: TextStyle(
                color: Colors.white,
              ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Go to Login Page',
              style: TextStyle(
                color: Colors.white,
              ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Text('Go to Profile Page',
              style: TextStyle(
                color: Colors.white,
              ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageTilePage()),
                );
              },
              child: Text('Go to Main Page',
              style: TextStyle(
                color: Colors.white,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}