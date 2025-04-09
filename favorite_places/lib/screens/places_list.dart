import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/screens/new_place.dart';
import 'package:favorite_places/screens/places_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class PlacesListScreen extends ConsumerStatefulWidget {
  const PlacesListScreen({super.key});

  @override
  ConsumerState<PlacesListScreen> createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends ConsumerState<PlacesListScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text(
        "No placess added yet",
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontSize: 20,
        ),
      ),
    );
    final places = ref.watch(placesProvider);

    if (places.isNotEmpty) {
      content = ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => PlacesDetails(place: places[index]),
                ),
              );
            },
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (ctx) => NewPlace()));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
