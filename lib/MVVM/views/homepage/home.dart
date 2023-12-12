import 'package:activity_app/helper/route_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
            child: Text(
          'Activity Plan',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 45),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteHelper.uploadActivities);
                },
                child: Container(
                  height: 60,
                  width: 150,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Center(
                      child: Text(
                    'UPLOAD',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteHelper.showActivities);
                },
                child: Container(
                  height: 60,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: const Center(
                      child: Text(
                    'SHOW',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
