import 'package:activity_app/UTILS/widgets/custom%20Container.dart';
import 'package:activity_app/helper/route_helper.dart';
import 'package:flutter/material.dart';

class UploadActivities extends StatelessWidget {
  const UploadActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Upload Activities',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteHelper.uploadtext);
          },
          child: Center(
            child: CustomContainer(
              text: 'Upload Text',
              color: Colors.purple,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteHelper.uploadUserInfo);
          },
          child: Center(
            child: CustomContainer(
              text: 'Text with Images',
              color: Colors.pink,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteHelper.uploadFiles);
          },
          child: Center(
            child: CustomContainer(
              text: 'Text with PDFs Files',
              color: Colors.deepOrange,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteHelper.pickfile);
          },
          child: Center(
            child: CustomContainer(
              text: 'Images or PDFs',
              color: Colors.blueGrey,
            ),
          ),
        ),
      ]),
    );
  }
}
