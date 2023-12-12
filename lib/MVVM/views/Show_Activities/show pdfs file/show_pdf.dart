import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class ShowPDFs extends StatefulWidget {
  const ShowPDFs({super.key});

  @override
  State<ShowPDFs> createState() => _ShowPDFsState();
}

class _ShowPDFsState extends State<ShowPDFs> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Fetch Pdfs
  Future<List<Map<String, dynamic>>> getAllPdf() async {
    try {
      CollectionReference collectionReference = firestore.collection('pdfs');
      QuerySnapshot querySnapshot = await collectionReference.get();
      List<Map<String, dynamic>> pdfData = querySnapshot.docs
          .map((DocumentSnapshot document) =>
              document.data() as Map<String, dynamic>)
          .toList();
      return pdfData;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Pdfs'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
          future: getAllPdf(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                  child: Text('Error Fetching or No data available'));
            } else {
              List<Map<String, dynamic>> dataList = snapshot.data!;
              if (dataList.isEmpty) {
                return const Center(child: Text('No data Available'));
              }
              return GridView.builder(
                  itemCount: dataList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    Map<String, dynamic> data = dataList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          PDFDocument document =
                              await PDFDocument.fromURL(data['url']);
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PDFViewer(document: document),
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/pdf_image.png',
                                  height: 120,
                                  width: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: AspectRatio(
                                    aspectRatio: 6,
                                    child: Text(
                                      data['name'],
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
