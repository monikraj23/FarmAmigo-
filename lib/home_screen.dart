import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;
  String _predictionResult = "No prediction yet";
  final picker = ImagePicker();
  Map<String, int>? _labels;
  bool _isLoading = false;
  Interpreter? _interpreter;

  @override
  void initState() {
    super.initState();
    _loadModel();
    _loadLabels();
  }

  // Load the TFLite model
  Future<void> _loadModel() async {
    try {
      final modelData = await DefaultAssetBundle.of(context)
          .load('assets/plant_disease_model.tflite');
      final modelBytes = modelData.buffer.asUint8List();
      _interpreter = Interpreter.fromBuffer(modelBytes);
      print('Model loaded successfully');
    } catch (e) {
      print('Error loading model: $e');
      setState(() {
        _predictionResult = "Error loading model";
      });
    }
  }

  // Load classnames from JSON
  Future<void> _loadLabels() async {
    try {
      String jsonString = await DefaultAssetBundle.of(context)
          .loadString('assets/classnames.json');
      setState(() {
        _labels = Map<String, int>.from(jsonDecode(jsonString));
      });
      print('Labels loaded: ${_labels!.keys.toList()}');
    } catch (e) {
      print('Error loading labels: $e');
      setState(() {
        _predictionResult = "Error loading labels";
      });
    }
  }

  /// Function to pick an image from the gallery
  Future<void> getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _predictionResult = "No prediction yet";
        _isLoading = false;
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
        _predictionResult = "No prediction yet";
        _isLoading = false;
      } else {
        print("No image captured");
      }
    });
  }

  /// Function to preprocess image for EfficientNet
  Float32List _preprocessImage(img.Image image) {
    // Resize to 224x224
    img.Image resizedImage = img.copyResize(image, width: 224, height: 224);

    // Convert to Float32List and normalize to [-1, 1] (EfficientNet preprocessing)
    var input = Float32List(224 * 224 * 3);
    var pixels = resizedImage.getBytes(); // Returns RGBA or RGB data

    // Assume RGBA (4 channels) and extract RGB
    int pixelIndex = 0;
    for (int i = 0; i < pixels.length; i += 4) { // Step by 4 for RGBA
      if (pixelIndex < input.length) {
        // RGB channels: normalize from [0, 255] to [-1, 1]
        input[pixelIndex++] = (pixels[i] / 127.5) - 1.0; // R
        input[pixelIndex++] = (pixels[i + 1] / 127.5) - 1.0; // G
        input[pixelIndex++] = (pixels[i + 2] / 127.5) - 1.0; // B
      }
    }

    return input;
  }

  /// Function to predict disease using TFLite model
  Future<void> predictDisease() async {
    if (_image == null || _labels == null || _interpreter == null) {
      setState(() {
        _predictionResult = "Please select or capture an image first!";
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _predictionResult = "Processing...";
    });

    try {
      // Load and preprocess the image
      img.Image? image = img.decodeImage(await _image!.readAsBytes());
      if (image == null) {
        setState(() {
          _predictionResult = "Error: Unable to decode image";
          _isLoading = false;
        });
        return;
      }

      // Preprocess image
      var input = _preprocessImage(image);

      // Reshape input to [1, 224, 224, 3]
      var inputTensor = input.reshape([1, 224, 224, 3]);

      // Prepare output tensor for 38 classes
      var outputTensor = List.filled(1 * 38, 0.0).reshape([1, 38]);

      // Run inference
      _interpreter!.run(inputTensor, outputTensor);

      // Get the highest confidence prediction
      var output = outputTensor[0] as List<double>;
      double maxConfidence = output.reduce((a, b) => a > b ? a : b);
      int maxIndex = output.indexOf(maxConfidence);

      // Map index to label, excluding 'test' class
      String predictedLabel = _labels!.keys.firstWhere(
        (key) => _labels![key] == maxIndex,
        orElse: () => 'Unknown',
      );

      if (predictedLabel == 'test') {
        predictedLabel = 'Unknown (Test Class)';
      }

      setState(() {
        _predictionResult =
            "Predicted Disease: $predictedLabel (${(maxConfidence * 100).toStringAsFixed(2)}%)";
        _isLoading = false;
      });
    } catch (e) {
      print('Error running prediction: $e');
      setState(() {
        _predictionResult = "Error running prediction: $e";
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _interpreter?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
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
                onTap: _isLoading ? null : predictDisease,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _isLoading ? Colors.grey : primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "Diagnose",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator(color: primaryColor)
                  : Text(
                      _predictionResult,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}