import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


FirebaseFirestore db = FirebaseFirestore.instance;

class Download {
  final String description;
  final String file;
  Download(
    {required this.description,
    required this.file}
  );
}

Future<List<Download>> downloadFile() async {
  QuerySnapshot querySnapshot = await db
      .collection('Download')
      .orderBy('createdAt', descending: true)
      .limit(10)
      .get();

  List<Download> downloads = [];

  for (QueryDocumentSnapshot document in querySnapshot.docs) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    downloads.add(
      Download(
        
      description: data['description'],
      file:data['file'],
      
     
      )
    );
  }
  return downloads;
}


class ResourceDownloadPage extends StatefulWidget {
  const ResourceDownloadPage({super.key});

  

  @override
  _ResourceDownloadPageState createState() => _ResourceDownloadPageState();
}

class _ResourceDownloadPageState extends State<ResourceDownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Download Resources'),
        backgroundColor: const Color.fromARGB(255, 121, 6, 6),
      ),
      body: 
      FutureBuilder<List<Download>>(
        future: downloadFile(),
        builder: (context, snapshot) {if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  List<Download> downld = snapshot.data!;
      
      return ListView.builder(
        itemCount: downld.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.file_copy),
            title: 
            Text(downld[index].description),
            trailing: IconButton(
              icon: const Icon(Icons.download_rounded),
              onPressed: () {
                launch(downld[index].file);
              },
            ),
          );
        },
      );
      }
      )
      );}
      
  }
  

