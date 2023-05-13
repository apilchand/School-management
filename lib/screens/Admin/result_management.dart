import 'package:flutter/material.dart';

class GradeManagementScreen extends StatefulWidget {
  const GradeManagementScreen({Key? key}) : super(key: key);

  @override
  _GradeManagementScreenState createState() => _GradeManagementScreenState();
}

class _GradeManagementScreenState extends State<GradeManagementScreen> {
  List<Student> students = [
    Student(name: 'John Doe', rollNo: '001', grade: 'A'),
    Student(name: 'Jane Smith', rollNo: '002', grade: 'B'),
    Student(name: 'David Lee', rollNo: '003', grade: 'C'),
    Student(name: 'Emma Brown', rollNo: '004', grade: 'B+'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grade Management'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(students[index].name),
            subtitle: Text('Roll No: ${students[index].rollNo}'),
            trailing: Text(students[index].grade),
            onTap: () {
              _showGradeDialog(index);
            },
          );
        },
      ),
    );
  }

  void _showGradeDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? selectedGrade = students[index].grade;
        return AlertDialog(
          title: Text('Update Grade'),
          content: DropdownButtonFormField(
            value: selectedGrade,
            items: [
              DropdownMenuItem(value: 'A', child: Text('A')),
              DropdownMenuItem(value: 'B', child: Text('B')),
              DropdownMenuItem(value: 'C', child: Text('C')),
              DropdownMenuItem(value: 'D', child: Text('D')),
              DropdownMenuItem(value: 'F', child: Text('F')),
            ],
            onChanged: (value) {
              setState(() {
                selectedGrade = value.toString();
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  students[index].grade = selectedGrade!;
                });
                Navigator.of(context).pop();
              },
              child: Text('SAVE'),
            ),
          ],
        );
      },
    );
  }
}

class Student {
  final String name;
  final String rollNo;
  String grade;

  Student({
    required this.name,
    required this.rollNo,
    this.grade = 'F',
  });
}
