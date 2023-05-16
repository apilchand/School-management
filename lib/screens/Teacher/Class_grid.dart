import 'package:flutter/material.dart';
import 'Attendance.dart';
import 'Result.dart';
import 'Class_TimeTable.dart';
import 'package:pathsala/about.dart';
import 'Notice.dart';
import 'Student.dart';

class ClassScreen extends StatelessWidget {
  final List<String> classes = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Classes')),
          backgroundColor: const Color.fromARGB(255, 121, 6, 6)),
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: 
      GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: classes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ClassDetailScreen(className: classes[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.school,
                    color: Colors.purple,
                    size: 40,
                    
                  ),
                  Text(
                    classes[index],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ClassDetailScreen extends StatelessWidget {
  final String className;

  ClassDetailScreen({required this.className});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(className),
          backgroundColor: const Color.fromARGB(255, 121, 6, 6)),
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 1.3,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          _buildCard(
            icon: Icons.assignment,
            title: 'Attendance',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AttendanceScreen(),
                ),
              );
            },
          ),
          _buildCard(
            icon: Icons.notification_important,
            title: 'Notice',
            onTap: () {
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeacherNoticeScreen(),
                  ),
                );
              }
            },
          ),
          _buildCard(
            icon: Icons.stacked_bar_chart,
            title: 'Result',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultSection(),
                ),
              );
            },
          ),
          _buildCard(
            icon: Icons.schedule,
            title: 'Timetable',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TimetableScreen(),
                ),
              );
            },
          ),
          _buildCard(
            icon: Icons.person,
            title: 'Student Info',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentListScreen(),
                ),
              );
            },
          ),
          _buildCard(
            icon: Icons.info,
            title: 'About',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48.0,
              color: Colors.purple,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
