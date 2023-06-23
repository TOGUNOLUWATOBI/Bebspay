import 'package:app/OtpValidationPage.dart';
import 'package:app/components/my_button.dart';
import 'package:flutter/material.dart';

import 'Service/Authentication/Authentication.dart';
import 'Utility/Utility.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isLoading = false;
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.only(left: 25, right: 31),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Row(
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
                      "Forgot Password",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D0051)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text("Enter your email to reset your password",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff979797))),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Color(0xff979797)),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email";
                    }
                    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "Please enter a valid email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 70,
              ),
              MyButton(
                text: "Submit",
                onTap: (() async {
                  if (await hasInternetConnection()) {
                    //push to home page OR LOGIN PAGE after creating the account
                    setState(() {
                      isLoading = true;
                    });

                    var isSent = await ForgotPassword(email.text);

                    if(isSent == false)
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Email does not exist")));
                    }

                    if (isSent) {
                      email.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpValidation(
                                  isPasswordReset: true,
                                  text:
                                      "Check your email for the confirmation code required to reset password",
                                )),
                      );
                    }
                    setState(() {
                      isLoading = false;
                    });
                  }
                }),
                enabled: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
