import 'package:activity_app/MVVM/viewmodels/add_User_Provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadFiles extends StatefulWidget {
  const UploadFiles({super.key});

  @override
  _UploadFilesState createState() => _UploadFilesState();
}

class _UploadFilesState extends State<UploadFiles> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = firebase_storage.FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    final pdfProvider = Provider.of<AddUserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Upload PDF and Text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30.0),
            TextField(
              controller: pdfProvider.textController,
              decoration: const InputDecoration(
                labelText: 'Enter Text',
              ),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              onPressed: () => pdfProvider.pickFile(),
              child: const Text('Upload PDF and Text'),
            ),
          ],
        ),
      ),
    );
  }
}
