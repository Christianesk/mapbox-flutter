import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_maps/src/views/config/config.dart';

class FullSreenMap extends StatefulWidget {
  @override
  _FullSreenMapState createState() => _FullSreenMapState();
}

class _FullSreenMapState extends State<FullSreenMap> {

  MapboxMapController mapController;

  final center = LatLng(-0.369397, -78.455147);
  String selectedStyle = 'mapbox://styles/rickesk91/cklu03nqd1eft17qf4798nc78';
  final darkStyle = 'mapbox://styles/rickesk91/ckltzdl3m1h9s17qtczlusv6t';
  final streetStyle = 'mapbox://styles/rickesk91/cklu03nqd1eft17qf4798nc78';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _createMap(),
      floatingActionButton: floatButtom(),
    );
  }

  Column floatButtom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[

        //Symbols

        FloatingActionButton(
          child: Icon(Icons.add_location_alt),
          onPressed: () {
            mapController.addSymbol(SymbolOptions(
              geometry: center,
              textField: 'Park',
              iconSize: 3,
              iconImage: 'attraction-15',
              textOffset: Offset(0,2)
            ));
          },
        ),

        SizedBox(height: 5),

        //Zoom In

        FloatingActionButton(
          child: Icon(Icons.zoom_in),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomIn());
          },
        ),

        SizedBox(height: 5),

        //Zoom out

        FloatingActionButton(
          child: Icon(Icons.zoom_out),
          onPressed: () {
            mapController.animateCamera(CameraUpdate.zoomOut());
          },
        ),

        SizedBox(height: 5),

        //Change Style
        FloatingActionButton(
          child: Icon(Icons.add_to_home_screen),
          onPressed: () {
            setState(() {
              if (selectedStyle == darkStyle) {
                selectedStyle = streetStyle;
              } else {
                selectedStyle = darkStyle;
              }
            });
          },
        )
      ],
    );
  }

  MapboxMap _createMap() {
    return MapboxMap(
        styleString: selectedStyle,
        accessToken: accessTokenMapBox,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: center, zoom: 16));
  }
}
