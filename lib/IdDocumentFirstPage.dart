
import 'package:app/ScannerPage.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IdDocumentFirstPage extends StatelessWidget {
  String textMessgae;
  List<CameraDescription> cameras ;
  IdDocumentFirstPage({super.key, required this.textMessgae, required this.cameras});
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
                          "We need your preferred document to verify your identity. This document should match the sign-up form's information. Selecting a document helps us verify your e-wallet account.",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(76),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: textMessgae,
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
                      SizedBox(height: getProportionateScreenHeight(120),),
                      MyButton(text: "Continue", onTap: (() {
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ScannerPage(cameras: cameras , header: "Liveness Check")),
                  );
                      }), enabled: true)
                    ])))));
  }
}
