import 'package:flutter/material.dart';
import 'package:flutter_google_street_view/flutter_google_street_view.dart';


class StreetViewPanoramaInitDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Street View in Flutter'),

        ),

        body: SafeArea(
          child: Stack(
            children: [
              FlutterGoogleStreetView(
                initPos: LatLng(37.769263, -122.450727),
                initSource: StreetViewSource.outdoor,
                initBearing: 30,
                initTilt: 30,
                initZoom: 1.5,
                onStreetViewCreated: (controller) async {
                  controller.animateTo(
                      duration: 50,
                      camera: StreetViewPanoramaCamera(
                          bearing: 15, tilt: 10, zoom: 3));
                },
              ),
            ],
          ),
        ),

      );

  }
}