import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final _enteredTitle = TextEditingController();

  void _savePlace() {
    if (_enteredTitle.text.isEmpty || _enteredTitle.text.length <= 1) {
      return;
    }
    final place = Place(title: _enteredTitle.text);
    final wasAdded = ref.read(placesProvider.notifier).toggleplaces(place);
  }

  @override
  void dispose() {
    _enteredTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new place')),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text,
                maxLength: 40,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                ),

                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter a title for the place',
                  labelStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  hintStyle: TextStyle(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                controller: _enteredTitle,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  _savePlace();
                  Navigator.of(context).pop();
                },
                label: Text("Add Place"),
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
