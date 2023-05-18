import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final List<String> _roles = ['student', 'parent', 'teacher', 'admin'];
  String _selectedRole = 'student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(child:
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedRole,
              decoration: const InputDecoration(
                labelText: 'Role',
                border: OutlineInputBorder(),
              ),
              items: _roles.map((role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
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
    ));
  }

  void _login() async {
    final String enteredusername = _usernameController.text.trim();
    final String enteredpassword = _passwordController.text.trim();

    UserCredential userCredential;
    DocumentSnapshot userSnapshot;

    try {
      userCredential = await _auth.signInWithEmailAndPassword(
        email: enteredusername,
        password: enteredpassword,
      );

      final User? user = userCredential.user;
      if (user != null) {
        final String userId = user.uid;
        final DocumentReference userRef = _firestore.collection('User').doc(userId);
        userSnapshot = await userRef.get();

        if (userSnapshot.exists) {
          final String role = userSnapshot['role'];
          final String username = userSnapshot['username'];
          final String password = userSnapshot['password'];

          if (username == enteredusername && password == enteredpassword) {
            switch (role) {
              case 'student':
                _navigateToStudentDashboard(userId);
                break;
              case 'parent':
                _navigateToParentDashboard();
                break;
              case 'teacher':
                _navigateToTeacherDashboard(userId);
                break;
              case 'admin':
                _navigateToAdminDashboard();
                break;
              default:
                _showAlertDialog('Invalid role');
            }
          } else {
            _showAlertDialog('Invalid username or password');
          }
        } else {
          _showAlertDialog('User not found');
        }
      }
    } catch (e) {
      _showAlertDialog(e.toString());
    }
  }

  void _navigateToStudentDashboard(String userId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDashboard(
           studentId: userId,
        ),
      ),
    );
  }

  void _navigateToParentDashboard() {
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
        builder: (context) => TeacherDashboardScreen(
          teacherId: userId,
        ),
      ),
    );
  }

  void _navigateToAdminDashboard() {
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
