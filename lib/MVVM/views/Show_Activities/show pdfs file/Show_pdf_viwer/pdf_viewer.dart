import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';

class ShowPdfViwerScreen extends StatefulWidget {
  final pdfUrl;
  const ShowPdfViwerScreen({super.key, this.pdfUrl});

  @override
  State<ShowPdfViwerScreen> createState() => _ShowPdfViwerScreenState();
}

class _ShowPdfViwerScreenState extends State<ShowPdfViwerScreen> {
  PDFDocument? document;

  //initialize the Pdf
  initializePdf() async {
    //we fetch our document with pdf
    document:
    await PDFDocument.fromURL(widget.pdfUrl);
    //Now we require pdf url
    //and get this url through constructor
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initializePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: initializePdf(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading PDF'));
          } else if (document != null) {
            return PDFViewer(document: document!);
          } else {
            return const Center(child: Text('PDF is null'));
          }
        },
      ),
    );
  }
}
