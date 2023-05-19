import 'package:flutter/material.dart';

class TeacherTimeTableScreen extends StatelessWidget {
  final String teacherName;

  TeacherTimeTableScreen({required this.teacherName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable for $teacherName'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Monday',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _buildTimetableCard('Class 1', 'Maths', '9:00 AM - 10:00 AM'),
              _buildTimetableCard('Class 2', 'Science', '11:00 AM - 12:00 PM'),
              _buildTimetableCard('Class 3', 'Social Studies', '2:00 PM - 3:00 PM'),
              const SizedBox(height: 16.0),
              const Text(
                'Tuesday',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _buildTimetableCard('Class 4', 'English', '10:00 AM - 11:00 AM'),
              _buildTimetableCard('Class 5', 'Nepali', '1:00 PM - 2:00 PM'),
              const SizedBox(height: 16.0),
              const Text(
                'Wednesday',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _buildTimetableCard('Class 6', 'Maths', '9:00 AM - 10:00 AM'),
              _buildTimetableCard('Class 7', 'Science', '11:00 AM - 12:00 PM'),
              _buildTimetableCard('Class 8', 'Social Studies', '2:00 PM - 3:00 PM'),
              const SizedBox(height: 16.0),
              const Text(
                'Thursday',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              _buildTimetableCard('Class 9', 'English', '10:00 AM - 11:00 AM'),
              _buildTimetableCard('Class 10', 'Nepali', '1:00 PM - 2:00 PM'),
              const SizedBox(height: 16.0),
              const Text(
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
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              className,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height:16.0),
            Text(
              subject,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              timing,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
} 
