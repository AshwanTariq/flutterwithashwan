import 'package:flutter/material.dart';
import 'package:flutter_project/season_1/google_maps_tips/1_custom_makers.dart';
import 'package:flutter_project/season_1/least_used_widgets/4_sliverFillViewport.dart';
import 'package:flutter_project/season_1/least_used_widgets/5_indexed_stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black38),
        useMaterial3: true,
      ),
      home:  CustomMarkerMapScreen(),
    );
  }
}
