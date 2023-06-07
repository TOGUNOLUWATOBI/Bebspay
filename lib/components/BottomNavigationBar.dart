import 'dart:ffi';

import 'package:app/Airtime.dart';
import 'package:app/Dashboard.dart';
import 'package:app/Transfer.dart';
import 'package:app/more.dart';
import 'package:app/pay.dart';
import 'package:app/size_config.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtomNavBar extends StatefulWidget {
  ButtomNavBar({super.key});

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int selectedIndex = 0;

  onTap(index) {
    if (index == 1) {
      _showModalBottomSheet(context);
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }

  final List _children = [
    Dashboard(),
    null,
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Home.svg',
              height: getProportionateScreenHeight(25),
              width: getProportionateScreenWidth(25),
              color: selectedIndex == 0
                  ? Theme.of(context).primaryColor
                  : Color(0xffA9A5AF),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/Pay.svg',
              height: getProportionateScreenHeight(25),
              width: getProportionateScreenWidth(25),
              color: selectedIndex == 1
                  ? Theme.of(context).primaryColor
                  : Color(0xffA9A5AF),
            ),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/more.svg',
              height: getProportionateScreenHeight(25),
              width: getProportionateScreenWidth(25),
              color: selectedIndex == 2
                  ? Theme.of(context).primaryColor
                  : Color(0xffA9A5AF),
            ),
            label: 'More',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: onTap,
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) async {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        isScrollControlled: true,
        //useSafeArea: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(22)),
            decoration: BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.vertical(top: Radius.circular(getProportionateScreenWidth(30))),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PayBottomSheetCard(
                  image: 'assets/images/fundsTransfer.svg',
                  text: 'Funds Transfer',
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  TransferPage()),);
                  },
                ),
                KDivider(),
                PayBottomSheetCard(
                  image: 'assets/images/airtimePurchase.svg',
                  text: 'Airtime Purchase',
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  AirtimePage()),);
                  },
                ),
                KDivider(),
                PayBottomSheetCard(
                  image: 'assets/images/billPayment.svg',
                  text: 'Bills Payment',
                  onPressed: () {},
                ),
              ],
            ),
          );
        });
  }
}

class KDivider extends StatelessWidget {
  const KDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white,
      thickness: 1,
    );
  }
}

class PayBottomSheetCard extends StatelessWidget {
  const PayBottomSheetCard({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
  });

  final String? image;
  final String? text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(image!),
          Text(
            text!,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Icon(
            Icons.arrow_circle_right,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
