import 'package:flutter/material.dart';

class AttendanceManagementScreen extends StatefulWidget {
  const AttendanceManagementScreen({Key? key}) : super(key: key);

  @override
  _AttendanceManagementScreenState createState() =>
      _AttendanceManagementScreenState();
}

class _AttendanceManagementScreenState
    extends State<AttendanceManagementScreen> {
  List<Student> students = [
    Student(name: 'John Doe', rollNo: '001', present: true),
    Student(name: 'Jane Smith', rollNo: '002', present: false),
    Student(name: 'David Lee', rollNo: '003', present: true),
    Student(name: 'Emma Brown', rollNo: '004', present: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Management'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(students[index].name),
            subtitle: Text('Roll No: ${students[index].rollNo}'),
            value: students[index].present,
            onChanged: (value) {
              setState(() {
                students[index].present = value!;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save attendance
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

class Student {
  final String name;
  final String rollNo;
  bool present;

  Student({
    required this.name,
    required this.rollNo,
    this.present = false,
  });
}
