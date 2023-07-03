import 'package:flutter/material.dart';
import 'package:flutter_heat_map/flutter_heat_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HeatmapMapWidget extends StatefulWidget {
  @override
  _HeatmapMapWidgetState createState() => _HeatmapMapWidgetState();
}

class _HeatmapMapWidgetState extends State<HeatmapMapWidget> {
  GoogleMapController? _mapController;
  HeatMapController? _heatmapController;

  @override
  void initState() {
    super.initState();
    _heatmapController = HeatMapController();
    _addHeatmapPoints();
  }

  @override
  void dispose() {
    _heatmapController?.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _addHeatmapPoints() {
    List<WeightedLatLng> heatmapPoints = [
      WeightedLatLng(LatLng(37.0902, -95.7129), 331002651), // USA
      WeightedLatLng(LatLng(35.8617, 104.1954), 1439323776), // China
      // Add more heatmap points as needed
    ];

    _heatmapController?.addDataPoints(heatmapPoints);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heatmap Map'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(0, 0),
              zoom: 2,
            ),
          ),
          HeatMap(
            heatmapController: _heatmapController,
            opacity: 0.8,
            radius: 40,
            colorGradient: HeatMapGradient(
              colors: [Colors.green, Colors.red],
              startPoints: [0.2, 0.8],
            ),
          ),
        ],
      ),
    );
  }
}
