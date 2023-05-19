import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class UpdateMarks extends StatefulWidget {
  const UpdateMarks({Key? key, required this.classname}) : super(key: key);
  final String classname;

  @override
  _UpdateMarksState createState() => _UpdateMarksState();
}

class _UpdateMarksState extends State<UpdateMarks> {
  String selectedSubject = 'Mathematics'; // Default subject selected
  String selectedExam = 'Quarterly'; // Default exam selected

  // List of available subjects
  final List<String> subjects = [
    'Mathematics',
    'English',
    'Science',
    'Social Studies',
  ];

  // List of available exams
  final List<String> exams = ['Quarterly', 'Half Yearly', 'Final Exam'];

  late Future<List<Map<String, dynamic>>> studentsFuture;
  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();
    studentsFuture = fetchData();
  }

  Future<List<Map<String, dynamic>>> fetchData() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Student')
        .where('class', isEqualTo: widget.classname)
        .get();
    final students = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();

    controllers = List.generate(
      students.length,
      (index) => TextEditingController(),
    );

    return students;
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Test Marks'),
      
      ),
     
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: studentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error occurred while fetching data'));
          }

          final students = snapshot.data;
          if (students == null || students.isEmpty) {
            return const Center(child: Text('No students found'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    DropdownButton<String>(
                      value: selectedSubject,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        //color: Colors.grey,
                        fontSize: 24,
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
                    const SizedBox(width: 20),
                    DropdownButton<String>(
                      
                      value: selectedExam,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        //color: Colors.grey,
                        fontSize: 24,
                      ),
                                            onChanged: (newValue) {
                        setState(() {
                          selectedExam = newValue!;
                        });
                      },
                      items: exams.map<DropdownMenuItem<String>>((String exam) {
                        return DropdownMenuItem<String>(
                          value: exam,
                          child: Text(exam),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      final Sn = index+1;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text('$Sn'),
                            const SizedBox(width:10 ,),
                            Text(
                              student['firstName'] + ' ' + student['lastName'],
                              //style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  hintText: 'Enter marks',
                                
                                  enabledBorder: UnderlineInputBorder(
                                  
                                  ),
                                ),
                               
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
                      addResult(studentId, selectedSubject, selectedExam, marks).then((_) {
                        print("Result inserted");
                      }).catchError((error) {
                        print("Failed to add result");
                      });
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Function to add student's test result to Firestore database
  Future<void> addResult(
      String studentId, String subject, String exam, String marks) async {
    try {
      await FirebaseFirestore.instance
          .collection('Results')
          .doc(studentId)
          .set({exam: {subject: int.parse(marks)}}, SetOptions(merge: true));
    } catch (error) {
      throw Exception("Failed to add result: $error");
    }
  }
}

