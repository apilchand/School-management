import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

 FirebaseFirestore db = FirebaseFirestore.instance;
final CollectionReference noticeCollection = db.collection('Notice');

Future<void> addNotice(Map<String, dynamic> formData) {

  return noticeCollection
      .add(formData)
      .then((value) => print("Notice added"))
      .catchError((error) => print("Failed to add Notice: $error"));
}

class TeacherNoticeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      appBar: AppBar(
        title: Text('Notices'),
        centerTitle: true,
       backgroundColor: Color.fromARGB(255, 121, 6, 6),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Latest Notices',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
            onPressed: () {
              {
                       Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddNoticeScreen() ,
                                ),
                              );
                    };
              
            },
            child: Text('Post Notice'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
           SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notice Title',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 4, 28, 63),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam erat volutpat. Sed vel luctus neque. Nam scelerisque, tellus vel consectetur consequat, felis velit convallis nunc, vel pulvinar dolor felis eget augue.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Posted on: 01/05/2023',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 4, 28, 63),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class AddNoticeScreen extends StatefulWidget {
  const AddNoticeScreen({Key? key}) : super(key: key);
  

  @override
  _AddNoticeScreenState createState() => _AddNoticeScreenState();
}

class _AddNoticeScreenState extends State<AddNoticeScreen> {
  final _noticeController = TextEditingController();
  final _titleController = TextEditingController();
  List<String> _notices = [];
  
  void _submitNotice() {
  final noticeData ={
    'title' : _titleController.text,
    'message': _noticeController.text,
    'date' : DateTime.now().toString(),
  };
  addNotice(noticeData).then((_)  {
    _titleController.clear();
    _noticeController.clear();
  });
  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notices'),
        backgroundColor: Color.fromARGB(255, 121, 6, 6)),
      backgroundColor: Color.fromARGB(255, 4, 28, 63),
      body: Column(
        children: [
           SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter the title of your NOtice',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 1,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a Title';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _noticeController,
              decoration: InputDecoration(
                hintText: 'Enter your notice here',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 5,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a notice';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _submitNotice();
              
            },
            child: Text('Post Notice'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
         
        ],
      ),
    );
  }
}


