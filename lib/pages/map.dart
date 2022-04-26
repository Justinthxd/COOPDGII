import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  static const _initialCamaraPosition = CameraPosition(
    target: LatLng(18.502066, -69.8364374),
    zoom: 11.5,
  );

  late GoogleMapController _googleMapController;

  String nombre = '';

  Set<Marker> markers = {};

  myPlace() async {
    try {
      await placemarkFromCoordinates(
        18.4741397,
        -69.9050573,
      ).then(
        (value) {
          markers.add(
            Marker(
              markerId: const MarkerId("1"),
              position: const LatLng(
                18.4741397,
                -69.9050573,
              ),
              infoWindow: InfoWindow(
                title: value[0].name,
              ),
            ),
          );
        },
      );
    } on Exception catch (_) {
      print("Error - Map");
    }
  }

  @override
  void initState() {
    myPlace();
    Timer(const Duration(seconds: 1), () {
      _googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          const CameraPosition(
            target: LatLng(
              18.4741397,
              -69.9050573,
            ),
            zoom: 17,
          ),
        ),
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
      ],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.hybrid,
            initialCameraPosition: _initialCamaraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: markers,
          ),
          Positioned(
            left: 15,
            bottom: 15,
            child: IgnorePointer(
              child: Container(
                height: 70,
                padding: const EdgeInsets.all(10),
                width: size.width - 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                ),
                child: const Text(
                  'Av. Pedro Henríquez Ureña 29, Santo Domingo',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.center_focus_strong,
        ),
        onPressed: () async {
          _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                target: LatLng(
                  18.4741397,
                  -69.9050573,
                ),
                zoom: 17,
              ),
            ),
          );
          setState(() {});
        },
      ),
    );
  }
}
