import 'package:app/ChangePin.dart';
import 'package:app/PanicMode.dart';
import 'package:app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'components/Container.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

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
              child: Column(
            children: [
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

              SizedBox(height: getProportionateScreenHeight(174),),
              MyMoreContainer(
                    text: "Change Pin",
                    onTap: () {
                      Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ChangePinPage()),);
                    },
                    icon: Icon(Icons.lock,
                        size: 20, color: Theme.of(context).primaryColor)),
                SizedBox(
                  height: getProportionateScreenHeight(46),
                ),
                MyMoreContainer(
                    text: "Panic Mode",
                    onTap: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  PanicModePin()),);
                    },
                    icon: Icon(Icons.lock,
                        size: 20, color: Theme.of(context).primaryColor)),

            ],
          )),
        ),
      ),
    );
  }
}
