import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  double lat;
  double lng;

  MapScreen({super.key, required this.lat, required this.lng});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 16,
        ),
        markers: <Marker>{
          Marker(
            markerId: const MarkerId('location'),
            position: LatLng(lat, lng),
            infoWindow: const InfoWindow(
              title: 'Address',
            ),
          ),
        },
      ),
    );
  }
}
