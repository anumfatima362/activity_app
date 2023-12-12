import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseProvider extends ChangeNotifier {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

//upload data
  Future<void> addDataToFirestore(Map<String, dynamic> data) async {
    try {
      //we adding the data into a collections as a document(document will hold our datas)
      //we set our collection name if its already exit it will add the data to that existing
      //collection if not it will not create a new collection.
      await firestore.collection('addData').add(data);
      notifyListeners();
    } catch (e) {
      print('Error adding document to Firestore: $e');
    }
  }

  //Fetch Data
  Future<List<Map<String, dynamic>>> fetchDatafromFirestore() async {
    try {
      //Collection Reference
      CollectionReference collectionReference = firestore.collection('addData');
      //CollectionRefrence sa query snapshot hasil hote ha
      QuerySnapshot querySnapshot = await collectionReference.get();
      //QuerySnapshot sa data ko map ma convert karte ha
      List<Map<String, dynamic>> dataList = querySnapshot.docs
          .map((DocumentSnapshot document) =>
              document.data() as Map<String, dynamic>)
          .toList();
      return dataList;
    } catch (e) {
      print(e);
      return [];
    }
  }

  //upload text with image
}
