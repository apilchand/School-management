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
        title: 
        Center(child: Text('Teacher Panel')),
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
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white), 
            ),
          ),
          Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: EdgeInsets.all(4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromARGB(255, 4, 31, 71),
                      ),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Image.asset(
                        'images/picture.jpg',
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color.fromARGB(255, 6, 36, 82),
                      ),
                      child:
                      SingleChildScrollView(child:         
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Name: [Teacher's Name]",style: TextStyle(color: Colors.white)),
                          
                          Text("Address: Kanchanpur",style: TextStyle(color: Colors.white)),
                          Text("Contact: 9865701163",style: TextStyle(color: Colors.white)),
                          Text("Email: tzirw@example.com",style: TextStyle(color: Colors.white)),
                         
                        ],
                      )
                      )
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
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
                                builder: (context) => TeacherTimeTableScreen( teacherName: 'Teacher Name',),
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
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, String title, IconData iconData, VoidCallback onTap) {
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
