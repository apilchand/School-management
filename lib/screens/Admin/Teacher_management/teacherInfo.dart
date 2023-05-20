import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



FirebaseFirestore db = FirebaseFirestore.instance;
class Teacher {
    final String name;
    final String gender;
final String photoUrl;
    Teacher(
      {
        required this.name,
        required this.gender,
      required this.photoUrl,
      }
    );
  }


class TeacherInfoScreen extends StatelessWidget {

  const TeacherInfoScreen({Key? key, required this.teacherId,}) : super(key: key);
final String teacherId;
Future<Teacher> getTeacher() async {
  QuerySnapshot querySnapshot = await db
      .collection('Teacher')
      .where('teacherId' ,isEqualTo: teacherId )
      .get();

  for (QueryDocumentSnapshot document in querySnapshot.docs) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

   
      return Teacher(
        name: data['firstName']+ ' '+data['lastName'],
        gender: data['gender'],
        photoUrl: data['profilePictureURL']
      
        
      
    );
  }
 throw Exception('Teacher not found');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Info')
      ),
      body: 
      FutureBuilder<Teacher>(
                future: getTeacher(),
                builder:
                    (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

      Teacher teacher = snapshot.data!;
      return
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(teacher.photoUrl),
                ),
                const SizedBox(height: 16.0),
                Text(
                  teacher.name,
                  style: const TextStyle(
                   
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  ' Gender: ${teacher.gender}',
                  style: const TextStyle(
                   
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
            
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              
          ),
          )
        ],
      );
                    }
      )
    );
  }
}

