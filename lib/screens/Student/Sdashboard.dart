import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pathsala/screens/Student/attendance.dart';
import 'package:pathsala/screens/Student/download.dart';
import 'package:pathsala/screens/Student/notices.dart';
import 'package:pathsala/screens/Student/result.dart';
import 'package:pathsala/screens/Student/timetable.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class StudentData {
  final String name;
  final String contact;
  final String parentsName;
  final String className;
  final String profile;

  StudentData({
    required this.name,
    required this.contact,
    required this.parentsName,
    required this.className,
    required this.profile,
  });
}

class Notice {
  final String title;
  final String message;
  final String postedOn;

  Notice({
    required this.title,
    required this.message,
    required this.postedOn,
  });
}

class StudentDashboard extends StatelessWidget {
  final String studentId;

  StudentDashboard({Key? key, required this.studentId}) : super(key: key);

  Future<StudentData> getStudentData(String studentId) async {
    DocumentSnapshot documentSnapshot =
        await db.collection('Student').doc(studentId).get();

    if (!documentSnapshot.exists) {
      throw Exception('Document does not exist or data is null');
    }
    Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;

    if (data == null) {
      throw Exception('Data is null');
    }

    return StudentData(
        name: data['firstName'] + data['lastName'],
        contact: data['contact'],
        parentsName: data['fatherName'],
        className: data['class'],
        profile: data['profilePictureURL']);
  }

  Future<Notice> getLatestNotice() async {
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
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              FutureBuilder<StudentData>(
                future: getStudentData(studentId),
                builder:
                    (BuildContext context, AsyncSnapshot<StudentData> snapshot) {
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

                  StudentData studentData = snapshot.data!;

                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 120,
                          height: 120,
                          child:  CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(studentData.profile),
                ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Name: ${studentData.name}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      'Contact:',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      studentData.contact,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  studentData.className,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Text(
                                      "Parent's Name:",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      studentData.parentsName,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder<Notice>(
                future: getLatestNotice(),
                builder:
                    (BuildContext context, AsyncSnapshot<Notice> snapshot) {
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

                  Notice notice = snapshot.data!;

                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Notice',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              child: const Text(
                                'view All',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NoticeScreen(),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          notice.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          notice.message,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'posted on:-${notice.postedOn}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Links',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MonthlyAttendanceLogScreen(
                                    studentName: 'Apil Chand',
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Column(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 50,
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
                        const SizedBox(width: 20),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Examresult(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Column(
                                children: [
                                  Icon(
                                    Icons.assignment,
                                    size: 50,
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
                    const SizedBox(height: 20),
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
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Column(
                                children: [
                                  Icon(
                                    Icons.schedule,
                                    size: 50,
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
                        const SizedBox(width: 20),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ResourceDownloadPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Column(
                                children: [
                                  Icon(
                                    Icons.file_download,
                                    size: 50,
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
