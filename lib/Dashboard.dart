import 'package:app/FundWallet.dart';
import 'package:app/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFffffff),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(25),
              right: getProportionateScreenWidth(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        //change this url
                        'https://drive.google.com/uc?id=1DKW_8cxs0vMyzqNWqhprXMwugI5rZwJl',
                    //TODO: check out how to use placeholders
                    //placeholder:image(),
                    progressIndicatorBuilder: (context, url, progress) =>
                        Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                    height: getProportionateScreenHeight(70),
                    width: getProportionateScreenWidth(70),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  //TODO: change the name here
                  Text("Hi Bebs,",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor)),
                  SizedBox(
                    width: getProportionateScreenWidth(114),
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff493F5E),
                    borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(25),
                    top: getProportionateScreenHeight(25),
                    bottom: getProportionateScreenHeight(25)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Balance",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(9),
                      ),
                      //TODO: change the value here to get the proper balance
                      Text(
                        "5469847755775.52",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(17),
                      ),
                      Center(
                        child: SizedBox(
                          width: getProportionateScreenWidth(155),
                          height: getProportionateScreenHeight(50),
                          child: GestureDetector(
                            //TODO: implement this function or page => Navigator.push and then display flutterwave static account
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    //TODO: change the page to the fund wallet page
                                      builder: (context) => FundWalletpage(accountNumber: '', BankName: '', accountName: '',)));
                            },
                            child: Container(
                              //padding: EdgeInsets.all(40),
                              //margin: EdgeInsets.symmetric(horizontal:  2),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Center(
                                  child: Text(
                                "Fund Wallet",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )),
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: getProportionateScreenHeight(61),
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              //   height: 20,
              //   child: Expanded(
              //     child: OverflowBox(
              //         maxWidth: MediaQuery.of(context).size.width,
              //         child: Divider(
              //           thickness: 2,
              //           height: 2,
              //           color: Color(0xffA9A5AF),
              //         )),
              //   ),
              // ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Transactions",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(112),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        color: Color(0xffA9A5AF),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Image.asset(
                "assets/images/NoTransaction.png",
                height: getProportionateScreenHeight(342),
                width: getProportionateScreenWidth(342),
              ),
              SizedBox(height: getProportionateScreenHeight(55)),
            ],
          ),
        )));
  }
}

Widget image() {
  return Image.asset("assets/images/completelogo.png");
}
