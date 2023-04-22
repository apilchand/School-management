import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  final List<List<String>> _timetableData = [    ['Math', 'Science', 'English', 'Social Studies', 'Math'],
    ['English', 'Math', 'Science', 'Math', 'Social Studies'],
    ['Science', 'English', 'Math', 'Social Studies', 'English'],
    ['Math', 'Social Studies', 'Science', 'Math', 'Science'],
    ['Social Studies', 'Science', 'English', 'Math', 'English'],
    ['Science', 'English', 'Math', 'Social Studies', 'English'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
        backgroundColor: Color.fromARGB(255, 121, 6, 6)
      ),
      body: 
      Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  _buildTableCell('Time'),
                  _buildTableCell('Sunday'),
                  _buildTableCell('Monday'),
                  _buildTableCell('Tuesday'),
                  _buildTableCell('Wednesday'),
                  _buildTableCell('Thursday'),
                  _buildTableCell('Friday'),
                ]),
                TableRow(children: [
                  _buildTableCell('10:00 - 11:00'),
                  _buildTableCell(_timetableData[0][0]),
                  _buildTableCell(_timetableData[1][0]),
                  _buildTableCell(_timetableData[2][0]),
                  _buildTableCell(_timetableData[3][0]),
                  _buildTableCell(_timetableData[4][0]),
                  _buildTableCell(_timetableData[5][0]),
                ]),
                TableRow(children: [
                  _buildTableCell('11:00 - 12:00'),
                  _buildTableCell(_timetableData[0][1]),
                  _buildTableCell(_timetableData[1][1]),
                  _buildTableCell(_timetableData[2][1]),
                  _buildTableCell(_timetableData[3][1]),
                  _buildTableCell(_timetableData[4][1]),
                  _buildTableCell(_timetableData[5][1]),
                ]),
                TableRow(children: [
                  _buildTableCell('12:00 - 1:00'),
                  _buildTableCell(_timetableData[0][2]),
                  _buildTableCell(_timetableData[1][2]),
                  _buildTableCell(_timetableData[2][2]),
                  _buildTableCell(_timetableData[3][2]),
                  _buildTableCell(_timetableData[4][2]),
                  _buildTableCell(_timetableData[5][2]),
                ]),
                TableRow(children: [
                  _buildTableCell('1:00 - 2:00'),
                  _buildTableCell(_timetableData[0][3]),
                  _buildTableCell(_timetableData[1][3]),
                  _buildTableCell(_timetableData[2][3]),
                  _buildTableCell(_timetableData[3][3]),
                  _buildTableCell(_timetableData[4][3]),
                  _buildTableCell(_timetableData[5][3]),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
