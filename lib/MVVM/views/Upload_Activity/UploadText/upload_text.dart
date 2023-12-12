import 'package:activity_app/MVVM/viewmodels/upload_text_provider.dart';
import 'package:activity_app/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploaText extends StatefulWidget {
  const UploaText({super.key});

  @override
  State<UploaText> createState() => _UploaTextState();
}

class _UploaTextState extends State<UploaText> {
  //text editing controller is used to get data from textformfield
  TextEditingController sampleData1Controller = TextEditingController();
  TextEditingController sampleData2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseProvider firebaseProvider = Provider.of<FirebaseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Upload data to firebase ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(children: [
          TextFormField(
            controller: sampleData1Controller,
            decoration: const InputDecoration(hintText: "sample data 1"),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: sampleData2Controller,
            decoration: const InputDecoration(hintText: "sample data 2"),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> data = {
                  "field1": sampleData1Controller.text,
                  "field 2": sampleData2Controller.text,
                };
                await firebaseProvider.addDataToFirestore(data);
              },
              child: const Text('Submit')),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteHelper.showText);
              },
              child: const Text('Show Text'))
        ]),
      ),
    );
  }
}
