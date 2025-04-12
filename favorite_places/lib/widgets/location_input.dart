import 'dart:convert';

import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationInput extends StatefulWidget {
  final void Function(PlaceLocation location) onSelectLocation;
  const LocationInput({super.key, required this.onSelectLocation});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;

  Future<void> _savePlace(double lng, double lat) async {
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey',
    );

    final response = await http.get(url);

    final responseData = json.decode(response.body);
    final address = responseData['results'][0]['formatted_address'];

    setState(() {
      _pickedLocation = PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: address,
      );
      _isGettingLocation = false;
    });

    widget.onSelectLocation(_pickedLocation!);
  }

  String get locationImage {
    if (_pickedLocation == null) {
      return '';
    }
    String lng = _pickedLocation!.longitude.toString();
    String lat = _pickedLocation!.latitude.toString();
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=$apiKey';
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    setState(() {
      _isGettingLocation = true;
    });

    try {
      // Check if location services are enabled
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          setState(() {
            _isGettingLocation = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location services are disabled')),
          );
          return;
        }
      }

      // Check for location permissions
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          setState(() {
            _isGettingLocation = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permission denied')),
          );
          return;
        }
      }

      // Get location data
      locationData = await location.getLocation();

      final lat = locationData.latitude;
      final lng = locationData.longitude;
      if (lat == null || lng == null) {
        setState(() {
          _isGettingLocation = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not get location coordinates')),
        );
        return;
      }

      // Get address from coordinates
      try {
        _savePlace(lng, lat);
      } catch (error) {
        setState(() {
          _pickedLocation = PlaceLocation(
            latitude: lat,
            longitude: lng,
            address: 'Address not available',
          );
          _isGettingLocation = false;
        });

        widget.onSelectLocation(_pickedLocation!);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not get address: ${error.toString()}')),
        );
      }
    } catch (error) {
      setState(() {
        _isGettingLocation = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location error: ${error.toString()}')),
      );
    }
  }

  void _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(builder: (context) => MapScreen(isSelecting: true)),
    );
    if (selectedLocation == null) {
      return;
    }
    
    // Convert LatLng to PlaceLocation with a temporary address that will be updated
    final tempLocation = PlaceLocation(
      latitude: selectedLocation.latitude,
      longitude: selectedLocation.longitude,
      address: 'Loading address...',
    );
    
    setState(() {
      _pickedLocation = tempLocation;
    });
    
    widget.onSelectLocation(_pickedLocation!);
    _savePlace(selectedLocation.longitude, selectedLocation.latitude);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewcontent = Text(
      "No Location Chosen",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
      ),
    );

    if (_pickedLocation != null) {
      previewcontent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    if (_isGettingLocation) {
      previewcontent = CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: previewcontent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: Icon(Icons.location_on),
              onPressed: _getCurrentLocation,
              label: Text("Get Current Location"),
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              onPressed: _selectOnMap,
              label: Text("Select on Map"),
            ),
          ],
        ),
      ],
    );
  }
}
