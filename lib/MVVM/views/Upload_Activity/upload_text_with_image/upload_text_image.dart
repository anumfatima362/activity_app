import 'dart:io';

import 'package:activity_app/MVVM/viewmodels/add_User_Provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadUsers extends StatefulWidget {
  const UploadUsers({super.key});

  @override
  State<UploadUsers> createState() => _UploadUsersState();
}

class _UploadUsersState extends State<UploadUsers> {
  //Define Global key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  File? image;

  Future<void> getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  Future<void> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AddUserProvider addUserProviderController =
        Provider.of<AddUserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Text with Images',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 150.0, // Set the desired size for the circular avatar
                  height: 150.0,
                  decoration: const BoxDecoration(
                      //  color: Colors.blue,
                      ),
                  child: Stack(
                    children: [
                      image != null
                          ? CircleAvatar(
                              radius: 70,
                              backgroundImage: FileImage(image!),
                            )
                          : const CircleAvatar(
                              radius: 70,
                              child: Icon(
                                Icons.person,
                                size: 50,
                              ),
                            ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              openBottomSheet();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextFormField(
                  controller: addUserProviderController.nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: 'Enter Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'User Name Required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    addUserProviderController.addUser(context, image);
                  },
                  child: const Text('Add User'))
            ],
          ),
        ),
      ),
    );
  }

  //Step 1   create Bottom sheet
  void openBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Column(children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  getImageFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  getImageFromGallery();
                },
              ),
            ]),
          );
        });
  }
}
