import 'package:activity_app/MVVM/viewmodels/add_User_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddUserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('File Upload Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.uploadFile(),
          child: const Text('Pick and Upload File'),
        ),
      ),
    );
  }
}
