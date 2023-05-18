import 'package:flutter/material.dart';

class StudentMarks extends StatefulWidget {
  const StudentMarks({super.key});

  @override
  _StudentMarksState createState() => _StudentMarksState();
}

class _StudentMarksState extends State<StudentMarks> {
  final Map<String, Map<String, Map<String, Map<String, double>>>> _studentMarks = {
    'Class 1': {
      'Quarterly': {
        'John': {
          'Math': 90,
          'Science': 85,
          'Social': 75,
          'English': 80,
          
        },
        'Alice': {
          'Math': 85,
          'Science': 90,
          'Socail': 80,
          'English': 75,
          
        },
        'Bob': {
          'Math': 95,
          'Science': 92,
          'Socail': 85,
          'English': 90,
        
        },
      },
      'Half-Yearly': {
        'John': {
          'Math': 80,
          'Science': 75,
          'Social': 70,
          'English': 85,
          
        },
        'Alice': {
          'Math': 90,
          'Science': 85,
          'History': 75,
          'English': 80,
          'Art': 80,
          'Music': 85,
        },
        'Bob': {
          'Math': 85,
          'Science': 92,
          'History': 85,
          'English': 90,
          'Art': 85,
          'Music': 75,
        },
      },
      'Annual': {
        'John': {
          'Math': 85,
          'Science': 80,
          'History': 70,
          'English': 75,
          'Art': 65,
          'Music': 70,
        },
        'Alice': {
          'Math': 90,
          'Science': 85,
          'History': 75,
          'English': 80,
          'Art': 85,
          'Music': 80,
        },
        'Bob': {
          'Math': 95,
          'Science': 92,
          'History': 85,
          'English': 90,
          'Art': 80,
          'Music': 75,
        },
      },
    },
    'Class 2': {
      'Quarterly': {
        'John': {
          'Math': 90,
          'Science': 85,
          'History': 75,
          'English': 80,
          'Art': 70,
          'Music': 75,
        },
        'Alice': {
          'Math': 85,
          'Science': 90,
          'History': 80,
          'English': 75,
          'Art': 85,
          'Music': 80,
        },
        'Bob': {
          'Math': 95,
          'Science': 92,
          'History': 85,
          'English': 90,
          'Art': 80,
          'Music': 75,
        },
      },
      'Half-Yearly': {
        'John': {
          'Math': 80,
          'Science': 75,
          'History': 70,
          'English': 85,
          'Art': 65,
          'Music': 70,
        },
        'Alice': {
          'Math': 90,
          'Science': 85,
          'History': 75,
          'English': 80,
          'Art': 85,
          'Music': 80,
        },
        'Bob': {
          'Math': 95,
          'Science': 92,
          'History': 85,
          'English': 90,
          'Art': 80,
          'Music': 75,
        }
      },

      'Annual': {
        'John': {
          'Math': 85,
          'Science': 80,
          'History': 70,
          'English': 75,
          'Art': 65,
          'Music': 70,
        },
        'Alice': {
          'Math': 90,
          'Science': 85,
          'History': 75,
          'English': 80,
          'Art': 85,
          'Music': 80,
        },
        'Bob': {
          'Math': 95,
          'Science': 92,
          'History': 85,
          'English': 90,
          'Art': 80,
          'Music': 75,
        },
      },
    },
  };

  String _selectedClass = 'Class 1';
  String _selectedExam = 'Quarterly';
  String _selectedStudent = 'John';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Marks'),backgroundColor: const Color.fromARGB(255, 121, 6, 6),
      ),
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<String>(
                value: _selectedClass,
                items: _studentMarks.keys
                    .map((className) => DropdownMenuItem<String>(
                          value: className,
                          child: Text(className, style: const TextStyle(color: Colors.white),),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedClass = value!;
                    _selectedExam = _studentMarks[_selectedClass]!.keys.first;
                    _selectedStudent =
                        _studentMarks[_selectedClass]![_selectedExam]!.keys.first;
                  });
                },
              ),
              DropdownButton<String>(
                value: _selectedExam,
                items: _studentMarks[_selectedClass]!.keys
                    .map((examName) => DropdownMenuItem<String>(
                          value: examName,
                          child: Text(examName, style: const TextStyle(color: Colors.white),),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedExam = value!;
                    _selectedStudent =
                        _studentMarks[_selectedClass]![_selectedExam]!.keys.first;
                  });
                },
              ),
              DropdownButton<String>(
                value: _selectedStudent,
                items: _studentMarks[_selectedClass]![_selectedExam]!.keys
                    .map((studentName) => DropdownMenuItem<String>(
                          value: studentName,
                          child: Text(studentName, style: const TextStyle(color: Colors.white),),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedStudent = value!;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: 
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: _studentMarks[_selectedClass]![_selectedExam]![_selectedStudent]!
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    final subjectName = _studentMarks[_selectedClass]![_selectedExam]![_selectedStudent]!
                        .keys
                        .toList()[index];
                    final subjectMarks = _studentMarks[_selectedClass]![_selectedExam]![_selectedStudent]![subjectName];
                    return ListTile(
                      title: Text(subjectName),
                      trailing: Text(subjectMarks.toString()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  }