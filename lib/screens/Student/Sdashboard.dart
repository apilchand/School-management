import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pathsala/screens/Student/attendance.dart';
import 'package:pathsala/screens/Student/download.dart';
import 'package:pathsala/screens/Student/result.dart';
import 'package:pathsala/screens/Student/timetable.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class StudentData {
  final String name;
  final String contact;
  final String parentsName;
  final String className;

  StudentData(
      {required this.name,
      required this.contact,
      required this.parentsName,
      required this.className});
}

class Notice {
  final String title;
  final String message;
  final String postedOn;

  Notice({required this.title, required this.message, required this.postedOn});
}



class StudentDashboard extends StatelessWidget {  
  final String studentId;

  StudentDashboard({Key? key, required this.studentId}) : super(key: key);
  Future<StudentData> getStudentData(String studentId) async {
    DocumentSnapshot snapshot =
        await db.collection('Student').doc(studentId).get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return StudentData(
      name: data['firstName'],
      contact: data['contact'],
      parentsName: data['fatherName'],
      className: data['class'],
    );
  }

  Future<Notice> getLatestNotice(String className) async {
    QuerySnapshot querySnapshot = await db
        .collection('Notice')
        
        .orderBy('postedOn', descending: true)
        .limit(1)
        .get();

    Map<String, dynamic> data =
        querySnapshot.docs.first.data() as Map<String, dynamic>;

    return Notice(
      title: data['title'],
      message: data['message'],
      postedOn: data['postedOn'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      appBar: AppBar(
          title: Text('Student Dashboard'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 121, 6, 6)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              
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
                        color: Colors.grey[200],
                      ),
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'images/picture.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    FutureBuilder<StudentData>(
                future: getStudentData(studentId),
                builder: (BuildContext context,
                    AsyncSnapshot<StudentData> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  StudentData studentData = snapshot.data!;
                  
                    return Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name: ${studentData.name}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Contact:',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                studentData.contact,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            studentData.className,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                "Parent's Name:",
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                studentData.parentsName,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                    }
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              FutureBuilder<Notice>(
                future: getLatestNotice('Class 10'),
                builder:
                    (BuildContext context, AsyncSnapshot<Notice> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  Notice notice = snapshot.data!;

              return Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple[600],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Notice',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      notice.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      notice.message,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      notice.postedOn,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
                    }
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quick Links',
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Attendancelog(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 50,
                                    color: Colors.purple,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Attendance',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Examresult(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.assignment,
                                    size: 50,
                                    color: Colors.purple,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Result',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TimetableScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.schedule,
                                    size: 50,
                                    color: Colors.purple,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Timetable',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResourceDownloadPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.file_download,
                                    size: 50,
                                    color: Colors.purple,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Downloads',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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
