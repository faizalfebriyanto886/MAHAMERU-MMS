import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class Flas extends StatelessWidget {
  final FlashController<Object?> controller;
  final String title;
  final String messge;
  final IconData icon;
  final Color color;

  const Flas({Key? key, required this.controller, required this.title, required this.messge, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flash(
        controller: controller,
        behavior: FlashBehavior.floating,
        position: FlashPosition.bottom,
        borderRadius: BorderRadius.circular(8.0),
        backgroundColor: color.withOpacity(0.8),
        forwardAnimationCurve: Curves.easeInCirc,
        reverseAnimationCurve: Curves.elasticOut,
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: FlashBar(
          title: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(title,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFCF7F7),
              ),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(messge,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFCF7F7),
              ),
            ),
          ),
          indicatorColor:Colors.grey.withOpacity(0.8),
          icon: Icon(
            icon,
            color: Colors.grey[800],
            size: 46,
          ),
          ),
        ),
        ),
    );
  }
}