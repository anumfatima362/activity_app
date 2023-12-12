import 'package:activity_app/UTILS/widgets/custom%20Container.dart';
import 'package:activity_app/helper/route_helper.dart';
import 'package:flutter/material.dart';

class ShowActivities extends StatelessWidget {
  const ShowActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Show Activities',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteHelper.showText);
          },
          child: Center(
            child: CustomContainer(
              text: 'Show Text',
              color: Colors.purple,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteHelper.showUserInfo);
          },
          child: CustomContainer(
            text: 'Text with Images',
            color: Colors.pink,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteHelper.showPdfs);
          },
          child: CustomContainer(
            text: 'Text with PDFs Files',
            color: Colors.deepOrange,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomContainer(
          text: 'Images or PDFs',
          color: Colors.blueGrey,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomContainer(
          text: 'Images',
          color: Colors.blue,
        ),
        const SizedBox(
          height: 15,
        ),
        CustomContainer(
          text: 'PDFs File',
          color: Colors.amberAccent,
        ),
      ]),
    );
  }
}
