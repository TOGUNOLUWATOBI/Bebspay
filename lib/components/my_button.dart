import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  MyButton({super.key, required this.text, required this.onTap, required this.enabled});
  String text;
  bool enabled;
  
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : (){},
      child: Container(
        
        padding: EdgeInsets.all(25),
        //margin: EdgeInsets.symmetric(horizontal:  2),
        decoration: BoxDecoration(
          color: enabled? Color(0xff2D0051):Color(0xff979797),
          borderRadius: BorderRadius.circular(30)
        ),
        child:  Center(
          child: Text(text,
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)
        ),
      ),
    );
  }
}