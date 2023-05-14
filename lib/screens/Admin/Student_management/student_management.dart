import 'package:flutter/material.dart';
import 'package:pathsala/screens/Admin/Student_management/Show_students.dart';

import 'Student_register.dart';


class StudentManagementScreen extends StatefulWidget {
  @override
  _StudentManagementScreenState createState() => _StudentManagementScreenState();
}

class _StudentManagementScreenState extends State<StudentManagementScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      appBar: AppBar(
        title: Text('Student Management'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 121, 6, 6),
      ),
      body: 
       SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentList() ),
                ); 
              },
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.account_circle, color: Colors.purple,),
                      SizedBox(width: 16),
                      Text(
                        'View Students',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
               Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentRegistration()),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.add_home,
                      color: Colors.purple),
                      SizedBox(width: 16),
                      Text(
                        'Add Student',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}


