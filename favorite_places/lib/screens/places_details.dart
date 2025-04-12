import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PlacesDetails extends StatelessWidget {
  final Place place;
  final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';

  PlacesDetails({super.key, required this.place});

  String get locationImage {
    String lng = place.location!.longitude.toString();
    String lat = place.location!.latitude.toString();
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=$apiKey';
  }

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
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(locationImage),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Text(
                    place.location!.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
