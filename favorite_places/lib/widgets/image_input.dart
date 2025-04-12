import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final void Function(File image) onSelectImage;
  const ImageInput(this.onSelectImage, {super.key});
  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;
  
  Future<Directory> getPlacesDirectory() async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final placesDir = Directory('${appDir.path}/places_images');
    if (!placesDir.existsSync()) {
      placesDir.createSync();
    }
    return placesDir;
  }
  
  Future<File> _saveImageToAppDirectory(XFile pickedImage) async {
    try {
      final placesDir = await getPlacesDirectory();
      
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename = '${timestamp}_${path.basename(pickedImage.path)}';
      
      final savedImage = File('${placesDir.path}/$filename');
      
      return File(pickedImage.path).copy(savedImage.path);
    } catch (e) {
      print('Error saving image: $e');
      rethrow;
    }
  }
  
  void _takePicture() async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600,
      );
      
      if (pickedImage == null) {
        return;
      }
      
      final savedImage = await _saveImageToAppDirectory(pickedImage);
      
      setState(() {
        _selectedImage = savedImage;
      });
      widget.onSelectImage(_selectedImage!);
      
    } catch (error) {
      print('Error taking picture: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to take picture')),
      );
    }
  }

  void _pickImageFromGallery() async {
    try {
      final imagePicker = ImagePicker();
      final pickedImage = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 600,
      );
      
      if (pickedImage == null) {
        return;
      }
      
      final savedImage = await _saveImageToAppDirectory(pickedImage);
      
      setState(() {
        _selectedImage = savedImage;
      });
      widget.onSelectImage(_selectedImage!);
      
    } catch (error) {
      print('Error picking image from gallery: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to pick image from gallery')),
      );
    }
  }

  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera),
            title: const Text('Take Picture'),
            onTap: () {
              Navigator.of(ctx).pop();
              _takePicture();
            },
          ),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Choose from Gallery'),
            onTap: () {
              Navigator.of(ctx).pop();
              _pickImageFromGallery();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _showImageSourceOptions,
      icon: const Icon(Icons.camera),
      label: const Text('Add Image'),
    );
    
    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _showImageSourceOptions,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            print('Error displaying image: $error');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  const SizedBox(height: 8),
                  const Text('Could not load image'),
                ],
              ),
            );
          },
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      alignment: Alignment.center,
      width: double.infinity,
      height: 250,
      child: content,
    );
  }
}
