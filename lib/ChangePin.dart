import 'package:app/PinCofirmationPage.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

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
                  _showModalBottomSheet(context);
                },
                enabled: true)
          ]))),
    ));
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(20),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Center(
                child: Text(
                  'Enter PIN',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              Text(
                'Enter your Transaction PIN below to continue',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getProportionateScreenHeight(40)),

              /// Transaction PIN Box
              Center(
                child: Pinput(
                  onCompleted: (value) {
                    setState(() {
                      _showModalBottomSheet2(context);
                      //_otpController.text = value;
                      //print(_otpController.text);
                    });
                  },
                  length: 4,
                  obscureText: true,
                  textInputAction: TextInputAction.done,

                  
                  // focusedPinTheme: kFocusedPin(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(100)),
              MyButton(
                text: 'Continue',
                onTap: () {
                  Navigator.pop(context);
                  _showModalBottomSheet2(context);
                },
                enabled: true,
              ),
              SizedBox(height: getProportionateScreenHeight(20))
            ]),
          );
        });
  }


  void _showModalBottomSheet2(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(20),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Center(
                child: Text(
                  'Enter PIN',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              Text(
                'Confirm your Transaction PIN below to continue',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getProportionateScreenHeight(40)),

              /// Transaction PIN Box
              Center(
                child: Pinput(
                  onCompleted: (value) {
                    setState(() {
                      //_otpController.text = value;
                      //print(_otpController.text);
                    });
                  },
                  length: 4,
                  obscureText: true,
                  textInputAction: TextInputAction.done,

                  
                  // focusedPinTheme: kFocusedPin(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(100)),
              MyButton(
                text: 'Continue',
                onTap: () {
                  Navigator.pop(context);
                },
                enabled: true,
              ),
              SizedBox(height: getProportionateScreenHeight(20))
            ]),
          );
        });
  }
}
