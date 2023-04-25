import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPage extends StatelessWidget {
  final LatLng _center = const LatLng(-6.1751, 106.865);
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('Monumen Nasional'),
      position: LatLng(-6.1751, 106.8272),
      infoWindow: InfoWindow(
        title: 'Monumen Nasional',
        snippet: 'Jakarta, Indonesia',
      ),
    ),
    Marker(
      markerId: MarkerId('Taj Mahal'),
      position: LatLng(27.1750, 78.0422),
      infoWindow: InfoWindow(
        title: 'Taj Mahal',
        snippet: 'Agra, India',
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lokasi Wisata'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 5.0,
        ),
        markers: _markers,
      ),
    );
  }
}
