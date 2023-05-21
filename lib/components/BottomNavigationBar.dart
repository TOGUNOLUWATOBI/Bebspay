import 'dart:ffi';

import 'package:app/Dashboard.dart';
import 'package:app/more.dart';
import 'package:app/pay.dart';
import 'package:app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtomNavBar extends StatefulWidget{

  ButtomNavBar({super.key});  

  @override
  State<ButtomNavBar> createState() => _ButtomNavBarState();
}

class _ButtomNavBarState extends State<ButtomNavBar> {
  int selectedIndex = 0;

  onTap(index){
    setState(() {
      selectedIndex = index;
    });
  }

  final List _children = [
    Dashboard(),
    PayScreen(),
    MoreScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/Home.svg',
            height: getProportionateScreenHeight(25),
            width: getProportionateScreenWidth(25),
            color:  selectedIndex == 0 ? Theme.of(context).primaryColor : Color(0xffA9A5AF),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/pay.svg',
            height: getProportionateScreenHeight(25),
            width: getProportionateScreenWidth(25),
            color:  selectedIndex == 1 ? Theme.of(context).primaryColor : Color(0xffA9A5AF),),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/images/more.svg',
            height: getProportionateScreenHeight(25),
            width: getProportionateScreenWidth(25),
            color:  selectedIndex == 2 ? Theme.of(context).primaryColor : Color(0xffA9A5AF),),
            label: 'More',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: onTap,
      )
    );
  }
}
