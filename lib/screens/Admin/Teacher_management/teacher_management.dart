import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Teacher_add.dart';

class TeacherManagementScreen extends StatefulWidget {
  const TeacherManagementScreen({Key? key}) : super(key: key);

  @override
  _TeacherManagementScreenState createState() =>
      _TeacherManagementScreenState();
}

class _TeacherManagementScreenState extends State<TeacherManagementScreen> {
  late Stream<QuerySnapshot> _teachersStream;

  @override
  void initState() {
    super.initState();
    _teachersStream = FirebaseFirestore.instance.collection('Teacher').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
        child: StreamBuilder<QuerySnapshot>(
          stream: _teachersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final teachers = snapshot.data!.docs;

              return ListView.builder(
                itemCount: teachers.length,
                itemBuilder: (BuildContext context, int index) {
                  final teacher = teachers[index];
                  final firstName = teacher['firstName'] as String;
                  final lastName = teacher['lastName'] as String;
                  final teacherName = '$firstName $lastName';
                  final teacherId = teacher['teacherId'] as String;

                  return ListTile(
                    title: Text(teacherName),
                    subtitle: Text('ID: $teacherId'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Navigate to teacher details screen
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TeacherAdd()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
