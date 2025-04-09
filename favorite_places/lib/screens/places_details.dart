import 'dart:ffi';

import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlacesDetails extends StatelessWidget {
  final Place place;
  const PlacesDetails({super.key, required this.place});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(
        children: [
          Image.file(
            place.image!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}
