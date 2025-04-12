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
  late Future<void> _placesFuture;
  bool _isInit = false;
  
  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(placesProvider.notifier).loadPlaces();
  }

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      _refreshPlaces();
      _isInit = true;
    }
    super.didChangeDependencies();
  }
  
  Future<void> _refreshPlaces() async {
    setState(() {
      _placesFuture = ref.read(placesProvider.notifier).loadPlaces();
    });
  }

  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const NewPlace())
              );
              // Refresh places list when coming back from NewPlace screen
              _refreshPlaces();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: _placesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'An error occurred: ${snapshot.error}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 16,
                ),
              ),
            );
          }
          
          if (places.isEmpty) {
            return Center(
              child: Text(
                "No places added yet",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 20,
                ),
              ),
            );
          }
          
          // Show the list of places
          return ListView.builder(
            itemCount: places.length,
            itemBuilder: (context, index) {
              final place = places[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                elevation: 2,
                child: ListTile(
                  leading: Hero(
                    tag: place.id,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage: FileImage(place.image!),
                    ),
                  ),
                  title: Text(
                    place.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  subtitle: Text(
                    place.location!.address,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => PlacesDetails(place: place),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
