import 'package:flutter/material.dart';
import 'package:pathsala/screens/Teacher/Class_grid.dart';


class Classmgmt extends StatefulWidget {
  @override
  _ClassmgmtState createState() => _ClassmgmtState();
}

class _ClassmgmtState extends State<Classmgmt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Class Management')),
        backgroundColor: const Color.fromARGB(255, 121, 6, 6),
      ),
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCard('View Details', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ClassScreen()),
              );
            }),
            SizedBox(height: 20),
            buildCard('Assign Subjects', () {
             /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AssignSubjects()),
              );*/
            }),
          ],
        ),
      ),
    );
  }

  Widget buildCard(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}



