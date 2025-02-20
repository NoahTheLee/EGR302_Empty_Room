import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ImageTilePage(),
  ));
}

class ImageTilePage extends StatefulWidget {
  @override
  _ImageTilePageState createState() => _ImageTilePageState();
}

class _ImageTilePageState extends State<ImageTilePage> {
  List<Map<String, String>> allTiles = [
    {"image": "https://picsum.photos/id/1/800/400", "text": "TEGR106"},
    {"image": "https://picsum.photos/id/2/800/400", "text": "TEGR107"},
    {"image": "https://picsum.photos/id/3/800/400", "text": "TEGR214"},
    {"image": "https://picsum.photos/id/4/800/400", "text": "TEGR222"},
    {"image": "https://picsum.photos/id/5/800/400", "text": "TEGR229"},
    {"image": "https://picsum.photos/id/6/800/400", "text": "BUS214"},
    {"image": "https://picsum.photos/id/7/800/400", "text": "BUS226"},
    {"image": "https://picsum.photos/id/8/800/400", "text": "MHALL106"},
    {"image": "https://picsum.photos/id/9/800/400", "text": "JAMES411"},
    {"image": "https://picsum.photos/id/10/800/400", "text": "JAMES412"},
  ];

  List<Map<String, String>> tiles = [];
  final List<String> times = ["9am - 12pm", "10am - 1pm", "11am - 2pm", "12pm - 3pm"];

  @override
  void initState() {
    super.initState();
    tiles = List.from(allTiles);
  }

  // Sorting function
  void sortTiles(bool ascending) {
    setState(() {
      tiles.sort((a, b) => ascending ? a["text"]!.compareTo(b["text"]!) : b["text"]!.compareTo(a["text"]!));
    });
    Navigator.pop(context);
  }

  // Filtering function (Only TEGR rooms)
  void filterTEGR() {
    setState(() {
      tiles = allTiles.where((tile) => tile["text"]!.startsWith("TEGR")).toList();
    });
    Navigator.pop(context);
  }

  // Reset to show all
  void showAll() {
    setState(() {
      tiles = List.from(allTiles);
    });
    Navigator.pop(context);
  }

  // Profile button tapped (open drawer)
  void profileButtonTapped() {
    print("Profile button pressed");
    Scaffold.of(context).openEndDrawer();  // Open the drawer from the right
  }

  // Tile tapped
  void tileTapped(String tileText) {
    print("$tileText tile pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Right Drawer (40% of screen width)
      endDrawer: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("Filters & Sorting", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              ListTile(
                leading: Icon(Icons.sort_by_alpha),
                title: Text("A → Z"),
                onTap: () => sortTiles(true),
              ),
              ListTile(
                leading: Icon(Icons.sort_by_alpha),
                title: Text("Z → A"),
                onTap: () => sortTiles(false),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.filter_alt),
                title: Text("Only TEGR"),
                onTap: filterTEGR,
              ),
              ListTile(
                leading: Icon(Icons.clear),
                title: Text("Show All"),
                onTap: showAll,
              ),
            ],
          ),
        ),
      ),

      // App Bar
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove default back button
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: profileButtonTapped,
            child: AnimatedScale(
              scale: 1.0, // Adjust the scale effect for feedback
              duration: Duration(milliseconds: 100),
              child: CircleAvatar(
                backgroundColor: Colors.purple, // Profile circle color
                child: Icon(Icons.person, color: Colors.white), // Profile icon
              ),
            ),
          ),
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.sort),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),

      // Image Tiles
      body: ListView(
        children: tiles.map((tile) {
          String randomTime = times[Random().nextInt(times.length)];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: GestureDetector(
              onTap: () => tileTapped(tile["text"]!),
              child: Stack(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      tile["image"]!,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Right Box Overlay (Time)
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 100,
                      color: Colors.black.withOpacity(0.6),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          randomTime,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  // Center Overlay Text (Room Name)
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      padding: EdgeInsets.all(8),
                      color: Colors.black.withOpacity(0.6),
                      child: Text(
                        tile["text"]!,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
