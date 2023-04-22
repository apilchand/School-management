import 'package:flutter/material.dart';

class MarksTable extends StatelessWidget {
  final Map<String, double> marks;
  MarksTable({required this.marks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Marksheet')),
            backgroundColor: Color.fromARGB(255, 121, 6, 6)),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Table(
            border: TableBorder.all(),
            columnWidths: {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1),
            },
            children: [
              TableRow(
                children: [
                  TableCell(
                      child: Text('Subject',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold))),
                  TableCell(
                      child: Text('Marks',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold))),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('Maths')),
                  TableCell(child: Text('${marks['maths']}')),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('Science')),
                  TableCell(child: Text('${marks['science']}')),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('English')),
                  TableCell(child: Text('${marks['english']}')),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('Social Studies')),
                  TableCell(child: Text('${marks['social']}')),
                ],
              ),
              TableRow(
                children: [
                  TableCell(child: Text('Total')),
                  TableCell(
                    child: Text('${marks.values.reduce((a, b) => a + b)}'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
