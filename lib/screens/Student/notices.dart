import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;


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


class NoticeScreen extends StatelessWidget {
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
                                      style: const TextStyle(
                                        fontSize: 16,
                                         color:Colors.grey,
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

