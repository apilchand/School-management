import 'package:flutter/material.dart';
import '../../about.dart';
import 'Class_grid.dart';
import 'upload.dart';
import 'Teacher_Timetable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class TeacherData{
  final String name;
  final String contact;
  final String email;
  final String gender;
  TeacherData(
    {
      required this.name,
      required this.contact,
      required this.email,
      required this.gender,

    }
  );
}

class TeacherDashboardScreen extends StatelessWidget {
  final String teacherId;

  const TeacherDashboardScreen({Key? key, required this.teacherId}) : super(key: key);

Future<TeacherData> getTeacherData(String teacherId) async {
    DocumentSnapshot snapshot =
        await db.collection('Teacher').doc(teacherId).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return TeacherData(
      name: data['firstName']+' ' +data['lastName'],
      contact: data['contact'],
      email: data['email'],
      gender: data['gender'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(child: Text('Teacher Panel')),
           // backgroundColor: const Color.fromARGB(255, 121, 6, 6)
           ),
       // backgroundColor: const Color.fromARGB(255, 4, 28, 63),
        body: 
        
        FutureBuilder<TeacherData>(
          future: getTeacherData(teacherId),
          builder: (BuildContext context,
                    AsyncSnapshot<TeacherData> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }
                  TeacherData teacherData = snapshot.data!;

           return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Welcome,${teacherData.name}!',
                  style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                     ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        //color: Colors.purple,
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
                    const SizedBox(width: 30),
                     Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name: ${teacherData.name}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Gender: ${teacherData.gender}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Contact: ${teacherData.contact}",
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Email: ${teacherData.email}",
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
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
                                  teacherName: teacherData.name,
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
                                builder: (context) => const UploadContentScreen(),
                              ),
                            );
                          }
                        },
                      ),
                      _buildItem(
                        context,
                        'About',
                        Icons.adobe_outlined,
                        () {
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
                ),
              ),
            ],
          );
  }
    )
    );
   
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
              //color: Colors.purple,
            ),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
