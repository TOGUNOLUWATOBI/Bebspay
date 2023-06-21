import 'package:app/FundWallet.dart';
import 'package:app/Utility/Utility.dart';
import 'package:app/components/TransactionCard.dart';
import 'package:app/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Model/Account/DashboardDetails.dart';
import 'Model/Account/TransactionDto.dart';
import 'Service/Authentication/Account.dart';
import 'components/BottomNavigationBar.dart';

class Dashboard extends StatefulWidget {
  DashboardDetails details;

  Dashboard({super.key, required this.details});
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  bool isTransactionAvailable = false;
  bool isLoading = true;
  late List<TransactionDto>? transactions = null;
  late String firstname = "";
  late String profilePicture = "";
  late double balance = 0;

  void assignValue() {
    firstname = widget.details.name!;
    profilePicture = widget.details.profilePicture!;
    balance = widget.details.balance!;
    transactions = widget.details.transactions;
    isLoading = false;
  }

  void refresh() async {
    setState(() {
      isLoading = true;
    });

    var details = await GetDashboardDetails();
    if (details != null) {
      setState(() {
        isLoading = false;
        widget.details = details!;
        assignValue();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFffffff),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(25),
              right: getProportionateScreenWidth(25),
              bottom: getProportionateScreenHeight(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              Row(
                children: [
                  isLoading
                      ? CircularProgressIndicator()
                      : CachedNetworkImage(
                          imageUrl:
                              //change this url
                              //'https://drive.google.com/uc?id=1DKW_8cxs0vMyzqNWqhprXMwugI5rZwJl',
                              'https://drive.google.com/uc?id=$profilePicture',
                          //TODO: check out how to use placeholders
                          //placeholder:image(),

                          height: getProportionateScreenHeight(70),
                          width: getProportionateScreenWidth(70),
                        ),
                  SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  //TODO: change the name here
                  Text(isLoading ? "Hi" : "Hi $firstname,",
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
                        isLoading ? "" : balance.toString(),
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
                                      builder: (context) => FundWalletpage(
                                            accountNumber:
                                                widget.details.accountNumber!,
                                            bankName: widget.details.bank!,
                                            accountName: widget.details.name! +
                                                " " +
                                                widget.details.lastname!,
                                          )));
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
              // Image.asset(
              //   "assets/images/NoTransaction.png",
              //   height: getProportionateScreenHeight(342),
              //   width: getProportionateScreenWidth(342),
              // ),
              isLoading
                  ? Image.asset(
                      "assets/images/NoTransaction.png",
                      height: getProportionateScreenHeight(342),
                      width: getProportionateScreenWidth(342),
                    )
                  : Transaction(
                      context, transactions!.isNotEmpty, transactions),
            ],
          ),
        )));
  }
}

Widget Transaction(BuildContext context, bool isTransactionAvailable,
    List<TransactionDto>? transactions) {
  if (isTransactionAvailable == false) {
    return Image.asset(
      "assets/images/NoTransaction.png",
      height: getProportionateScreenHeight(342),
      width: getProportionateScreenWidth(342),
    );
  }
  List<Widget> cards = [];
  for (var transaction in transactions!) {
    bool isdebit = transaction.postingType == "Dr" ? true : false;
    var dateTime = transaction.creationDate;
    cards.add(TransactionCard(
        ticketDescription: transaction.beneficiary,
        amount: transaction.amount,
        isDebit: isdebit,
        dateCreated: transaction.createdDate,
        timeCreated: transaction.createdTime));
  }

  return Container(
    // Provide a fixed height
    child: ListView(
      shrinkWrap: true,
      children: cards.map((widget) {
        return Column(
          children: <Widget>[
            SizedBox(height: 10), // Adds 10 pixels of spacing
            widget,
          ],
        );
      }).toList(),
    ),
  );
}
