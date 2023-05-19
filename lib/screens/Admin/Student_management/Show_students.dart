import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pathsala/screens/Teacher/Student_info.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  late Future<List<Student>> _students;
  final List<String> _classOptions = List.generate(10, (index) => 'Class ${index + 1}');
  String _selectedClass = '';

  @override
  void initState() {
    super.initState();
    _selectedClass = _classOptions.first;
    _students = _fetchStudents(_selectedClass);
  }

  Future<List<Student>> _fetchStudents(String className) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Student')
        .where('class', isEqualTo: className)
        .get();

    return querySnapshot.docs.map((doc) {
      final firstName = doc['firstName'] as String;
      final lastName = doc['lastName'] as String;
      final studentId = doc['studentId'] as String;
      final studentName = '$firstName $lastName';
      return Student(name: studentName, id: studentId);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a class:',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: _selectedClass.isNotEmpty ? _selectedClass : null,
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
                  _students = _fetchStudents(_selectedClass);
                });
              },
            ),
            const SizedBox(height: 32.0),
            FutureBuilder<List<Student>>(
              future: _students,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No students available.');
                } else {
                  final students = snapshot.data!;
                  return Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height - 200, 
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Students in $_selectedClass:',
                              style: const TextStyle(fontSize: 24.0),
                            ),
                            const SizedBox(height: 16.0),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: students.length,
                              itemBuilder: (context, index) {
                                final student = students[index];
                                return ListTile(
                                  title: Text(student.name),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StudentInfoScreen(studentId: student.id),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Student {
  final String name;
  final String id;

  Student({required this.name, required this.id});
}
