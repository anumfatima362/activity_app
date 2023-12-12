import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddUserProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController textController = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final storage = firebase_storage.FirebaseStorage.instance;
  DateTime dateTime = DateTime.now();
  String formattedDate = DateFormat('d/M/y').format(DateTime.now());

  //Add USER
  addUser(BuildContext context, image) async {
    //upload image to firebase storage
    firebase_storage.Reference reference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child("images")
        .child("${DateTime.now().millisecondsSinceEpoch}.jpg");
    //upload the file to firebase storage
    firebase_storage.UploadTask uploadTask = reference.putFile(image);
    await Future.value(uploadTask);

    //Get the download URL of the uploaded image
    String Url = await reference.getDownloadURL();

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('users');

    collectionReference.add({
      "name": nameController.text.trim(),
      "imageUrl": Url,
    });
  }

  //============================================ UPLOAD PDFs =========================================================

  //Upload PDF FILE
  Future<String> uploadPdfFile(String fileName, File file) async {
    //Create a FireBase Storage refrence
    final reference = storage.ref().child("pdfs/$fileName.pdf");
    //Create Upload task
    final uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(() => {});
    final downloadLink = await reference.getDownloadURL();
    return downloadLink;
  }

  //Pick PDF file
  pickFile() async {
    //file picker to pick file
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (pickedFile != null) {
      String fileName = pickedFile.files[0].name;

      File file = File(pickedFile.files[0].path!);

      final downloadLink = await uploadPdfFile(fileName, file);

      await FirebaseFirestore.instance.collection('pdfs').add({
        "name": fileName,
        "url": downloadLink,
        "text": textController.text.trim(),
      });
    }
  }
  

  //UPLOD AND PICK ANY FILE IN FIREBASE
  Future<void> uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);

      firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('files/${result.files.single.name}');

      await storageReference.putFile(file);

      String downloadURL = await storageReference.getDownloadURL();
      print('File uploaded to Firebase Storage: $downloadURL');
    } else {
      // User canceled the file picker
    }
  }
}
