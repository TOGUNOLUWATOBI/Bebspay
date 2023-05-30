import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PanicModePin extends StatefulWidget {
  const PanicModePin({super.key});

  @override
  State<PanicModePin> createState() => _PanicModePinState();
}

class _PanicModePinState extends State<PanicModePin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(
              top: getProportionateScreenHeight(80),
              bottom: getProportionateScreenHeight(30),
              left: getProportionateScreenWidth(30),
              right: getProportionateScreenWidth(30)),
          child: Center(
              child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Color(0xff979797),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(50),
                ),
                Text(
                  "Security",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Inter",
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(144),
            ),

            //TODO: ask chizaram for help to align this text to the center
            Align(
              child: Text(
                "Change Your Transaction Pin to protect your transactions ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                    color: Theme.of(context).primaryColor),
                overflow: TextOverflow.visible,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(200),
            ),
            MyButton(
                text: "Change Transaction Pin",
                onTap: () {
                  //TODO: talk to chizaram to implement this part of the screen
                  
                },
                enabled: true)
          ]))),
    ));
  }

}
