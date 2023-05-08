import 'package:flutter/material.dart';

class ParentHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text('Parent')),
          backgroundColor: Color.fromARGB(255, 121, 6, 6)),
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
              SizedBox(height: 16.0),
              Text(
                'Hello, [Parent Name]',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Here is what’s happening in your school today:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 32.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeScreenCard(
                        title: 'Attendance',
                        subtitle: 'Check if your child is present or absent',
                        icon: Icons.person_outline,
                        color: Color.fromARGB(255, 82, 170, 255),
                        onPressed: () {},
                      ),
                      SizedBox(height: 16.0),
                      HomeScreenCard(
                        title: 'Assignments',
                        subtitle: 'View assignments',
                        icon: Icons.assignment_outlined,
                        color: Color.fromARGB(255, 249, 151, 119),
                        onPressed: () {},
                      ),
                      SizedBox(height: 16.0),
                      HomeScreenCard(
                        title: 'Events',
                        subtitle: 'View upcoming events and activities',
                        icon: Icons.event_outlined,
                        color: Color.fromARGB(255, 251, 205, 97),
                        onPressed: () {},
                      ),
                      SizedBox(height: 16.0),
                      HomeScreenCard(
                        title: 'Exams',
                        subtitle: 'View exam schedules and results',
                        icon: Icons.library_books_outlined,
                        color: Color.fromARGB(255, 177, 197, 250),
                        onPressed: () {},
                      ),
                      SizedBox(height: 16.0),
                      HomeScreenCard(
                        title: 'Timetable',
                        subtitle: 'View class timetables and schedules',
                        icon: Icons.access_time_outlined,
                        color: Color.fromARGB(255, 180, 221, 237),
                        onPressed: () {},
                      ),
                      SizedBox(height: 16.0),
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
  final Color color;
  final VoidCallback onPressed;

  const HomeScreenCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2.0,
            blurRadius: 5.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 40.0,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 4, 28, 63),
                  ),
                ),
                SizedBox(height: 4.0),
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
