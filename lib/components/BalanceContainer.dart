import 'package:flutter/material.dart';
import '../size_config.dart';

class BalanceContainer extends StatelessWidget {
  BalanceContainer({super.key, required this.balance, required this.firstName, required this.accountNumber});
  String balance;
  String firstName;
  String accountNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xff493F5E), borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.only(
          
          top: getProportionateScreenHeight(25),
          bottom: getProportionateScreenHeight(25)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
          padding: EdgeInsets.only(left:getProportionateScreenWidth(15), right:getProportionateScreenWidth(45)),
          child: Row(children: [
            Text(
              accountNumber,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Spacer(),
            Text(
              firstName,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ]),
        ),
        SizedBox(height: getProportionateScreenHeight(18),),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            //TODO: change the balance here
              "N "+balance,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            ),
        ),
      ]),
    );
  }
}
