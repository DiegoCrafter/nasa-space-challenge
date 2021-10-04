import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key key}) : super(key: key);

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-12.0860707, -77.0456632),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Set<Circle> circles = Set.from([
    Circle(
      circleId: CircleId('1'),
      center: LatLng(-12.0860707, -77.0456632),
      radius: 400,
      strokeWidth: 1,
      fillColor: Colors.blue.withOpacity(0.5),
      strokeColor: Colors.blue
    ),
    Circle(
      circleId: CircleId('2'),
      center: LatLng(-12.1111748, -77.0355562),
      radius: 1500,
      strokeWidth: 1,
      fillColor: Colors.orange.withOpacity(0.5),
      strokeColor: Colors.orange
    ),
     Circle(
      circleId: CircleId('3'),
      center: LatLng(-12.0709532, -77.0362226),
      radius: 1500,
      strokeWidth: 1,
      fillColor: Colors.red.withOpacity(0.5),
      strokeColor: Colors.red
    )
  ]);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: true,
        buildingsEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        circles: circles,
      ),
      
      backgroundColor: Colors.black,
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
