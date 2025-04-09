import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';

class PlacesDetails extends StatelessWidget {
  final Place place;
  const PlacesDetails({super.key, required this.place});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Center(
        child: Text(
          place.title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
