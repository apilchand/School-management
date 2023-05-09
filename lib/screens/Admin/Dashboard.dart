import 'package:flutter/material.dart';

import 'attendance_management.dart';
import 'class_management.dart';
import 'notice_management.dart';
import 'result_management.dart';
import 'student_management.dart';
import 'teacher_management.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color.fromARGB(255, 121, 6, 6),
      ),
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 4, 28, 63),
          child: ListView(
            children: [
              Container(
                height: 120.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.purple,
                  ),
                  child: Center(
                    child: Text(
                      'School Management System',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              DrawerItem(
                icon: Icons.people,
                title: 'Students',
                onPressed: () {
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StudentScreen()),
                  );*/
                },
              ),
              DrawerItem(
                icon: Icons.person,
                title: 'Teachers',
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.class_,
                title: 'Classes',
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.calendar_today,
                title: 'Attendance',
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.grade,
                title: 'Grades',
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.notifications,
                title: 'Notices',
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.logout,
                title: 'Logout',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Students',
                      count: '1000',
                      icon: Icons.people,
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                    child: DashboardCard(
                      title: 'Teachers',
                      count: '50',
                      icon: Icons.person,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Classes',
                      count: '20',
                      icon: Icons.class_,
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                    child: DashboardCard(
                      title: 'Attendance Percentage',
                      count: '85%',
                      icon: Icons.calendar_today,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'Pass percentage',
                      count: '80%',
                      icon: Icons.grade,
                      color: Colors.purple,
                    ),
                  ),
                  Expanded(
                    child: DashboardCard(
                      title: 'Notices',
                      count: '5',
                      icon: Icons.notifications,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onPressed;

  const DrawerItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.purple,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onTap: onPressed(),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String count;
  final IconData icon;
  final Color color;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.count,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50.0,
              color: color,
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              count,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
