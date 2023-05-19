import 'package:flutter/material.dart';
import 'package:pathsala/screens/login.dart';

import '../Teacher/Notice.dart';

import 'class_management/class_management.dart';

import 'result_management.dart';
import 'Student_management/student_management.dart';
import 'Teacher_management/teacher_management.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

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
                decoration: BoxDecoration(
                  
                ),
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
                  MaterialPageRoute(builder: (context) =>  StudentManagementScreen()),
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
        child:GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 0.75,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: const [
                
                     DashboardCard(
                      title: 'Students',
                      count: '500',
                      icon: Icons.people,
                      color: Colors.white,
                    ),
                  
                  
                    DashboardCard(
                      title: 'Teachers',
                      count: '20',
                      icon: Icons.person,
                      color: Colors.white,
                    
                  ),
            
               
                     DashboardCard(
                      title: 'Classes',
                      count: '10',
                      icon: Icons.class_,
                      color: Colors.white,
                    ),
                
                   DashboardCard(
                      title: 'Attendance',
                      count: '85%',
                      icon: Icons.calendar_today,
                      color: Colors.white,
                    ),
                
                DashboardCard(
                      title: 'Pass percentage',
                      count: '80%',
                      icon: Icons.grade,
                      color: Colors.white,
                    ),
                
                ],
              )
      ));
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
    required this.color,
  }) : super(key: key);

  final String title;
  final String count;
  final IconData icon;
  final Color color;

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
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60.0,
            color: color,
          ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: const TextStyle(color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            count,
            style: const TextStyle(color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
