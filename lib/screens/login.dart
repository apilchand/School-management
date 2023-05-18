import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pathsala/screens/Admin/Dashboard.dart';
import 'package:pathsala/screens/Parent/Pdashboard.dart';
import 'package:pathsala/screens/Student/Sdashboard.dart';
import 'package:pathsala/screens/Teacher/Tdashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        color: Colors.blueGrey, // Set the background color
        child: Center(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double containerWidth = constraints.maxWidth > 1007
                  ? 500.0
                  : constraints.maxWidth * 0.8;

              return Container(
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5.0,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

 

  void _login() async {
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    try {
      final QuerySnapshot snapshot = await _firestore
          .collection('User')
          .where('username', isEqualTo: enteredUsername)
          .where('password', isEqualTo: enteredPassword)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final DocumentSnapshot userSnapshot = snapshot.docs.first;
        final String role = userSnapshot['role'];
        final String userId = userSnapshot.id;

        switch (role) {
          case 'student':
            _navigateToStudentDashboard(userId);
            break;
          case 'parent':
            _navigateToParentDashboard(userId);
            break;
          case 'teacher':
            _navigateToTeacherDashboard(userId);
            break;
          case 'admin':
            _navigateToAdminDashboard(userId);
            break;
          default:
            _showAlertDialog('Invalid role');
        }
      } else {
        _showAlertDialog('Invalid username or password');
      }
    } catch (e) {
      _showAlertDialog(e.toString());
    }
  }

  void _navigateToStudentDashboard(String userId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDashboard(studentId: userId),
      ),
    );
  }

  void _navigateToParentDashboard(String userId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const ParentHomeScreen(),
      ),
    );
  }

  void _navigateToTeacherDashboard(String userId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TeacherDashboardScreen(teacherId: userId),
      ),
    );
  }

  void _navigateToAdminDashboard(String userId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const DashboardScreen(),
      ),
    );
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
