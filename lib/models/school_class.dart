import 'student.dart';
import 'subject.dart';
import 'teacher.dart';

class SchoolClass {
  final int id;
  final String name;
  List<Student> students;
  List<Subject> subjects;
  List<Teacher> teachers;

  SchoolClass({
    required this.id,
    required this.name,
    required this.students,
    required this.subjects,
    required this.teachers,
  });
}
