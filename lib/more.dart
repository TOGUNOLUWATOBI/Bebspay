import 'package:animations/animations.dart';
import 'package:app/ChangePassword.dart';
import 'package:app/Model/Account/AccountDetails.dart';
import 'package:app/SecurityPage.dart';
import 'package:app/Service/Authentication/Account.dart';
import 'package:app/components/Container.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'AccountDetails.dart';
import 'Model/Account/DashboardDetails.dart';
import 'Policy_Dialog.dart';

class MoreScreen extends StatefulWidget {
  DashboardDetails details;
  MoreScreen({super.key, required this.details});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool isLoading = false;
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
                isLoading? CircularProgressIndicator():
                  CachedNetworkImage(
                    imageUrl:
                        //change this url
                        //'https://drive.google.com/uc?id=1DKW_8cxs0vMyzqNWqhprXMwugI5rZwJl',
                        'https://drive.google.com/uc?id=${widget.details.profilePicture!}',
                    //TODO: check out how to use placeholders
                    //placeholder:image(),
                    
                    height: getProportionateScreenHeight(70),
                    width: getProportionateScreenWidth(70),
                  ),
                SizedBox(
                  width: getProportionateScreenHeight(15),
                ),
                //TODO: change the name here
                // Text("Togun",
                //     style: TextStyle(
                //         fontSize: 24, color: Theme.of(context).primaryColor)),
                Text(widget.details.name!,
                    style: TextStyle(
                        fontSize: 24, color: Theme.of(context).primaryColor)),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                //TODO: change the icons later
                MyMoreContainer(
                    icon: Icon(Icons.lock,
                        size: 20, color: Theme.of(context).primaryColor),
                    text: "Account Details",
                    onTap: () async {

                      var accountDetails = await GetAccountDetails();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //TODO call the right endpoint here
                            builder: (context) => AccountDetailsPage(accountDetails: accountDetails!)),
                      );
                    }),
                SizedBox(
                  height: getProportionateScreenHeight(46),
                ),
                MyMoreContainer(
                    icon: Icon(Icons.lock,
                        size: 20, color: Theme.of(context).primaryColor),
                    text: "Change Password",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChnagePasswordPage()),
                      );
                    }),
                SizedBox(
                  height: getProportionateScreenHeight(46),
                ),
                MyMoreContainer(
                    icon: Icon(Icons.lock,
                        size: 20, color: Theme.of(context).primaryColor),
                    text: "Security",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecurityPage()),
                      );
                    }),
                SizedBox(
                  height: getProportionateScreenHeight(46),
                ),
                MyMoreContainer(
                    text: "Terms And Conditions",
                    onTap: () {
                      showModal(
                        context: context,
                        configuration: FadeScaleTransitionConfiguration(),
                        builder: (context) {
                          return PolicyDialog(
                            mdFileName: 'TermsCondition.md',
                          );
                        },
                      );
                    },
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
                //TODO: check how to do logout
                MyButton(text: 'logout', onTap: () {}, enabled: true)
              ]),
            )),
      ),
    );
  }
}
