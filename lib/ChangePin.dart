import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ChangePinPage extends StatefulWidget {
  const ChangePinPage({super.key});

  @override
  State<ChangePinPage> createState() => _ChangePinPageState();
}

class _ChangePinPageState extends State<ChangePinPage> {
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
                  
                  BottomSheet(
                    onClosing: () {},
                    builder: (context) {

                      _showModalBottomSheet(context);
                      return Container();
                    },
                  );
                },
                enabled: true)
          ]))),
    ));
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(22)),
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(getProportionateScreenWidth(30))),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                PinCodeTextField(
                      appContext: context,
                      length: 4,
                      inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      ],
                      pastedTextStyle: TextStyle(
                        color: Color(0xFF2D0051),
                        fontWeight: FontWeight.bold,
                      ),
                      obscureText: false,
                      animationType: AnimationType.fade,
                      cursorColor: Color(0xFF2D0051),
                      animationDuration: const Duration(milliseconds: 300),
                      
                      pinTheme: PinTheme(
                        activeColor: Colors.black,
                        inactiveColor: Colors.black),
                      keyboardType: TextInputType.number,
                      
                      
                      onChanged: (value) {
                        debugPrint(value);
                        setState(() {
                          value;
                        });
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
              ]));
        });
  }
}
