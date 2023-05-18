import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MonthlyAttendanceLogScreen extends StatefulWidget {
  final String studentName;

  MonthlyAttendanceLogScreen({required this.studentName});

  @override
  State<MonthlyAttendanceLogScreen> createState() =>
      _MonthlyAttendanceLogScreenState();
}

class _MonthlyAttendanceLogScreenState
    extends State<MonthlyAttendanceLogScreen> {
  late Stream<QuerySnapshot> _attendanceStream;
  List<String> _months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  String _selectedMonth = '';

  @override
  void initState() {
    super.initState();
    _selectedMonth = _months[DateTime.now().month - 1];
    _attendanceStream = FirebaseFirestore.instance
        .collection('Attendance')
        .where('studentName', isEqualTo: widget.studentName)
        .where('month', isEqualTo: _selectedMonth)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Attendance Log'),
        backgroundColor: const Color.fromARGB(255, 121, 6, 6),
      ),
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: Column(
        children: [
          _buildMonthDropdown(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemCount: DateTime(DateTime.now().year, _months.indexOf(_selectedMonth) + 1, 0).day,
              itemBuilder: (context, index) {
                final day = (index + 1).toString();

                return StreamBuilder<QuerySnapshot>(
                  stream: _attendanceStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final attendanceDocs = snapshot.data!.docs;
                      final attendanceDoc = attendanceDocs.firstWhere(
                        (doc) => doc.id == day,
                       
                      );
                      final attendanceStatus =
                          attendanceDoc != null && attendanceDoc['attendance'];

                      final boxColor =
                          attendanceStatus ? Colors.green : Colors.red;

                      return GestureDetector(
                        onTap: () {
                          // Handle box tap event if needed
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: boxColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              day,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      // Return a fallback option with an empty box
                      return GestureDetector(
                        onTap: () {
                          // Handle box tap event if needed
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              day,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthDropdown() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<String>(
        value: _selectedMonth,
        items: _months.map((String month) {
          return DropdownMenuItem<String>(
            value: month,
            child: Text(
              month,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedMonth = newValue;
              _attendanceStream = FirebaseFirestore.instance
                  .collection('Attendance')
                  .where('studentName', isEqualTo: widget.studentName)
                  .where('month', isEqualTo: _selectedMonth)
                  .snapshots();
            });
          }
        },
      ),
    );
  }
}
