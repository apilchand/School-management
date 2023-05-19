import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClassSchedule extends StatefulWidget {
  const ClassSchedule({Key? key}) : super(key: key);

  @override
  _ClassScheduleState createState() => _ClassScheduleState();
}

class _ClassScheduleState extends State<ClassSchedule> {
  final List<String> _classOptions = [
    'Class 1',
    'Class 2',
    'Class 3',
    'Class 4',
    'Class 5',
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
  ];

  final List<String> _subjects = [
    'Math',
    'Science',
    'Social Studies',
    'English',
    
  ];

  Teacher? _selectedTeacher;
  String _selectedClass = 'Class 1';
  String _selectedSubject = 'Math';

  List<Teacher> teachers = [];

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _fetchTeachers();
  }

  Future<void> _fetchTeachers() async {
    try {
      final snapshot = await firestore.collection('Teacher').get();
      final teacherList = snapshot.docs.map((doc) {
        final teacherId = doc['teacherId'];
        final firstName = doc['firstName'] as String;
        final lastName = doc['lastName'] as String;
        final teacherName = '$firstName $lastName';
        return Teacher(id: teacherId, name: teacherName, teacherId: teacherId);
      }).toList();

      setState(() {
        teachers = teacherList;
      });
    } catch (error) {
      print('Error fetching teachers: $error');
    }
  }

  void _saveSchedule() async {
    if (_formKey.currentState!.validate()) {
      try {
        final classDoc = firestore.collection('Class').doc(_selectedClass);

        await classDoc.update({
          'subject': _selectedSubject,
          'teacherId': _selectedTeacher!.teacherId,
        });

        setState(() {
          _selectedClass = 'Class 1';
          _selectedSubject = 'Math';
          _selectedTeacher = null;
        });

        const snackBar = SnackBar(
          content: Text('Subject assigned successfully!'),
          duration: Duration(seconds: 2),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } catch (error) {
        print('Error saving schedule: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Class Schedule'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select a class:',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                value: _selectedClass,
                decoration: const InputDecoration(
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
              const SizedBox(height: 32.0),
              if (_classOptions.isNotEmpty)
                ...[
                  Text(
                    'Assign subject and teacher to $_selectedClass:',
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    value: _selectedSubject,
                    decoration: const InputDecoration(
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
                      setState(() {
                        _selectedSubject = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<Teacher>(
                    value: _selectedTeacher,
                    decoration: const InputDecoration(
                      labelText: 'Teacher',
                      border: OutlineInputBorder(),
                    ),
                    items: teachers.map((teacher) {
                      return DropdownMenuItem<Teacher>(
                        value: teacher,
                        child: Text(teacher.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedTeacher = value;
                      });
                    },
                  ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: _saveSchedule,
                    child: const Text('Save'),
                  ),
                ],
            ],
          ),
        ),
      ),
    );
  }
}

class Teacher {
  final String id;
  final String name;
  final String teacherId;

  Teacher({
    required this.id,
    required this.name,
    required this.teacherId,
  });
}
