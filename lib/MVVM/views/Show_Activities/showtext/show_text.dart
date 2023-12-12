import 'package:activity_app/MVVM/viewmodels/upload_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowText extends StatefulWidget {
  const ShowText({super.key});

  @override
  State<ShowText> createState() => _ShowTextState();
}

class _ShowTextState extends State<ShowText> {
  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider = Provider.of<FirebaseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Show Text from Firebase',
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
          future: firebaseProvider.fetchDatafromFirestore(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError || snapshot.data == null) {
              return const Center(
                  child: Text('Error Fetching or No data available'));
            } else {
              //display fetch data
              List<Map<String, dynamic>> dataList = snapshot.data!;
              if (dataList.isEmpty) {
                return const Center(child: Text('No data Available'));
              }
              return ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = dataList[index];
                    return ListTile(
                      title: Text(
                        'Field 1: ${data['field1']}',
                      ),
                      subtitle: Text(
                        'Field 2: ${data['field 2']}',
                      ),
                    );
                  });
            }
          }),
    );
  }
}
