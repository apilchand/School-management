import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
        backgroundColor: Color.fromARGB(255, 121, 6, 6)
      
      ),
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      body: SingleChildScrollView(child:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Class',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Sunday',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8.0),
            TimetableCard(
              subject: 'Maths',
              time: '8:00 AM - 9:00 AM',
            ),
            SizedBox(height: 8.0),
            TimetableCard(
              subject: 'English',
              time: '9:00 AM - 10:00 AM',
            ),
            SizedBox(height: 8.0),
            TimetableCard(
              subject: 'Science',
              time: '10:00 AM - 11:00 AM',
            ),
            SizedBox(height: 16.0),
            Text(
              'Monday',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8.0),
            TimetableCard(
              subject: 'Social Studies',
              time: '8:00 AM - 9:00 AM',
            ),
            SizedBox(height: 8.0),
            TimetableCard(
              subject: 'Maths',
              time: '9:00 AM - 10:00 AM',
            ),
            SizedBox(height: 8.0),
            TimetableCard(
              subject: 'English',
              time: '10:00 AM - 11:00 AM',
            ),
          ],
        ),
      ),
    ));
  }
}

class TimetableCard extends StatelessWidget {
  final String subject;
  final String time;

  const TimetableCard({Key? key, required this.subject, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subject,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Color.fromARGB(255, 4, 28, 63),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            time,
            style: TextStyle(
              fontSize: 14.0,
              color: Color.fromARGB(255, 4, 28, 63),
            ),
          ),
        ],
      ),
    );
  }
}
