import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:io' show Platform;

class MapScreen extends StatefulWidget {
  final PlaceLocation? location;
  final bool isSelecting;

  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      latitude: 37.422,
      longitude: -122.084,
      address: '',
    ),
    this.isSelecting = true,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _updateMarkers();
  }

  void _updateMarkers() {
    final markerPosition = _pickedLocation ?? 
        LatLng(
          widget.location!.latitude,
          widget.location!.longitude,
        );
        
    setState(() {
      _markers = {
        Marker(
          markerId: const MarkerId('m1'),
          position: markerPosition,
        ),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isSelecting ? 'Pick your Location' : 'Your Location',
        ),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Navigator.of(context).pop(
                  _pickedLocation ?? 
                  LatLng(
                    widget.location!.latitude,
                    widget.location!.longitude,
                  )
                );
              },
            ),
        ],
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onTap: !widget.isSelecting
            ? null
            : (position) {
                setState(() {
                  _pickedLocation = position;
                  _updateMarkers();
                });
              },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.location!.latitude, 
            widget.location!.longitude
          ),
          zoom: 16,
        ),
        markers: _markers,
        onMapCreated: (controller) {
          // This ensures the map is properly initialized on iOS
          if (Platform.isIOS) {
            Future.delayed(const Duration(milliseconds: 100), () {
              controller.animateCamera(
                CameraUpdate.newLatLng(
                  LatLng(
                    widget.location!.latitude,
                    widget.location!.longitude,
                  ),
                ),
              );
            });
          }
        },
      ),
    );
  }
}
