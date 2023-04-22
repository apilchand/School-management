import 'package:flutter/material.dart';

class MonthlyAttendanceLogPage extends StatefulWidget {
  @override
  _MonthlyAttendanceLogPageState createState() =>
      _MonthlyAttendanceLogPageState();
}

class _MonthlyAttendanceLogPageState extends State<MonthlyAttendanceLogPage> {
  String studentName = 'Apil Chand';
  int daysInMonth = 30;
  List<bool> attendance = List.filled(30, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Log - $studentName'),
        backgroundColor: Color.fromARGB(255, 121, 6, 6),
      ),
      body:
       Container(
        padding: EdgeInsets.all(25),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                itemCount: daysInMonth,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        attendance[index] = !attendance[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: attendance[index] ? Colors.green : null,
                      ),
                      child: Center(
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
           
          ],
             ),
       ),
    );
  }
}
