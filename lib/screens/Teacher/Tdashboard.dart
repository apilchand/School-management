import 'package:flutter/material.dart';
import 'Class_grid.dart';
import 'upload.dart';
import 'Teacher_Timetable.dart';

class TeacherDashboardScreen extends StatelessWidget {
  TeacherDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Teacher Panel')),
            backgroundColor: Color.fromARGB(255, 121, 6, 6)),
        backgroundColor: Color.fromARGB(255, 4, 28, 63),
        body: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Welcome, [Teacher Name]!',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple,
                    ),
                    width: 130,
                    height: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'images/picture.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: [Teacher's Name]",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Address: Kanchanpur",
                        ),
                        Text(
                          "Contact: 9865701163",
                        ),
                        Text(
                          "Email: tzirw@example.com",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  shrinkWrap: true,
                  
                  children: [
                    _buildItem(
                      context,
                      'Manage Classes',
                      Icons.class_,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClassScreen(),
                          ),
                        );
                      },
                    ),
                    _buildItem(
                      context,
                      'Timetable',
                      Icons.calendar_today,
                      () {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherTimeTableScreen(
                                teacherName: 'Teacher Name',
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    _buildItem(
                      context,
                      'Upload',
                      Icons.file_open,
                      () {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UploadContentScreen(),
                            ),
                          );
                        }
                      },
                    ),
                    _buildItem(
                      context,
                      'Grades',
                      Icons.grade,
                      () {
                        // Navigate to grade management screen
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildItem(BuildContext context, String title, IconData iconData,
      VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 64.0,
              color: Colors.purple,
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
