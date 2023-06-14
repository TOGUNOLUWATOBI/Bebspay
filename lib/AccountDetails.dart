import 'package:app/size_config.dart';
import 'package:flutter/material.dart';

import 'Model/Account/AccountDetails.dart';
import 'components/DetailsContainer.dart';

class AccountDetailsPage extends StatelessWidget {
  final AccountDetails accountDetails;

  const AccountDetailsPage({super.key, required this.accountDetails});

  @override
  Widget build(BuildContext context) {
    //TODO : implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 25, right: 31),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getProportionateScreenHeight(60)),
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
                      "Wallet Details",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D0051)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(60),),
              //TODO: make sure that value can be copied to clipboard
              MyDetailsContainer(header: "Account Name", value: accountDetails.fullName!),
              SizedBox(height: getProportionateScreenHeight(46),),
              MyDetailsContainer(header: "Account Number", value: accountDetails.accountNumber!),
              SizedBox(height: getProportionateScreenHeight(46),),
              MyDetailsContainer(header: "Bank Name", value: accountDetails.bankName!),
              SizedBox(height: getProportionateScreenHeight(46),),
              MyDetailsContainer(header: "Account Tier", value: accountDetails.tier.toString()),
              SizedBox(height: getProportionateScreenHeight(46),),
              MyDetailsContainer(header: "Linit", value: accountDetails.limit.toString()),
              SizedBox(height: getProportionateScreenHeight(46),),
            ],
          ),
        ),
      ),
    );

  }
}