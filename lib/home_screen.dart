import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  String _predictionResult = "No prediction yet"; // To store prediction result
  final picker = ImagePicker();

  /// Function to pick an image from the gallery
  Future<void> getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _predictionResult = "No prediction yet"; // Reset prediction
      } else {
        print("No image picked");
      }
    });
  }

  /// Function to pick an image from the camera
  Future<void> getImageCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _predictionResult = "No prediction yet"; // Reset prediction
      } else {
        print("No image captured");
      }
    });
  }

  /// Function to simulate prediction (replace this with model logic)
  Future<void> predictDisease() async {
    if (_image == null) {
      setState(() {
        _predictionResult = "Please select or capture an image first!";
      });
      return;
    }

    // Simulate processing (you can replace this with TFLite model inference)
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _predictionResult =
          "Predicted Disease: Leaf Blight"; // Example prediction
    });
  }

  @override
  Widget build(BuildContext context) {
    // Define the custom colors
    const primaryColor = Color(0xFF1CA349);
    const accentColor = Colors.amber;
    const backgroundColor = Colors.white;
    const borderColor = Colors.grey;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Picker Example",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: Container(
        color: backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: getImageGallery,
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.2),
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Center(
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 50,
                            color: Color(0xFF1CA349),
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: getImageCamera,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Upload from Camera",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: predictDisease,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1CA349),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  "Diagnose", // Changed from "Predict"
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _predictionResult,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
