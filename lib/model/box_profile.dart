import 'dart:ui';
import 'package:flutter/material.dart';

class BaseBox extends StatelessWidget {
  String title;
  String name;
  Color color;

  BaseBox(this.title, this.name, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontSize: 20, color: Colors.black87),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
