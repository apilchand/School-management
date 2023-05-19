import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pathsala/screens/Teacher/Attendanc_report.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;
final CollectionReference attendanceCollection = db.collection('Attendance');
final CollectionReference studentsCollection = db.collection('Student');

class AttendanceScreen extends StatefulWidget {
  final String classname;
  const AttendanceScreen({Key? key, required this.classname}) : super(key: key);

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late Stream<QuerySnapshot> studentsStream;
  List<bool> isCheckedList = [];
  List<String> studentNames = [];

  @override
  void initState() {
    super.initState();
    studentsStream = studentsCollection.where('class', isEqualTo: widget.classname).snapshots();

    studentsStream.listen((snapshot) {
      final students = snapshot.docs;
      isCheckedList = List.generate(students.length, (index) => false);
      studentNames = students.map((student) => '${student['firstName']} ${student['lastName']}').toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Take Attendance')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            decoration: const BoxDecoration(
              color: Color(0xFF7A5367),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Today\'s Date',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: studentsStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final students = snapshot.data!.docs;

                  return ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      final int Sn = index + 1;

                      return ListTile(
                        leading: Text('$Sn'),
                        title: Text(
                          student['firstName'] + ' ' + student['lastName'],
                        ),
                        trailing: Checkbox(
                          value: isCheckedList[index],
                          onChanged: (value) {
                            setState(() {
                              isCheckedList[index] = value!;
                            });
                          },
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Map<String, dynamic> formData = {
                  'attendance': isCheckedList,
                  'studentName': studentNames,
                };
                String documentID =
                    '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}';

                addAttendance(documentID, formData).then((value) {
                  setState(() {
                    isCheckedList = List.generate(studentNames.length, (index) => false);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceReportScreen(documentId: documentID),
                    ),
                  );
                }).catchError((error) {
                  print("Failed to add attendance: $error");
                });
              },
              child: const Text('Submit Attendance'),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AttendanceReportScreen(documentId: '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}'),
                  ),
                );
              },
              child: const Text('View Attendance Report'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> addAttendance(String documentID, Map<String, dynamic> formData) {
    return attendanceCollection.doc(documentID).set(formData);
  }
}
