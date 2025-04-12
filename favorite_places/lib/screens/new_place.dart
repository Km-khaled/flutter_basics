import 'dart:io';
import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/place_provider.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final _enteredTitle = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _pickedLocation;

  void _selectImage(File image) {
    _pickedImage = image;
  }

  void _savePlace() {
    // Check if all required fields are filled
    if (_enteredTitle.text.isEmpty ||
        _enteredTitle.text.length <= 1 ||
        _pickedImage == null ||
        _pickedLocation == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Error',
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
          content: Text(
            'Please provide a valid title, image, and location.',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return; 
    }
    
    final place = Place(
      title: _enteredTitle.text,
      image: _pickedImage!,
      location: _pickedLocation,
    );
    ref.read(placesProvider.notifier).toggleplaces(place);
    
    // Return to previous screen after saving
    Navigator.of(context).pop();
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
              const SizedBox(height: 15),
              ImageInput(_selectImage),
              const SizedBox(height: 15),
              LocationInput(
                onSelectLocation: (location) {
                  _pickedLocation = location;
                },
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: () {
                  _savePlace();
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
