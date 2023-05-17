import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



FirebaseFirestore db = FirebaseFirestore.instance;
class Student {
    final String name;
    final String gender;
  
    //final String photoUrl;
    Student(
      {
        required this.name,
        required this.gender,
        
        //required this.photoUrl,
      }
    );
  }


class StudentInfoScreen extends StatelessWidget {

  const StudentInfoScreen({Key? key, required this.studentId,}) : super(key: key);
final String studentId;
Future<Student> getStudent() async {
  QuerySnapshot querySnapshot = await db
      .collection('Student')
      .where('studentId' ,isEqualTo: studentId )
      .get();

  for (QueryDocumentSnapshot document in querySnapshot.docs) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

   
      return Student(
        name: data['firstName']+ ' '+data['lastName'],
        gender: data['gender'],
      
        //photoUrl: 'https://photos.app.goo.gl/o9eDB634r9wY8csR9',
      
    );
  }
 throw Exception('Student not found');
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Info'),backgroundColor: const Color.fromARGB(255, 121, 6, 6)
      ),
      body: 
      FutureBuilder<Student>(
                future: getStudent(),
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

      Student student = snapshot.data!;
      return
      Container(
        color:  const Color.fromARGB(255, 4, 28, 63),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fstackoverflow.com%2Fquestions%2F42893664%2Ffirebase-photourl-from-a-google-auth-provider-returns-a-jpg-with-colors-inverted&psig=AOvVaw0pxDj5yPqzIXhKEk6N2Ae-&ust=1684399144525000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCIjw5Pf5-_4CFQAAAAAdAAAAABAE'),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    student.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    ' Gender: ${student.gender}',
                    style: const TextStyle(
                      color: Colors.white,
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
                  color: Colors.white10,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: const SingleChildScrollView(child: 
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Performance:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:Colors.white
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '90%',
                      style: TextStyle(
                        fontSize: 18,color:Colors.white
                      ),
                    ),
                    SizedBox(height: 32.0),
                    Text(
                      'Attendance Percentage:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,color:Colors.white
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '85%',
                      style: TextStyle(
                        fontSize: 18,color:Colors.white
                      ),
                    ),
                    SizedBox(height: 32.0),
                    Text(
                      'Result Percentage:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,color:Colors.white
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      '92%',
                      style: TextStyle(
                        fontSize: 18,color:Colors.white
                      ),
                    ),
                  ],
                ),
              ),
            ),
            )
          ],
        ),
      );
                    }
      )
    );
  }
}

