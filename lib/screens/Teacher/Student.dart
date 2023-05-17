import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Student_info.dart';
FirebaseFirestore db = FirebaseFirestore.instance;

class Student {
    final String name;
    final String gender;
    final String studnetId;
    //final String photoUrl;
    Student(
      {
        required this.name,
        required this.gender,
        required this.studnetId,
        //required this.photoUrl,
      }
    );
  }

  

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key, required this.classname}) : super(key: key);
final String classname;
  

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  Future<List<Student>> getStudentList() async {
  QuerySnapshot querySnapshot = await db
      .collection('Student')
      .where('class' ,isEqualTo: widget.classname )
      .get();

  List<Student> students = [];

  for (QueryDocumentSnapshot document in querySnapshot.docs) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    students.add(
      Student(
        name: data['firstName']+' '+ data['lastName'],
        gender: data['gender'],
        studnetId: document.id,
        //photoUrl: 'https://photos.app.goo.gl/o9eDB634r9wY8csR9',
      ),
    );
  }
  return students;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      appBar: AppBar(
        title: Text('Student List'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 121, 6, 6)
      ),
      body:FutureBuilder<List<Student>>(
                future: getStudentList(),
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

      List<Student> student = snapshot.data!;
      
      
      return ListView.builder(
        itemCount: student.length,
        itemBuilder: (context, index) {
          final st = student[index];
          return ListTile(
            title: Text(st.name,style: TextStyle(color: Colors.white),),
            subtitle: Text(st.gender,style: TextStyle(color: Colors.white),),
            trailing: Icon(Icons.arrow_circle_right_rounded,
            color: Colors.purple,),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  StudentInfoScreen(studnetId: st.studnetId,),
                ),
              );
            },
          );
        },
      );
                    }
      )
    );
  }
}



