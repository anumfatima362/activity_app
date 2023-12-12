import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  String? text;
  Color? color;
  CustomContainer({super.key, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width / 1.3,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          color: color),
      child: Center(
        child: Text(
          text!,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
