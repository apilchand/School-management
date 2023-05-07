import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

class UploadContentScreen extends StatefulWidget {
  @override
  _UploadContentScreenState createState() => _UploadContentScreenState();
}

class _UploadContentScreenState extends State<UploadContentScreen> {
   String? _selectedClass;
  late String _description;
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

  void _uploadContent() {
    // TODO: Implement content upload logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text('Upload Content')),
          backgroundColor: Color.fromARGB(255, 121, 6, 6)),
      backgroundColor:  Color.fromARGB(255, 4, 28, 63),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose File',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.0),
            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: Icon(Icons.attach_file),
              label: Text(_selectedFile == null
                  ? 'Select a file'
                  : 'Selected: ${_selectedFile!.path}'),
                  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              ),

            ),
            SizedBox(height: 8.0),
            Text(
              'Choose Class',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                 color: Colors.white
              ),
            ),
            SizedBox(height: 8.0),
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
                'Class 9'
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                filled: true,
                fillColor: Colors.white
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                 color: Colors.white
              ),
            ),
            SizedBox(height: 8.0),
            TextField(
              maxLines: 3,
              onChanged: (value) {
                setState(() {
                  _description = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a brief description...',
                contentPadding: EdgeInsets.all(16.0),
                filled: true,
                fillColor: Colors.white
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _uploadContent,
              child: Text('Upload'),
              style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
