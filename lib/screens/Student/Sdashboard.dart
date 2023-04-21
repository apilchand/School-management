import 'package:flutter/material.dart';

class Sdashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
        backgroundColor: Color.fromARGB(255, 121, 6, 6),

      ),
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // First container with 2 containers in a row
              Container(
                height: constraints.maxHeight * 0.3,
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: constraints.maxWidth * 0.4,
                      color: Colors.blue,
                    ),
                    Container(
                      width: constraints.maxWidth * 0.4,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              // Second container
              Container(
                height: constraints.maxHeight * 0.2,
                color: Colors.red,
                alignment: Alignment.center,
                child: Text(
                  'Container 2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              // Third container with 4 containers in 2 rows
              Container(
                height: constraints.maxHeight * 0.3,
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.1,
                          color: Colors.purple,
                        ),
                        Container(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.1,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.1,
                          color: Colors.yellow,
                        ),
                        Container(
                          width: constraints.maxWidth * 0.4,
                          height: constraints.maxHeight * 0.1,
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Fourth container
              Container(
                height: constraints.maxHeight * 0.2,
                color: Colors.grey,
                alignment: Alignment.center,
                child: Text(
                  'Container 4',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
