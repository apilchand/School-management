import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadContentScreen extends StatefulWidget {
  const UploadContentScreen({Key? key}) : super(key: key);

  @override
  _UploadContentScreenState createState() => _UploadContentScreenState();
}

class _UploadContentScreenState extends State<UploadContentScreen> {
  String? _selectedClass;
  String _description = '';
  File? _selectedFile;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.any);
      if (result != null) {
        setState(() {
          _selectedFile = File(result.files.single.path!);
        });
      }
    } on PlatformException catch (e) {
      print('Error while picking file: ${e.message}');
    }
  }

  void _uploadContent() async {
    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a file')),
      );
      return;
    }

    const folderName = "Download";
    // Get a reference to the Firebase Storage bucket
    final storage = FirebaseStorage.instance;
    final bucket = storage.ref().child(folderName);

    // Generate a unique filename for the uploaded file
    final filename =
        '${DateTime.now().millisecondsSinceEpoch}_${_selectedFile!.path}';

    try {
      // Upload the selected file to Firebase Storage
      final task = bucket.child(filename).putFile(_selectedFile!);
      final snapshot = await task.whenComplete(() {});

      // Get the download URL for the uploaded file
      final downloadURL = await snapshot.ref.getDownloadURL();

      // Store the input fields (class, description, downloadURL) to Firebase Firestore
      await FirebaseFirestore.instance
          .collection('Download')
          .doc(_description)
          .set({
        'class': _selectedClass,
        'description': _description,
        'file': downloadURL,
        'createdAt': FieldValue.serverTimestamp(),
      });
      setState(() {
        _selectedFile = null;
        _selectedClass = null;
        _description = '';
      });

      // Display a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Content uploaded successfully')),
      );
    } on FirebaseException catch (e) {
      // Display an error message if the upload fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Upload Content')),
        backgroundColor: Colors.blue, // Set the desired app bar color here
      ),
      backgroundColor: Colors.white, // Set the desired background color here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose File',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: const Icon(Icons.attach_file),
              label: Text(_selectedFile == null
                  ? 'Select a file'
                  : 'Selected: ${_selectedFile!.path}'),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Choose Class',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            DropdownButtonFormField<String>(
              value: _selectedClass,
              items: [
                'Class 1',
                'Class 2',
                'Class 3',
                'Class 4',
                'Class 5',
                'Class 6',
                'Class 7',
                'Class 8',
                'Class 9',
                'Class 10'
              ]
                  .map((className) => DropdownMenuItem(
                        value: className,
                        child: Text(className),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedClass = value!;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              maxLines: 3,
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a brief description...',
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _uploadContent,
              child: const Text('Upload'),
            ),
          ],
        ),
      ),
    );
  }
}
