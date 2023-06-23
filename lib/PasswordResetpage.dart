import 'package:app/CompletePage.dart';
import 'package:app/Utility/Utility.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:flutter/material.dart';

import 'Model/RequestModel/ChangePasswordRequestModel.dart';
import 'Service/Authentication/Authentication.dart';

class passwordResetPage extends StatefulWidget {
  const passwordResetPage({super.key});

  @override
  State<passwordResetPage> createState() => _passwordResetPage();
}

class _passwordResetPage extends State<passwordResetPage> {
  bool isVisible = false;
  bool isLoading = false;
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.only(left: 25, right: 31),
          child: Form(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: getProportionateScreenHeight(80),
              ),
              Row(
                children: [
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
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "Reset your password",
                  style: TextStyle(color: Color(0xff979797), fontSize: 18),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(101),
              ),
              TextFormField(
                controller: password,
                obscureText: !isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    color: Color(0xff979797),
                    icon: !isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  labelText: "Password",
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
                    return "Please enter your password";
                  }
                  if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return "Password must contain at least 8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(44),
              ),
              TextFormField(
                obscureText: !isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    color: Color(0xff979797),
                    icon: !isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  labelText: "Confirm Password",
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
                    return "Please enter your password";
                  }
                  if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return "Password must contain at least 8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(158),
              ),
              isLoading ? MyLoadingButton() :
              MyButton(
                text: "Submit",
                onTap: () async {
                  if (await hasInternetConnection()) {
                    setState(() {
                      isLoading = true;
                    });
                    var isReset = await ResetPassword(
                        ChangePasswordRequestModel(password: password.text));

                    if (isReset) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Password Changed Successfully")));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              //TODO: change the message here
                              builder: (context) => CompletePage(
                                    title: "Password Reset Successful",
                                    Message: "message",
                                  )));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("No Internet Connection")));
                  }
                  setState(() {
                    isLoading= false;
                  });
                },
                enabled: true,
              )
            ]),
          )),
    ));
  }
}
