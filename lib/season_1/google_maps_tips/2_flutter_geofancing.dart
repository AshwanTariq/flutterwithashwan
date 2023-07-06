/*
import 'package:flutter/material.dart';
import 'package:easy_geofencing/easy_geofencing.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';

import '../../assets.dart';

class Geofancing extends StatefulWidget {
  @override
  _GeofancingState createState() => _GeofancingState();
}

class _GeofancingState extends State<Geofancing> with WidgetsBindingObserver {
  late GoogleMapController _mapController;
  Set<Circle> _circles = {};
  BitmapDescriptor? customIcon;
  Set<Marker> _markers = Set<Marker>();

  String _geofenceStatus = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    // Initialize EasyGeofencing
    // Add geofence region
    _addGeofenceRegion();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  void _addGeofenceRegion() async {
    try {

      // Add the geofence region
      EasyGeofencing.startGeofenceService(
          eventPeriodInSeconds: 5,
          pointedLatitude: "33.4015376",
          pointedLongitude: "73.2554393",
          radiusMeter: "1000.0");
      // Add a circle to the map for visualization
      _circles.add(
        Circle(
          circleId: CircleId("1"),
          center: LatLng(33.4015376, 73.2554393),
          radius: 10000.0,
          fillColor: Colors.blue.withOpacity(0.3),
          strokeColor: Colors.blue,
        ),
      );
      EasyGeofencing.getGeofenceStream()?.listen((event) {
        setState(() {
          // Get Status Stream
          _geofenceStatus=event.toString();
        });
      });

      // Move the map camera to the geofence region
      _mapController.moveCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(33.5015376, 73.1554393),
          14.0,
        ),
      );
    } on PlatformException catch (e) {
      print('Failed to add geofence region: ${e.message}');
    }
  }

  Future<void> getIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(20, 20)),
      Assets.assets_images_location_png,
    );
  }

  void _addMarker(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      setState(() {
        
        _markers.add(
          Marker(
            markerId: MarkerId(position.toString()),
            position: position,
            infoWindow: InfoWindow(
              title: placemark.name ?? '',
              snippet: placemark.thoroughfare ?? '',
            ),
            icon: customIcon!,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(placemark.name ?? ''),
                    content: Text(placemark.thoroughfare ?? ''),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geofencing Example'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,

            onMapCreated: (controller) {
              _mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target:   LatLng(33.5015376, 73.1554393),
              zoom: 10.0,
            ),
            onTap: (LatLng position) {
              _addMarker(position);
            },
            circles: _circles,
            markers: _markers,
          ),
          Positioned(
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
            child: Text(
              _geofenceStatus,

              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.amber,backgroundColor: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

*/
