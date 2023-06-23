import 'package:app/Model/RequestModel/ChangePasswordRequestModel.dart';
import 'package:app/Service/Authentication/Authentication.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChnagePasswordPage extends StatefulWidget {
  ChnagePasswordPage({super.key});

  @override
  State<ChnagePasswordPage> createState() => _ChnagePasswordPageState();
}

class _ChnagePasswordPageState extends State<ChnagePasswordPage> {
  bool isVisible = false;
  bool isVisible1 = false;
  bool isVisible2 = false;
  bool isLoading = false;
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(29), right: getProportionateScreenWidth(29),top: getProportionateScreenHeight(76)),
          child: Center(
            child: Column(children: [
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
                      "Change Password",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D0051)),
                    ),
                  ),
                ],
              ),
              SizedBox(height:getProportionateScreenHeight(90)),
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
                    labelText: "Old Password",
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
                SizedBox(height:getProportionateScreenHeight(40)),
                TextFormField(
                  controller: password,
                  obscureText: !isVisible1,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      color: Color(0xff979797),
                      icon: !isVisible1
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isVisible1 = !isVisible1;
                        });
                      },
                    ),
                    labelText: "new Password",
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
                SizedBox(height:getProportionateScreenHeight(40)),
                TextFormField(
                  controller: cPassword,
                  obscureText: !isVisible2,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      color: Color(0xff979797),
                      icon: !isVisible2
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isVisible2 = !isVisible2;
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
                SizedBox(height:getProportionateScreenHeight(95)),
                isLoading ? MyLoadingButton() :
                MyButton(text: "Submit", onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  var isReset = await ResetPassword(ChangePasswordRequestModel(password: password.text));

                  if (isReset) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password Changed Successfully")));
                    Navigator.pop(context);
                  }
                  password.clear();
                  cPassword.clear();
                  setState(() {
                    isLoading =false;
                  });
                }, enabled: true)
            ]),
          )),
    ));
  }
}
