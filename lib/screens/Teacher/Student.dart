import 'package:flutter/material.dart';
import 'Student_info.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
   List<Student> _students = [
    Student('Ram', 'Class 10', 'Male','https://picsum.photos/id/31/3264/4912'),
    Student('Sita', 'Class 10', 'Female','https://picsum.photos/id/31/3264/4912'),
    Student('Sital', 'Class 10', 'Male','https://picsum.photos/id/31/3264/4912'),
    Student('Harimaya', 'Class 10', 'Female','https://picsum.photos/id/30/1280/901'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      appBar: AppBar(
        title: Text('Student List'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 121, 6, 6)
      ),
      body: ListView.builder(
        itemCount: _students.length,
        itemBuilder: (context, index) {
          final student = _students[index];
          return ListTile(
            title: Text(student.name,style: TextStyle(color: Colors.white),),
            subtitle: Text(student.gender,style: TextStyle(color: Colors.white),),
            trailing: Icon(Icons.arrow_circle_right_rounded,
            color: Colors.purple,),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentInfoScreen(student: student),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Student {
  final String name;
  final String classname;
  final String gender;
  final String photoUrl;

  Student(this.name, this.classname, this.gender, this.photoUrl);
}


