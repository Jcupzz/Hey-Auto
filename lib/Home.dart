import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("users");
  late LatLng currentPostion;

  late GoogleMapController mapController;
  List<Marker> myMarker = [];
  // DocumentSnapshot documentSnapshot;

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    _getUserLocationPermission();
    _getUserLocation();
    _getAllLatLongFromFb();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ElevatedButton(
          //   onPressed: () {
          //     setdata();
          //   },
          //   child: Text("data"),
          // ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: GoogleMap(initialCameraPosition: _kGooglePlex),
          )
        ],
      ),
    );
  }

  setdata() async {
    await ref.set({
      "name": "sdsad",
      "age": 123,
    });
  }

  void _getUserLocation() async {
    var position = await GeolocatorPlatform.instance.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.best));
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

  void _getAllLatLongFromFb() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('allUsers');

    ref.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      myMarker.add(
        Marker(
          markerId: MarkerId(
            const LatLng(2222, 22222).toString(),
          ),
        ),
      );
      print(data);
    });

    // await FirebaseDatabase.instance
    //     .ref("users")
    //     .get()
    //     .then((QuerySnapshot querySnapshot) => querySnapshot.docs.forEach((doc) {
    //           myMarker.add(Marker(
    //               markerId: MarkerId(LatLng(doc['lat'], doc['long']).toString()),
    //               onTap: () {
    //                 setState(() {
    //                   showDetailsButton = true;
    //                   documentSnapshot = doc;
    //                 });
    //               },
    //               position: LatLng(doc['lat'], doc['long']),
    //               infoWindow: InfoWindow(title: doc['iName'], snippet: doc['iAddress'])));
    //         }));
  }

  void _getUserLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    BotToast.showText(text: 'Hello World');

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
