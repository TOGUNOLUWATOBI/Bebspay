import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'PinCofirmationPage.dart';
import 'components/BalanceContainer.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController amount = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  bool enabled = false;

  String? dropdownValue = "Select One";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
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
                          "Send Money",
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
                BalanceContainer(
                    balance: "5430",
                    firstName: "Bebs",
                    accountNumber: "1234567890"),
                SizedBox(height: getProportionateScreenHeight(31)),
                TextButton(
                  child: Text(
                    "Select Beneficiary",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9766D5)),
                  ),
                  onPressed: () {
                   
                  },
                ),
            
                Padding(
                  padding:  EdgeInsets.only(left:getProportionateScreenWidth(27),
                  right: getProportionateScreenWidth(27)),
                  child: TextFormField(
                    controller: amount,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      labelText: "Enter the amount",
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
                    labelText: "Select Bank",
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
                  child: TextFormField(
                    controller: amount,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      counter: Offstage(),
                      labelText: "Enter the Account Number",
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
                ),
                SizedBox(height: getProportionateScreenHeight(90)),

                //TODO: ask chizaram perform validation to make the button active
                MyButton(text: "Continue", onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>  PinConfirmationPage()));
                }, 
                //TODO: change this to the enabled parameter
                enabled: true)
              ]),
            )));
  }
}
