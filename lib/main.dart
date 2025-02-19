import 'package:flutter/material.dart';
import 'AdmitDataScreen.dart' as AdmitScreen;
import 'RoomDetailScreen.dart' as RoomScreen;

void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/admitData': (context) => AdmitScreen.AdmitDataScreen(),
        '/roomDetail': (context) => RoomScreen.RoomDetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/admitData');
              },
              child: const Text('Go to Admit Data Screen'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/roomDetail');
              },
              child: const Text('Go to Room Detail Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
