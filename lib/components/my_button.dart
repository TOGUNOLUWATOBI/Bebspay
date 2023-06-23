import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../size_config.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.enabled});
  String text;
  bool enabled;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : () {},
      child: Container(
        width: getProportionateScreenWidth(330),
        height: getProportionateScreenHeight(58) + 25,
        padding: EdgeInsets.all(25),
        //margin: EdgeInsets.symmetric(horizontal:  2),
        decoration: BoxDecoration(
            color: enabled ? Color(0xff2D0051) : Color(0xff979797),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
        )),
      ),
    );
  }
}

class MyLoadingButton extends StatelessWidget {
  MyLoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(330),
      height: getProportionateScreenHeight(58) + 25,
      padding: EdgeInsets.all(25),
      //margin: EdgeInsets.symmetric(horizontal:  2),
      decoration: BoxDecoration(
          color: Color(0xff2D0051), borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: SpinKitCubeGrid(
        color: Colors.white,
        size: 19.0,
      )),
    );
  }
}
