import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(const []);

  // Create a directory for storing place images that will persist
  Future<Directory> getPlacesDirectory() async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final placesDir = Directory('${appDir.path}/places_images');
    if (!placesDir.existsSync()) {
      placesDir.createSync();
    }
    return placesDir;
  }

  Future<Database> getDatabase() async {
    final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, latitude REAL, longitude REAL, address TEXT)',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> loadPlaces() async {
    try {
      final db = await getDatabase();
      final data = await db.query('user_places');
      
      List<Place> places = [];
      
      for (final row in data) {
        try {
          final imagePath = row['image'] as String;
          File imageFile = File(imagePath);
          
          if (!imageFile.existsSync()) {
            final filename = path.basename(imagePath);
            final placesDir = await getPlacesDirectory();
            final potentialFile = File('${placesDir.path}/$filename');
            
            if (potentialFile.existsSync()) {
              imageFile = potentialFile;
              
              await db.update(
                'user_places',
                {'image': imageFile.path},
                where: 'id = ?',
                whereArgs: [row['id']],
              );
            } else {
              print('Warning: Image file not found at path: $imagePath');
            }
          }
          
          places.add(Place(
            id: row['id'] as String,
            title: row['title'] as String,
            image: imageFile,
            location: PlaceLocation(
              latitude: row['latitude'] as double,
              longitude: row['longitude'] as double,
              address: row['address'] as String,
            ),
          ));
        } catch (e) {
          print('Error loading a place: $e');
        }
      }
      
      // Update state with places from database
      state = places;
    } catch (error) {
      print('Error loading places: $error');
    }
  }

  Future<void> toggleplaces(Place place) async {
    try {
      // Get the dedicated places directory
      final placesDir = await getPlacesDirectory();
      
      // Create a guaranteed unique filename with timestamp and id
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename = '${timestamp}_${place.id}.jpg';
      final destinationPath = path.join(placesDir.path, filename);
      
      // Copy the image to places directory
      File copiedImage;
      if (place.image != null && place.image!.existsSync()) {
        copiedImage = await place.image!.copy(destinationPath);
        
        if (!copiedImage.existsSync()) {
          print('Warning: Failed to copy image to: $destinationPath');
        }
      } else {
        throw Exception('Source image file does not exist');
      }

      final updatedPlace = Place(
        id: place.id, // Preserve the original ID
        title: place.title,
        image: copiedImage,
        location: place.location,
      );
      
      final db = await getDatabase();
      
      await db.insert(
        'user_places', 
        {
          'id': updatedPlace.id,
          'title': updatedPlace.title,
          'image': updatedPlace.image!.path,
          'latitude': updatedPlace.location!.latitude,
          'longitude': updatedPlace.location!.longitude,
          'address': updatedPlace.location!.address,
        },
        conflictAlgorithm: sql.ConflictAlgorithm.replace,
      );

      await loadPlaces();
    } catch (error) {
      print('Error saving place: $error');
    }
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
  (ref) => PlacesNotifier(),
);
