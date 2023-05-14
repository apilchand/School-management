import 'package:flutter/material.dart';


class ClassSchedule extends StatefulWidget {
  const ClassSchedule({super.key});

  @override
  _ClassScheduleState createState() => _ClassScheduleState();
}

class _ClassScheduleState extends State<ClassSchedule> {
  final Map<String, Map<String, String>> _schedule = {};

  final List<String> _classOptions = [    'Class 1',    'Class 2',    'Class 3', 'Class 4','Class 5','Class 6','Class 7','Class 8','Class 9','Class 10', ];

  final List<String> _subjects = [    'Math',    'Science',    'History',    'English',    'Art',    'Music',  ];

  final List<String> _teachers = [    'Ms. Smith',    'Mr. Jones',    'Ms. Johnson',    'Mr. Davis',    'Mrs. Brown',    'Mr. Wilson',  ];

  void _saveSchedule(String className, String subject, String teacher) {
    setState(() {
      _schedule[className] = {
        'subject': subject,
        'teacher': teacher,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Schedule'),
         backgroundColor: const Color.fromARGB(255, 121, 6, 6),
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
              value: _classOptions.first,
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
                setState(() {});
              },
            ),
            SizedBox(height: 32.0),
            if (_classOptions.isNotEmpty)
              ...[
                Text(
                  'Assign subject and teacher to ${_classOptions.first}:',
                  style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _schedule[_classOptions.first]?['subject'],
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    border: OutlineInputBorder(),
                  ),
                  items: _subjects.map((subject) {
                    return DropdownMenuItem<String>(
                      value: subject,
                      child: Text(subject),
                    );
                  }).toList(),
                  onChanged: (value) {
                setState(() {});
              },
                ),
                SizedBox(height: 16.0),
                DropdownButtonFormField<String>(
                  value: _schedule[_classOptions.first]?['teacher'],
                  decoration: InputDecoration(
                    labelText: 'Teacher',
                    border: OutlineInputBorder(),
                  ),
                  items: _teachers.map((teacher) {
                    return DropdownMenuItem<String>(
                      value: teacher,
                      child: Text(teacher),
                    );
                  }).toList(),
                  onChanged: (value) {
                setState(() {});
              },
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed:
_onPressed,
                  child: Text('Save'),
                ),
              ],
          ],
        ),
      ),
    );
  }

  void _onPressed() {
    // TODO: Implement save functionality.
    print('Schedule saved!');
  }
}