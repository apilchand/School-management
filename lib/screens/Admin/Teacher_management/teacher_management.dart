import 'package:flutter/material.dart';
import 'package:pathsala/screens/Admin/Teacher_management/Teacher_add.dart';

class TeacherManagementScreen extends StatefulWidget {
  const TeacherManagementScreen({Key? key}) : super(key: key);

  @override
  _TeacherManagementScreenState createState() =>
      _TeacherManagementScreenState();
}

class _TeacherManagementScreenState extends State<TeacherManagementScreen> {
  List<Teacher> teachers = [
    Teacher(
      name: 'John Doe',
      id: '001',
    ),
    Teacher(
      name: 'Jane Smith',
      id: '002',
    ),
    Teacher(
      name: 'David Lee',
      id: '003',
    ),
    Teacher(
      name: 'Emma Brown',
      id: '004',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Management'),
        backgroundColor: const Color.fromARGB(255, 121, 6, 6),
      ),
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            itemCount: teachers.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(teachers[index].name),
                subtitle: Text('ID: ${teachers[index].id}'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to teacher details screen
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TeacherAdd()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Teacher {
  final String name;
  final String id;

  Teacher({
    required this.name,
    required this.id,
  });
}
