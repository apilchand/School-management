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

class Notice {
  final String title;
  final String message;
  final String postedOn;

  Notice({required this.title, required this.message, required this.postedOn});
}

Future<List<Notice>> getLatestNotices() async {
  QuerySnapshot querySnapshot = await db
      .collection('Notice')
      .orderBy('postedOn', descending: true)
      .limit(10)
      .get();

  List<Notice> notices = [];

  for (QueryDocumentSnapshot document in querySnapshot.docs) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    notices.add(
      Notice(
        title: data['title'],
        message: data['message'],
        postedOn: data['postedOn'],
      ),
    );
  }

  return notices;
}


class TeacherNoticeScreen extends StatelessWidget {
  const TeacherNoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: const Text('Notices'),
        centerTitle: true,
       
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Latest Notices',
              style: TextStyle(
                
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNoticeScreen(),
                    ),
                  );
                }
                ;
              },
              style: ElevatedButton.styleFrom(
               
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Post Notice'),
            ),
            const SizedBox(height: 24),
            FutureBuilder<List<Notice>>(
                future: getLatestNotices(),
                builder:
                    (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  }

                  List<Notice> notice = snapshot.data!;

                  return Expanded(
                    child: ListView.builder(
                      itemCount: notice.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all()
                              
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notice[index].title,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  notice[index].message,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Posted on: ${notice[index].postedOn}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[600],
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
                  );
                })
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
 

  void _submitNotice() {
    final noticeData = {
      'title': _titleController.text,
      'message': _noticeController.text,
      'postedOn': DateTime.now().toString(),
    };
    addNotice(noticeData).then((_) {
      _titleController.clear();
      _noticeController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Add Notices'),
         // backgroundColor: const Color.fromARGB(255, 121, 6, 6)
         ),
     // backgroundColor: const Color.fromARGB(255, 4, 28, 63),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Enter the title of your NOtice',
                filled: true,
                //fillColor: Colors.white,
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
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _noticeController,
              decoration: InputDecoration(
                hintText: 'Enter your notice here',
                filled: true,
                //fillColor: Colors.white,
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
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _submitNotice();
            },
            style: ElevatedButton.styleFrom(
              //backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text('Post Notice'),
          )
        ],
      ),
    );
  }
}
