import 'package:flutter/material.dart';
import 'Student/Sdashboard.dart';
import 'Parent/Pdashboard.dart';
import 'Teacher/Tdashboard.dart';
import 'Admin/Dashboard.dart';

class RoleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PathShala'),
        backgroundColor: const Color.fromARGB(255, 121, 6, 6),
      ),
       backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Choose your Role',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Add two rows of two containers
              RoleRow(
                role1: 'Student',
                role2: 'Parent',
                color1: Colors.blue,
                color2: Colors.green,
                icon1: Icons.school,
                icon2: Icons.family_restroom,
                onTap1: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDashboard(studentId: 'W11KMZGEgXh0l8KG0msf'),
                    ),
                  );
                },
                onTap2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ParentHomeScreen(),
                    ),
                  );
                },
              ),
              RoleRow(
                role1: 'Teacher',
                role2: 'Admin',
                color1: Colors.orange,
                color2: Colors.purple,
                icon1: Icons.person,
                icon2: Icons.admin_panel_settings,
                onTap1: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherDashboardScreen(teacherId: 'test'),
                    ),
                  );
                },
                onTap2: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleRow extends StatelessWidget {
  final String role1;
  final String role2;
  final Color color1;
  final Color color2;
  final IconData icon1;
  final IconData icon2;
  final VoidCallback onTap1;
  final VoidCallback onTap2;

  const RoleRow({
    required this.role1,
    required this.role2,
    required this.color1,
    required this.color2,
    required this.icon1,
    required this.icon2,
    required this.onTap1,
    required this.onTap2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RoleContainer(
            color: color1,
            icon: icon1,
            role: role1,
            onTap: onTap1,
          ),
        ),
        Expanded(
          child: RoleContainer(
            color: color2,
            icon: icon2,
            role: role2,
            onTap: onTap2,
          ),
        ),
      ],
    );
  }
}

class RoleContainer extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String role;
  final VoidCallback onTap;

  const RoleContainer({
    required this.color,
    required this.icon,
    required this.role,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              icon,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              role,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

