import 'package:flutter/material.dart';
import 'package:pathsala/screens/Student/result.dart';
import 'Result_input.dart';

class ResultSection extends StatelessWidget {
  final String classname;

  const ResultSection({Key? key, required this.classname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Examresult()),
                );
              },
              child: const Text('Show Report'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateMarks(classname: classname),
                  ),
                );
              },
              child: const Text('Update Test Marks'),
            )
          ],
        ),
      ),
    );
  }
}
