import 'package:flutter/material.dart';

class TeacherTimeTableScreen extends StatelessWidget {
  final String teacherName;

  TeacherTimeTableScreen({required this.teacherName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable for $teacherName'),
       backgroundColor: Color.fromARGB(255, 121, 6, 6)),
       backgroundColor: Color.fromARGB(255, 4, 28, 63),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Monday',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _buildTimetableCard('Class 1', 'Maths', '9:00 AM - 10:00 AM'),
              _buildTimetableCard('Class 2', 'Science', '11:00 AM - 12:00 PM'),
              _buildTimetableCard('Class 3', 'Social Studies', '2:00 PM - 3:00 PM'),
              SizedBox(height: 16.0),
              Text(
                'Tuesday',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _buildTimetableCard('Class 4', 'English', '10:00 AM - 11:00 AM'),
              _buildTimetableCard('Class 5', 'Nepali', '1:00 PM - 2:00 PM'),
              SizedBox(height: 16.0),
              Text(
                'Wednesday',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _buildTimetableCard('Class 6', 'Maths', '9:00 AM - 10:00 AM'),
              _buildTimetableCard('Class 7', 'Science', '11:00 AM - 12:00 PM'),
              _buildTimetableCard('Class 8', 'Social Studies', '2:00 PM - 3:00 PM'),
              SizedBox(height: 16.0),
              Text(
                'Thursday',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _buildTimetableCard('Class 9', 'English', '10:00 AM - 11:00 AM'),
              _buildTimetableCard('Class 10', 'Nepali', '1:00 PM - 2:00 PM'),
              SizedBox(height: 16.0),
              Text(
                'Friday',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _buildTimetableCard('Class 1', 'Maths', '9:00 AM - 10:00 AM'),
              _buildTimetableCard('Class 2', 'Science', '11:00 AM - 12:00 PM'),
              _buildTimetableCard('Class 3', 'Social Studies', '2:00 PM - 3:00 PM'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimetableCard(String className, String subject, String timing) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              className,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height:16.0),
            Text(
              subject,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              timing,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
} 
