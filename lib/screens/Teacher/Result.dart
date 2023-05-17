import 'package:flutter/material.dart';
import 'Result_input.dart';
import 'Result_report.dart';

class ResultSection extends StatelessWidget {
  final String classname;

  const ResultSection({super.key, required this.classname});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
         backgroundColor: Color.fromARGB(255, 121, 6, 6)
      ),
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Show Report'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultReport()),
                );
              },
              style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Update Test Marks'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateMarks(classname: classname,)),
                );
              },
              style:ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
