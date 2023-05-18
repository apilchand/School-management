import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceReportScreen extends StatelessWidget {
  
  final String documentId;

  const AttendanceReportScreen({
    Key? key,
   
    required this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Attendance Report')),
        backgroundColor: const Color.fromARGB(255, 121, 6, 6),
      ),
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Attendance Report',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 4, 28, 63),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 4, 28, 63),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('Attendance')
                  .doc(documentId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final attendanceData = snapshot.data!.data();
                  if (attendanceData != null) {
                    final studentNames = attendanceData['studentName'] as List<dynamic>;
                    final attendanceStatus = attendanceData['attendance'] as List<dynamic>;

                    return ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: studentNames.length,
                      itemBuilder: (context, index) {
                        final studentName = studentNames[index] as String;
                        final status = attendanceStatus[index] as bool;

                        return ListTile(
                          title: Text(
                            studentName,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: Text(
                            status ? 'Present' : 'Absent',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: status ? Colors.green : Colors.red,
                            ),
                          ),
                        );
                      },
                    );
                  }
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
