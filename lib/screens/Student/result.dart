import 'package:flutter/material.dart';


class ExamResult {
  final String examName;
  final List<String> subjects;
  final List<int> marks;

  ExamResult(this.examName, this.subjects, this.marks);
}

class ResultDataSource {
  List<ExamResult> getResults() {
    // Replace this method with  own logic for retrieving
    // results data for a student from a database or other data source.
    
    return [    
      ExamResult("Final Exam", ["Math", "Science", "English", "Social Studies"], [90, 95, 85, 90]),
      ExamResult("Quarterly Exam", ["Math", "Science", "English", "Social Studies"], [80, 85, 75, 82]),
      ExamResult("Half-Yearly Exam", ["Math", "Science", "English", "Social Studies"], [95, 97, 90, 92]),
      
    ];
  }
}

class Examresult extends StatefulWidget {
  const Examresult({super.key});

  @override
  State<Examresult> createState() => _ExamresultState();
}

class _ExamresultState extends State<Examresult> {
  int _selectedExamIndex = 0;
  ResultDataSource dataSource = ResultDataSource();
  @override
  Widget build(BuildContext context) {
    
    List<ExamResult> results = dataSource.getResults();

    return  Scaffold(
        appBar: AppBar(
          title: const Text('Exam Results'),
          centerTitle: true,
          //backgroundColor: Color.fromARGB(255, 121, 6, 6)
        ),
        // backgroundColor: Color.fromARGB(255, 4, 28, 63),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select an exam:',
                  style: TextStyle(
                   // color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedExamIndex == index ? Colors.purple : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _selectedExamIndex = index;
                            });
                          },
                          child: Text(
                            results[index].examName,
                            style: const TextStyle(
                              //color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Exam Result:',
                  style: TextStyle(
                   // color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10
),
                Container(
                  decoration: BoxDecoration(
                   // color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subject',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Marks',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: results[_selectedExamIndex].subjects.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(results[_selectedExamIndex].subjects[index]),
                                Text(results[_selectedExamIndex].marks[index].toString()),
                              ],
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total Marks:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              results[_selectedExamIndex].marks.reduce((a, b) => a + b).toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  
  }
}