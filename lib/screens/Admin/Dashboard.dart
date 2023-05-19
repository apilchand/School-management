import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pathsala/screens/Admin/Student_management/student_management.dart';
import 'package:pathsala/screens/Admin/Teacher_management/teacher_management.dart';
import 'package:pathsala/screens/Admin/class_management/class_management.dart';
import 'package:pathsala/screens/Admin/result_management.dart';
import 'package:pathsala/screens/Teacher/Notice.dart';
import 'package:pathsala/screens/login.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int studentCount = 0;
  int teacherCount = 0;

  @override
  void initState() {
    super.initState();
    fetchCounts();
  }

  Future<void> fetchCounts() async {
    final QuerySnapshot studentSnapshot = await FirebaseFirestore.instance.collection('Student').get();
    final QuerySnapshot teacherSnapshot = await FirebaseFirestore.instance.collection('Teacher').get();

    setState(() {
      studentCount = studentSnapshot.size;
      teacherCount = teacherSnapshot.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Dashboard')),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 120.0,
              child: const DrawerHeader(
                decoration: BoxDecoration(),
                child: Center(
                  child: Text(
                    'School Management System',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            DrawerItem(
              icon: Icons.people,
              title: 'Students',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentManagementScreen()),
                );
              },
            ),
            DrawerItem(
              icon: Icons.person,
              title: 'Teachers',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TeacherManagementScreen()),
                );
              },
            ),
            DrawerItem(
              icon: Icons.class_,
              title: 'Classes',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Classmgmt()),
                );
              },
            ),
            DrawerItem(
              icon: Icons.grade,
              title: 'Grades',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentMarks()),
                );
              },
            ),
            DrawerItem(
              icon: Icons.notifications,
              title: 'Notices',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TeacherNoticeScreen()),
                );
              },
            ),
            DrawerItem(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          childAspectRatio: 0.75,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            DashboardCard(
              title: 'Students',
              count: studentCount,
              icon: Icons.people,
            ),
            DashboardCard(
              title: 'Teachers',
              count: teacherCount,
              icon: Icons.person,
            ),
            DashboardCard(
              title: 'Classes',
              count: 10,
              icon: Icons.class_,
            ),
            DashboardCard(
              title: 'Attendance',
              count: 85,
              icon: Icons.calendar_today,
            ),
            DashboardCard(
              title: 'Pass percentage',
              count: 80,
              icon: Icons.grade,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }
}

class DashboardCard extends StatelessWidget {
  const DashboardCard({
    Key? key,
    required this.title,
    required this.count,
    required this.icon,
  }) : super(key: key);

  final String title;
  final int count;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          )
        ],
        color: Theme.of(context).cardColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60.0,
            color: Theme.of(context).iconTheme.color,
          ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
