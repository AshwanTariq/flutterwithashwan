import 'package:flutter/material.dart';
import 'package:flutter_project/season_1/google_maps_tips/1_custom_makers.dart';
import 'package:flutter_project/season_1/google_maps_tips/2_flutter_geofancing.dart';
import 'package:flutter_project/season_1/google_maps_tips/3_polygons_polylines.dart';
import 'package:flutter_project/season_1/google_maps_tips/4_custom_maps.dart';
import 'package:flutter_project/season_1/least_used_widgets/4_sliverFillViewport.dart';
import 'package:flutter_project/season_1/least_used_widgets/5_indexed_stack.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
      home: CustomMapStyleScreen(),
    );
  }
}
