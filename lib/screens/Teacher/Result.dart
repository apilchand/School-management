import 'package:flutter/material.dart';
import 'package:pathsala/screens/Student/result.dart';
import 'Result_input.dart';

class ResultSection extends StatelessWidget {
  final String classname;

  const ResultSection({super.key, required this.classname});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
         backgroundColor: const Color.fromARGB(255, 121, 6, 6)
      ),
      backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Show Report'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Examresult()),
                );
              },
              style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Update Test Marks'),
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
