import 'package:flutter/material.dart';
import 'Student.dart';

class StudentInfoScreen extends StatelessWidget {
  final Student student;

  const StudentInfoScreen({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),backgroundColor: Color.fromARGB(255, 121, 6, 6)
      ),
      body: Container(
        color:  Color.fromARGB(255, 4, 28, 63),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(student.photoUrl),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    student.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Class: ${student.classname}, Gender: ${student.gender}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                ),
                child: Column(
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
          ],
        ),
      ),
    );
  }
}

