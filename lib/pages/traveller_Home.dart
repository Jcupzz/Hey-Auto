import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Traveller_Home extends StatefulWidget {
  const Traveller_Home({Key? key}) : super(key: key);

  @override
  State<Traveller_Home> createState() => _Traveller_HomeState();
}

class _Traveller_HomeState extends State<Traveller_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(0, 0),
          ),
        ),
      ),
    );
  }
}
