import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pathsala/screens/Teacher/Attendanc_report.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;
final CollectionReference attendanceCollection = db.collection('Attendance');

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<bool> isCheckedList = List.generate(30, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Take Attendance')),
        backgroundColor: Color.fromARGB(255, 121, 6, 6),
      ),
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Today\'s Date',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 4, 28, 63),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 4, 28, 63),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: 30,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'Student ${index + 1}',
                    style: TextStyle(color: Colors.white),
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
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Map<String, dynamic> formData = {
                  'date': DateTime.now(),
                  'attendance': isCheckedList,
                };
                String documentID = '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}+class';
                addAttendance(documentID, formData).then((value) {
                  setState(() {
                    isCheckedList = List.generate(30, (index) => false);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AttendanceReportScreen(),
                    ),
                  );
                }).catchError((error) {
                  print("Failed to add attendance: $error");
                });
              },
              child: Text('Submit Attendance'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              ),
            ),
          ),
          SizedBox(height: 16,),
          Container(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AttendanceReportScreen(),
                ),
              );
            },
              
              child: Text('View Attendance Report'),
              style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              
              ),
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



