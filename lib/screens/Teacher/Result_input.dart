
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class UpdateMarks extends StatefulWidget {
  @override
  _UpdateMarksState createState() => _UpdateMarksState();
}

class _UpdateMarksState extends State<UpdateMarks> {
  String selectedSubject = 'Mathematics'; // Default subject selected

  // List of available subjects
  final List<String> subjects = [
    'Mathematics',
    'English',
    'Science',
    'Social Studies',
  ];
  final List<Map<String, dynamic>> students = [
    {"id": "1", "name": "John Doe"},
    {"id": "2", "name": "Jane Doe"},
    {"id": "3", "name": "Bob Smith"},
    // add more students here
  ];
  final List<TextEditingController> controllers = List.generate(
      30, (index) => TextEditingController()); // create a controller for each input field

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Test Marks'),
        backgroundColor: const Color.fromARGB(255, 121, 6, 6),
        actions: [
          // DropdownButton to choose subject
          DropdownButton<String>(
            value: selectedSubject,
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            onChanged: (newValue) {
              setState(() {
                selectedSubject = newValue!;
              });
            },
            items: subjects.map<DropdownMenuItem<String>>((String subject) {
              return DropdownMenuItem<String>(
                value: subject,
                child: Text(subject),
              );
            }).toList(),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            student["name"],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              hintText: 'Enter marks',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                            controller: controllers[index],
                            onChanged: (text) {},
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () {
                for (int i = 0; i < students.length; i++) {
                  String marks = controllers[i].text;
                  String studentId = students[i]["id"];
                  addResult(studentId, selectedSubject, marks)
                      .then((_) {
                       print("Result inserted");
                      })
                      .catchError((error) {
                    print("Failed to add result"); });
                }
            },
          ),
          ]
        ),
      ),
    );
  }

  // Function to add student's test result to Firestore database
  Future<void> addResult(
      String studentId, String subject, String marks) async {
    try {
      await FirebaseFirestore.instance
          .collection('Results')
          .doc(studentId)
          .set({subject: int.parse(marks)}, SetOptions(merge: true));
    } catch (error) {
      throw Exception("Failed to add result: $error");
    }
  }
}

