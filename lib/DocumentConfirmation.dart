import 'dart:io';

import 'package:app/Service/Authentication/Authentication.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'Utility/Utility.dart';

class DocumentConfirmation extends StatefulWidget {
  const DocumentConfirmation(
      {super.key, required this.imgPath, required this.Id, required this.type});
  final String imgPath;
  final String Id;
  final String type;

  @override
  State<DocumentConfirmation> createState() => _DocumentConfirmationState();
}

class _DocumentConfirmationState extends State<DocumentConfirmation> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(60),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(70),
                  right: getProportionateScreenWidth(70),
                  top: getProportionateScreenHeight(30),
                  bottom: getProportionateScreenHeight(30)),
              child: DottedBorder(
                borderType: BorderType.Oval,
                radius: Radius.circular(20),
                strokeWidth: 3,
                padding: EdgeInsets.zero,
                color: Colors.white,
                dashPattern: [100, 6],
                child: Center(
                  child: SizedBox(
                    height: getProportionateScreenHeight(350),
                    width: getProportionateScreenHeight(300),
                    child: ClipOval(
                      child: Image.file(
                        File(widget.imgPath),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(41),
            ),
            TextFormField(
              readOnly: true,
              
              controller: TextEditingController(text: widget.Id),
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontFamily: "Inter",
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: "${widget.type} number:",
                labelStyle: TextStyle(color: Color(0xff979797)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffffff)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffffff)),
                ),
              ),
            ),
            
            SizedBox(
              height: getProportionateScreenHeight(60),
            ),
            isLoading ? MyLoadingButton() :
            MyButton(text: "submit", onTap: () async{
              if (await hasInternetConnection()) {
                      //push to home page OR LOGIN PAGE after creating the account
                      setState(() {
                        isLoading = true;
                      });
                      
                      var email = await getEmail();
                      var isSent = await PerformKYC(email!, widget.type, widget.Id, File(widget.imgPath));

                      if (isSent == false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("An error occured")));
                      }

                      if (isSent) {
                         {
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
                          
                        }
                      }
                    }
                    setState(() {
                      isLoading = false;
                    });
            }, enabled: true)
          ],
        ),
      ),
    );
  }
}
