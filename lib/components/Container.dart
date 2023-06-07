import 'package:flutter/material.dart';

class MyMoreContainer extends StatelessWidget {
  MyMoreContainer({super.key, required this.text, required this.onTap, required this.icon});
  String text;
  Icon icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left:25, right: 10),
        //margin: EdgeInsets.symmetric(horizontal:  2),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xffA9A5AF), width: 2)),
        ),
        child: Row(
          children: [
            icon,
            Spacer(),
            Text(
              text,
              style: TextStyle(
                  color: Color(0xffA9A5AF),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              onPressed: onTap,
              color: Color(0xffA9A5AF),
            ),
          ],
        ),
      ),
    );
  }
}
