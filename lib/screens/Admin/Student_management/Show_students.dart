import 'package:flutter/material.dart';
import 'package:pathsala/screens/Teacher/Student_info.dart';



class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  Map<String, List<String>> _students = {
    'Class 1': ['John', 'Jane', 'Bob'],
    'Class 2': ['Alice', 'Charlie', 'David'],
    'Class 3': ['Eve', 'Frank', 'Grace'],
  };

  final List<String> _classOptions = [
    'Class 1',
    'Class 2',
    'Class 3',
  ];

  String _selectedClass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),backgroundColor: Color.fromARGB(255, 121, 6, 6)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a class:',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedClass.isNotEmpty ? _selectedClass : null,
              decoration: InputDecoration(
                labelText: 'Class',
                border: OutlineInputBorder(),
              ),
              items: _classOptions.map((className) {
                return DropdownMenuItem<String>(
                  value: className,
                  child: Text(className),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedClass = value!;
                });
              },
            ),
            SizedBox(height: 32.0),
            if (_selectedClass.isNotEmpty)
              ...[
                Text(
                  'Students in $_selectedClass:',
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: _students[_selectedClass]?.length ?? 0,
                    itemBuilder: (context, index) {
                      final studentName = _students[_selectedClass]![index];
                      return ListTile(
                        title: Text(studentName),
                        onTap: () {
                         /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  StudentInfoScreen(student: studentName),
                            ),
                          );*/
                        },
                      );
                    },
                  ),
                ),
              ],
          ],
        ),
      ),
    );
  }
}
