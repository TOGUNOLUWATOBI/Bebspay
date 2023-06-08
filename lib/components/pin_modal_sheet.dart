import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../size_config.dart';
import 'my_button.dart';

void _showModalBottomSheet(BuildContext context, Function onCompleted){
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) {
          return 
            Container(
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
                     onCompleted;
                      // setState(() {
                      //   //_otpController.text = value;
                      //   //print(_otpController.text);
                      // });
                    },
                    length: 4,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    // defaultPinTheme: kDefaultPin(context),
                    // focusedPinTheme: kFocusedPin(context),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(1000)),
                MyButton(
                    text: 'Continue',
                    onTap: () {
                      Navigator.pop(context);
                    },
                    enabled: true,),
                SizedBox(height: getProportionateScreenHeight(20))
              ]),
            
          );
        });
  }