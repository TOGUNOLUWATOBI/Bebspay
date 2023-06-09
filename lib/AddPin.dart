import 'package:app/Model/RequestModel/AddPanicPinModel.dart';
import 'package:app/Model/RequestModel/AddTransactionPinModel.dart';
import 'package:app/PinCofirmationPage.dart';
import 'package:app/Service/Authentication/Account.dart';
import 'package:app/Utility/Utility.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'Login.dart';
import 'Model/Account/DashboardDetails.dart';
import 'components/BottomNavigationBar.dart';

class AddPinPage extends StatefulWidget {
  const AddPinPage({super.key, required this.pinType, required this.details});
  final String pinType;
  final DashboardDetails? details;
  @override
  State<AddPinPage> createState() => _AddPinPageState();
}

class _AddPinPageState extends State<AddPinPage> {
  bool isLoading = false;
  String pin1 = "";
  String pin0 = "";
  String pin2 = "";
  bool enabled = false;
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
                "Add Your ${widget.pinType} Pin to protect your transactions ",
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
                text: "Add ${widget.pinType} Pin",
                onTap: () {
                  //TODO: talk to chizaram to implement this part of the screen
                  _showModalBottomSheet1(context);
                },
                enabled: true)
          ]))),
    ));
  }

  void _showModalBottomSheet1(BuildContext context) {
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
                'Enter your  ${widget.pinType} PIN below to continue',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getProportionateScreenHeight(40)),

              /// ${widget.pinType} PIN Box
              Center(
                child: Pinput(
                  onCompleted: (value) {
                    setState(() {
                      _showModalBottomSheet2(context);
                      pin1 = value;
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
                'Confirm your ${widget.pinType} PIN below to continue',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getProportionateScreenHeight(40)),

              /// ${widget.pinType} PIN Box
              Center(
                child: Pinput(
                  onCompleted: (value) {
                    setState(() {
                      pin2 = value;
                      if (pin1 == pin2) {
                        enabled = true;
                      }
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
              isLoading
                  ? MyLoadingButton()
                  : MyButton(
                      text: 'Continue',
                      onTap: () async {
                        if (await hasInternetConnection()) {
                          setState(() {
                            isLoading = true;
                          });
                          if (widget.pinType == "Transaction") {
                            var isChanged = await AddTransactionPin(
                                new AddTransactionPinModel(trxPin: pin2));

                            if (isChanged!) {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddPinPage(
                                            pinType: "Panic",
                                            details: widget.details,
                                          )));
                            }
                          } else {
                            bool change =false;
                             var isChanged = await AddPanicPin(
                                new AddPanicPinModel(panicPin: pin2));
                            setState(() {
                               
                              change = isChanged!;
                              });
                            if (change) {
                              if (widget.details != null) {
                                Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                                  //TODO: change the message here
                                  builder: (context) {
                            return MyHomePage(
                              title: "Bebspay",
                            );
                          }), (r) {
                            return false;
                          });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return ButtomNavBar(
                                          details: widget.details);
                                    },
                                  ),
                                );
                              } else {
                                Navigator.pop(context);
                              }
                            }
                          }
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      enabled: enabled,
                    ),
              SizedBox(height: getProportionateScreenHeight(20))
            ]),
          );
        });
  }
}
