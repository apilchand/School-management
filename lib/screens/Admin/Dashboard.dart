import 'package:flutter/material.dart';

import '../Teacher/Notice.dart';
import 'attendance_management.dart';
import 'class_management.dart';

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
        backgroundColor: const Color.fromARGB(255, 121, 6, 6),
      ),
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 4, 28, 63),
          child: ListView(
            children: [
              Container(
                height: 120.0,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 121, 6, 6),
                  ),
                  child: const Center(
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
                    MaterialPageRoute(builder: (context) => const GradeManagementScreen()),
                  );
                },
              ),
              DrawerItem(
                icon: Icons.notifications,
                title: 'Notices',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeacherNoticeScreen()),
                  );
                },
              ),
              
              DrawerItem(
                icon: Icons.logout,
                title: 'Logout',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 1.0,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
                
                     DashboardCard(
                      title: 'Students',
                      count: '1000',
                      icon: Icons.people,
                      color: Colors.purple,
                    ),
                  
                  
                    DashboardCard(
                      title: 'Teachers',
                      count: '50',
                      icon: Icons.person,
                      color: Colors.purple,
                    
                  ),
            
               
                     DashboardCard(
                      title: 'Classes',
                      count: '20',
                      icon: Icons.class_,
                      color: Colors.purple,
                    ),
                
                   DashboardCard(
                      title: 'Attendance',
                      count: '85%',
                      icon: Icons.calendar_today,
                      color: Colors.purple,
                    ),
                
                DashboardCard(
                      title: 'Pass percentage',
                      count: '80%',
                      icon: Icons.grade,
                      color: Colors.purple,
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
        color: Colors.white,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
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
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            count,
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