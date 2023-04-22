import 'package:flutter/material.dart';
import 'package:pathsala/screens/Student/timetable.dart';
import 'package:pathsala/screens/Student/result.dart';
import 'package:pathsala/screens/Student/Attendance.dart';
import 'package:pathsala/screens/Student/Download.dart';

class Sdashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Student')),
        backgroundColor: Color.fromARGB(255, 121, 6, 6),
      ),
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // First container with 2 containers in a row
              Container(
                height: constraints.maxHeight * 0.3,
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromARGB(255, 4, 31, 71),
                      ),
                      width: constraints.maxWidth * 0.4,
                      child: Image.asset(
                        'images/picture.jpg',
                        width: constraints.maxWidth * 0.3,
                        height: constraints.maxHeight * 0.25,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: constraints.maxWidth * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromARGB(255, 6, 36, 82),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name : Apil Chand',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('Adress : Mahendranagar',
                              style: TextStyle(color: Colors.white)),
                          Text('Grade : 10',
                              style: TextStyle(color: Colors.white)),
                          Text('Roll number : five',
                              style: TextStyle(color: Colors.white)),
                          Text('contact : 9865701163',
                              style: TextStyle(color: Colors.white)),
                          Text("Parent's Name: Govind Chand",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  color: Color.fromARGB(255, 11, 72, 165),
                ),
                height: constraints.maxHeight * 0.2,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notice',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Dear Students,Please note that there will be a mandatory class on Friday, April 29th, 2023, from 10:00 AM to 12:00 PM in Room 102. Attendance is compulsory, and all students are required to bring their textbooks and writing materials.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              // Third container with 4 containers in 2 rows
              Container(
                height: constraints.maxHeight * 0.3,
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color.fromARGB(255, 96, 7, 112),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MonthlyAttendanceLogPage(),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Atttendance',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color.fromARGB(255, 96, 7, 112),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TimetableScreen(),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Timetable',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color.fromARGB(255, 96, 7, 112),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MarksTable(marks: marks),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Result',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Color.fromARGB(255, 96, 7, 112),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResourceDownloadPage(),
                                ),
                              );
                            },
                            child: Center(
                              child: Text(
                                'Downloads',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Fourth container
              Container(
                padding: EdgeInsets.all(10),
                height: constraints.maxHeight * 0.185,
                color: Color.fromARGB(255, 121, 6, 6),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Contact for college',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Address:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '[College Name]',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '[Street Address]',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '[City, State, Zip Code]',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Phone: [+XX-XXX-XXX-XXXX]',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Email: [info@college.edu]',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
Map<String, double> marks = {
  'maths': 85.0,
  'science': 92.5,
  'english': 78.0,
  'social' : 95,
};