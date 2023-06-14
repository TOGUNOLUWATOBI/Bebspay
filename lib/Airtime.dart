import 'package:app/PinCofirmationPage.dart';
import 'package:app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/BalanceContainer.dart';
import 'components/my_button.dart';

class AirtimePage extends StatefulWidget {
  const AirtimePage({super.key});

  @override
  State<AirtimePage> createState() => _AirtimePageState();
}

class _AirtimePageState extends State<AirtimePage> {
   final GlobalKey<FormState> formkey = GlobalKey();

  TextEditingController amount = TextEditingController();

  TextEditingController accountNumber = TextEditingController();

  bool enabled = false;

  String? dropdownValue = "Select One";
  String? typeDropdownValue = "Airtime";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Airtel"), value: "Airtel"),
      DropdownMenuItem(child: Text("GLO"), value: "GLO"),
      DropdownMenuItem(child: Text("MTN"), value: "MTN"),
      DropdownMenuItem(child: Text("9Mobile"), value: "NMobile"),
    ];
    return menuItems;
  }

  
  List<DropdownMenuItem<String>> get typeDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Airtime"), value: "Airtime"),
      DropdownMenuItem(child: Text("Data"), value: "Data"),
      
    ];
    return menuItems;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(49),
                bottom: getProportionateScreenHeight(68),
                left: getProportionateScreenWidth(15),
                right: getProportionateScreenWidth(15)),
            child: Form(
              key: formkey,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                  child: Row(
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
                          "Buy Airtime",
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D0051)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(40)),

                //TODO: use the endpoint here to get the balance
                BalanceContainer(
                    balance: "5430",
                    firstName: "Bebs",
                    accountNumber: "1234567890"),
                SizedBox(height: getProportionateScreenHeight(31)),
                
            
                Padding(
                  padding:  EdgeInsets.only(left:getProportionateScreenWidth(27),
                  right: getProportionateScreenWidth(27)),
                  child: TextFormField(
                    controller: amount,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      labelText: "Enter the Phone Number",
                      labelStyle: TextStyle(color: Color(0xff979797)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797)),
                      ),
                      focusedBorder: UnderlineInputBorder(    
                        borderSide: BorderSide(color: Color(0xff979797)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11)
                    ],
                    validator: (value) {
                      //TODO: ask chizaram how to go about this
                      if (value!.isEmpty) {
                        return "Please enter the amount";
                      }
                      return null;
                    
                    },
                    
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(41)),
                Padding(
                  padding:  EdgeInsets.only(left:getProportionateScreenWidth(27),
                  right: getProportionateScreenWidth(27)),
                  child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797))),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),
                    ),
                    filled: false,
                    labelText: "Select Service Provider",
                    labelStyle: TextStyle(color: Color(0xff979797)),
                  ),
                  //dropdownColor: Colors.blueAccent,
                  //value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: dropdownItems),

                ),
                SizedBox(height: getProportionateScreenHeight(41)),
                Padding(
                  padding:  EdgeInsets.only(left:getProportionateScreenWidth(27),
                  right: getProportionateScreenWidth(27)),
                  child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797))),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),
                    ),
                    filled: false,
                    labelText: "Select Type of Service",
                    labelStyle: TextStyle(color: Color(0xff979797)),
                  ),
                  //dropdownColor: Colors.blueAccent,
                  //value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      typeDropdownValue= newValue!;
                    });
                  },
                  items: typeDropdownItems),

                ),
                SizedBox(height: getProportionateScreenHeight(41),),
                buildRightWidget(),
                
                SizedBox(height: getProportionateScreenHeight(60)),

                //TODO: ask chizaram perform validation to make the button active
                MyButton(text: "Continue", onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>  PinConfirm()));
                }, 
                //TODO: change this to the enabled parameter
                enabled: true)
              ]),
            )));
    
  }

  Widget buildRightWidget() {

    if(typeDropdownValue == "Airtime" )
    {
      return Padding(
                  padding:  EdgeInsets.only(left:getProportionateScreenWidth(27),
                  right: getProportionateScreenWidth(27)),
                  child: TextFormField(
                    controller: amount,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      counter: Offstage(),
                      labelText: "Enter the Amount",
                      labelStyle: TextStyle(color: Color(0xff979797)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                    
                    ],
                    maxLength: 10,
                                                        
                    validator: (value) {
                      //TODO: ask chizaram how to go about this
                      if (value!.isEmpty) {
                        return "Please enter the amount";
                      }
                      return null;
                    
                    },
                    
                  ),
                );
    }

    return Padding(
                  padding:  EdgeInsets.only(left:getProportionateScreenWidth(27),
                  right: getProportionateScreenWidth(27)),
                  child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797))),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),
                    ),
                    filled: false,
                    labelText: "Select Type of Service",
                    labelStyle: TextStyle(color: Color(0xff979797)),
                  ),
                  //dropdownColor: Colors.blueAccent,
                  //value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      typeDropdownValue= newValue!;
                    });
                  },
                  items: typeDropdownItems),

                );
  }
}