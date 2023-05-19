import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  final List<List<String>> _timetableData = [
    ['Math', 'Science', 'English', 'Social Studies', 'Math'],
    ['English', 'Math', 'Science', 'Math', 'Social Studies'],
    ['Science', 'English', 'Math', 'Social Studies', 'English'],
    ['Math', 'Social Studies', 'Science', 'Math', 'Science'],
    ['Social Studies', 'Science', 'English', 'Math', 'English'],
    ['Science', 'English', 'Math', 'Social Studies', 'English'],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color.fromARGB(255, 4, 28, 63),
      appBar: AppBar(
        title: const Text('Timetable'),
        //backgroundColor: Color.fromARGB(255, 121, 6, 6),
      ),
      body: ListView.builder(
        itemCount: _timetableData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            
            //color: Colors.white,
            margin: EdgeInsets.symmetric(
    horizontal: MediaQuery.of(context).size.width * 0.1,
    vertical: MediaQuery.of(context).size.height * 0.02,),
            
            //color: Colors.white,
            child:
             
            Padding(
              
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Day ${index + 1}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('10:00 - 11:00'),
                      Text(_timetableData[index][0]),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('11:00 - 12:00'),
                      Text(_timetableData[index][1]),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('12:00 - 1:00'),
                      Text(_timetableData[index][2]),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text('1:00 - 2:00'),
                      Text(_timetableData[index][3]),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
