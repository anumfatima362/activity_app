import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowUser extends StatelessWidget {
  const ShowUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Show Text with Images',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshots.hasError) {
              return Center(child: Text('${snapshots.hasError}'));
            } else if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
              return const Center(
                  child: Text(
                      'No data available')); // Displayed when there's no data in the collection
            } else {
              return ListView.builder(
                  itemCount: snapshots.data!.docs.length,
                  itemBuilder: (context, index) {
                    var userData = snapshots.data!.docs[index];
                    var username = userData['name'];
                    var image = userData['imageUrl'];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 1,
                        child: SizedBox(
                          height: 100,
                          width: 200,
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                  radius: 40,
                                  backgroundImage: NetworkImage(image)),
                              title: Text(username),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
