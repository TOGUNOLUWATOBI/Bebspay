import 'package:app/size_config.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ScannerPage.dart';
import 'components/my_button.dart';

class BVNPage extends StatefulWidget {
  String textMessgae;
  List<CameraDescription> cameras ;
  BVNPage({super.key, required this.textMessgae, required this.cameras});

  @override
  State<BVNPage> createState() => _BVNPageState();
}

class _BVNPageState extends State<BVNPage> {
  TextEditingController idNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(23),
                    right: getProportionateScreenWidth(29)),
                child: Center(
                    child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                      ),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Identity Verification",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontFamily: "Inter",
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(60),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "We need your bvn to help create a life bank account.",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(130),
                      ),
                      TextFormField(
                        controller: idNumberController,
                        decoration: InputDecoration(
                          labelText: widget.textMessgae,
                          labelStyle: TextStyle(color: Color(0xff979797)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff979797)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff979797)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11)
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(120),
                      ),
                      MyButton(
                          text: "Continue",
                          onTap: (() {
                           Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ScannerPage(cameras: widget.cameras , header: "Liveness Check", IdNumber: idNumberController.text, type: "BVN",)),
                  );
                          }),
                          enabled: true)
                    ])))));
  }
}
