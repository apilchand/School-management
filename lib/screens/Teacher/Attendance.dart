import 'package:flutter/material.dart';
import 'package:pathsala/screens/Teacher/Attendanc_report.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Take Attendance')),
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
                  title: Text('Student ${index + 1}', style: TextStyle(color: Colors.white),),
                  trailing: Checkbox(
                    value: index % 2 == 0 ? true : false,
                    onChanged: (value) {},
                  ),
                );
              },
            ),
          ),
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
}
