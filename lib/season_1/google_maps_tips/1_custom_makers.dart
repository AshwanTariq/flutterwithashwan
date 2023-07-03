import 'package:flutter/material.dart';
import 'package:flutter_project/assets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:assets_gen/assets_gen.dart';

class CustomMarkerMapScreen extends StatefulWidget {
  @override
  _CustomMarkerMapScreenState createState() => _CustomMarkerMapScreenState();
}

class _CustomMarkerMapScreenState extends State<CustomMarkerMapScreen> {
  GoogleMapController? _mapController;
  BitmapDescriptor? customIcon;
  Set<Marker> _markers = Set<Marker>();

  @override
  void initState() {
    getIcon();
    super.initState();
  }
  void _addMarker(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude,);
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
  Future<void> getIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(20, 20)),
      Assets.assets_images_location_png,
    );
}
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Marker Example'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        onTap: (LatLng position) {
          _addMarker(position);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(37.77483, -122.41942),
          zoom: 14,
        ),
        markers: _markers,
      ),
    );
  }
}
