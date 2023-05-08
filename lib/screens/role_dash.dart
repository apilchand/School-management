import 'package:flutter/material.dart';
import 'Student/Sdashboard.dart';
import 'Parent/Pdashboard.dart';
import 'Teacher/Tdashboard.dart';
import 'Admin/Dashboard.dart';


class RoleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Center(child: Text('PathShala')),
        backgroundColor: Color.fromARGB(255, 121, 6, 6)),
       backgroundColor: Color.fromARGB(255, 4, 28, 63),
      body: 
      Center(
        child: SingleChildScrollView(
          child:
        Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add text field at the top
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: 
              Center(
                child: Text(
                            'Choose your Role',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 50 ,
                            ),
                       
                  
                ),
              ),
            ),
            SizedBox(height: 30),
            // Add two rows of two containers
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
        onTap: () {
          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentDashboard(),
                              ),
                            );
        },
        child: Image.asset('images/student.png',width: 80,
                          height: 80,),
      ),
                       
                        SizedBox(height: 10),
                        Text(
                          'Student',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: 
                      [
                        GestureDetector(
        onTap: () {
          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ParentHomeScreen(),
                              ),
                            );
        },
        child:
                        Image.asset(
                          'images/parent.png',
                          width: 80,
                          height: 80,
                        ),
                    ),
                        SizedBox(height: 10),
                        Text(
                          'Parent',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
        onTap: () {
          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeacherDashboardScreen(),
                              ),
                            );
        },
        child:
                        Image.asset(
                          'images/teacher.png',
                          width: 80,
                          height: 80,
                        ),
                    ),
                        
                        SizedBox(height: 10),
                        Text(
                          'Teacher',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [ GestureDetector(
        onTap: () {
          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DashboardScreen(),
                              ),
                            );
        },
        child:
                        Image.asset(
                          'images/admin.png',
                          width: 80,
                          height: 80,
                        ),
                    ),
                       
                        SizedBox(height: 10),
                        Text(
                          'Admin',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
          ),
      ));
  }
}


