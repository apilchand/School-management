import 'package:flutter/material.dart';
import '../Student/Attendance.dart';
import '../Student/Download.dart';
import '../Student/result.dart';
import '../Student/timetable.dart';

class ParentHomeScreen extends StatelessWidget {
  const ParentHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Parent')),
      ),
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage('images/picture.jpg'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Hello, [Parent Name]',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Here is what’s happening in your school today:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeScreenCard(
                        title: 'Attendance',
                        subtitle: 'Check if your child is present or absent',
                        icon: Icons.person_outline,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MonthlyAttendanceLogScreen(studentName: 'Apil Chand'),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                      HomeScreenCard(
                        title: 'Assignments',
                        subtitle: 'View assignments',
                        icon: Icons.assignment_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResourceDownloadPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                      HomeScreenCard(
                        title: 'Events',
                        subtitle: 'View upcoming events and activities',
                        icon: Icons.event_outlined,
                        onPressed: () {
                          // Handle events onPressed
                        },
                      ),
                      const SizedBox(height: 16.0),
                      HomeScreenCard(
                        title: 'Exams',
                        subtitle: 'View exam schedules and results',
                        icon: Icons.library_books_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Examresult(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                      HomeScreenCard(
                        title: 'Timetable',
                        subtitle: 'View class timetables and schedules',
                        icon: Icons.access_time_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TimetableScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreenCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;

  const HomeScreenCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2.0,
                blurRadius: 5.0,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 40.0,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
