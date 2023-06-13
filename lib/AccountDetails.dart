import 'package:app/size_config.dart';
import 'package:flutter/material.dart';

import 'components/DetailsContainer.dart';

class AccountDetailsPage extends StatelessWidget {
  final String fullName;
  final int tier;
  final int limit;
  final String accountNumber;
  final String bankName;

  const AccountDetailsPage({super.key, required this.fullName, required this.tier, required this.limit, required this.accountNumber, required this.bankName});

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
              MyDetailsContainer(header: "Account Name", value: fullName),
              SizedBox(height: getProportionateScreenHeight(46),),
              MyDetailsContainer(header: "Account Number", value: accountNumber),
              SizedBox(height: getProportionateScreenHeight(46),),
              MyDetailsContainer(header: "Bank Name", value: bankName),
              SizedBox(height: getProportionateScreenHeight(46),),
            ],
          ),
        ),
      ),
    );

  }
}