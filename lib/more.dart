import 'package:app/ChangePassword.dart';
import 'package:app/components/Container.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(10),
                left: getProportionateScreenWidth(25),
                right: getProportionateScreenWidth(25),
                bottom: getProportionateScreenHeight(30)),
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: getProportionateScreenHeight(60),
                ),
                CachedNetworkImage(
                  imageUrl:
                      //change this url
                      'https://drive.google.com/uc?id=1kAyjiNbeurmmKwKTpqfMCJEWlQ-xm9sN',
                      //'https://drive.google.com/uc?id=1DKW_8cxs0vMyzqNWqhprXMwugI5rZwJl',
                  //TODO: check out how to use placeholders
                  //placeholder:image(),
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  height: getProportionateScreenHeight(70),
                  width: getProportionateScreenWidth(70),
                ),
                SizedBox(
                  width: getProportionateScreenHeight(15),
                ),
                //todo: change the name here
                Text("Togun",
                    style: TextStyle(
                        fontSize: 24, color: Theme.of(context).primaryColor)),
                Text("Oluwatobi",
                    style: TextStyle(
                        fontSize: 24, color: Theme.of(context).primaryColor)),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                //change the icons later
                MyMoreContainer(
                    icon: Icon(Icons.lock,
                        size: 20, color: Theme.of(context).primaryColor),
                    text: "Change Password",
                    onTap: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  ChnagePasswordPage()),
                  );
                    }),
                SizedBox(
                  height: getProportionateScreenHeight(46),
                ),
                MyMoreContainer(
                    icon: Icon(Icons.lock,
                        size: 20, color: Theme.of(context).primaryColor),
                    text: "Security",
                    onTap: () {}),
                SizedBox(
                  height: getProportionateScreenHeight(46),
                ),
                MyMoreContainer(
                    text: "Terms And Conditions",
                    onTap: () {},
                    icon: Icon(Icons.lock,
                        size: 20, color: Theme.of(context).primaryColor)),
                SizedBox(
                  height: getProportionateScreenHeight(46),
                ),
                MyMoreContainer(
                    text: "Support",
                    onTap: () {},
                    icon: Icon(Icons.lock,
                        size: 20, color: Theme.of(context).primaryColor)),
                SizedBox(
                  height: getProportionateScreenHeight(117),
                ),
                MyButton(text: 'logout', onTap: () {}, enabled: true)
              ]),
            )),
      ),
    );
  }
}
