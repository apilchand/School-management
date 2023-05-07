import 'package:flutter/material.dart';

class AttendanceReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Attendance Report')),
          backgroundColor: Color.fromARGB(255, 121, 6, 6)
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
                  'Attendance Report',
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
                  title: Text('Student ${index + 1}',style: TextStyle(color: Colors.white),),
                  trailing: Text(
                    index % 2 == 0 ? 'Present' : 'Absent',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: index % 2 == 0 ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
