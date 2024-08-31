import 'package:flutter/material.dart';

import 'features/album/album_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Album Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlbumScreen(),
    );
  }
}
