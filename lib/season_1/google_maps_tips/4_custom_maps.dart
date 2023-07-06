import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_project/assets.dart';

class CustomMapStyleScreen extends StatefulWidget {
  @override
  _CustomMapStyleScreenState createState() => _CustomMapStyleScreenState();
}

class _CustomMapStyleScreenState extends State<CustomMapStyleScreen> {
  GoogleMapController? _mapController;
  String? selectedStyle;
  Map<String, String> styleData = {};

  @override
  void initState() {
    _loadStyles();

    super.initState();
  }

  void _loadStyles() async {
    styleData = {
      'Bold Contrast': await rootBundle.loadString(Assets.assets_styles_bold_txt),
      'Elegant Monochrome': await rootBundle.loadString(Assets.assets_styles_elegent_txt),
      'Nighttime Serenity': await rootBundle.loadString(Assets.assets_styles_nighttime_txt),
      'Pastel Dreams': await rootBundle.loadString(Assets.assets_styles_pastel_txt),
      'Vibrant Nature': await rootBundle.loadString(Assets.assets_styles_vibrant_txt),
    };
    setState(() {
      selectedStyle = styleData.keys.first;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _updateMapStyle(String? style) {
    if (style != null) {
      _mapController?.setMapStyle(styleData[style]);
      setState(() {
        selectedStyle = style;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Maps'),
        elevation: 2,
      ),
      body: Stack(
        children: [

          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.77483, -122.41942),
              zoom: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: selectedStyle,
              icon: SizedBox(),
              items: styleData.keys.map((String style) {
                return DropdownMenuItem<String>(
                  value: style,
                  child: Text(style),
                );
              }).toList(),
              onChanged: _updateMapStyle,
            ),
          ),
        ],
      ),
    );
  }
}
