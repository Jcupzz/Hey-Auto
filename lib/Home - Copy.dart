import 'dart:async';
import 'dart:ffi';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hey_auto/static/Circular_Loading.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  bool showDetailsButton = false;
  late GoogleMapController mapController;
  List<Marker> myMarker = [];
  // DocumentSnapshot documentSnapshot;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

//
  LatLng currentPostion = const LatLng(11.783793, 75.514826);

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (position != null) {
      setState(() {
        currentPostion = LatLng(position.latitude, position.longitude);
      });
    } else {
      setState(() {
        currentPostion = LatLng(56.53455, 65.4533434);
      });
    }
  }

  void getPolyPoints() async {}

  void _getAllLatLongFromFb() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('allUsers');
    print("Hello");
    ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      // print(data.toString());

      String lat = data.toString().substring(5, 15);
      String long = data.toString().substring(21, 32);

      // print(lat);
      // print(long);
      // String datas = data.toString();
      // List<String> ss = datas
      //     .substring(datas.indexOf("(") + 1, datas.lastIndexOf(")"))
      //     .split(",");

      // print(ss.toString());
      var latitude = double.tryParse(lat);
      var longitude = double.tryParse(long);
      // print("longitude = " + longitude.toString());

      // print("latitude = " + latitude.toString());
      setState(() {
        myMarker.add(Marker(
            markerId: MarkerId(latitude.toString()),
            position: LatLng(latitude ?? 10.174826, longitude ?? 76.577532)));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllLatLongFromFb();
    _getUserLocationPermission();
    _getUserLocation();
  }

//
  late Set<Marker> marker;
  late LatLng latLngs;
  late LatLng sourceLocation = LatLng(0, 0);
  late LatLng destination = LatLng(10, 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: currentPostion != null
          ? SafeArea(
              child: Stack(
                children: [
                  GoogleMap(
                    mapToolbarEnabled: true,
                    buildingsEnabled: true,
                    mapType: MapType.hybrid,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    markers: Set.from(myMarker),

                    // markers: {
                    //   Marker(
                    //       markerId: MarkerId("source"),
                    //       position: sourceLocation),
                    //   Marker(
                    //       markerId: MarkerId("destination"),
                    //       position: destination)
                    //       ,
                    //       myMarker
                    // },
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: currentPostion,
                      zoom: 10,
                    ),
                  ),
                  (showDetailsButton)
                      ? Positioned(
                          bottom: 18,
                          left: 0,
                          child: Container(
                            height: 38,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: ElevatedButton(
                                onPressed: () async {},
                                child: Text(
                                  "Show Details",
                                  style: TextStyle(color: Colors.black),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white70,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                          ))
                      : Container(),
                ],
              ),
            )
          : Circular_Loading(),
    );
  }

  //functions
  //functions
  //functions

  void _getUserLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      BotToast.showText(text: 'Location services are disabled');
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      BotToast.showText(
          text:
              'Location permissions are permantly denied, we cannot request permissions');
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        BotToast.showText(
            text:
                'Location permissions are denied (actual value: $permission)');
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }
  }
}
