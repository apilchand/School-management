import 'package:flutter/material.dart';

class ResourceDownloadPage extends StatefulWidget {
  @override
  _ResourceDownloadPageState createState() => _ResourceDownloadPageState();
}

class _ResourceDownloadPageState extends State<ResourceDownloadPage> {
  final List<String> resources = [    'Mathematics Notes',    'English Grammar Book',    'Science Textbook',    'History Study Guide',    'Geography Atlas',  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Resources'),
        backgroundColor: Color.fromARGB(255, 121, 6, 6),
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.file_download),
            title: Text(resources[index]),
            trailing: IconButton(
              icon: Icon(Icons.download_rounded),
              onPressed: () {
                // Download resource
              },
            ),
          );
        },
      ),
    );
  }
}
