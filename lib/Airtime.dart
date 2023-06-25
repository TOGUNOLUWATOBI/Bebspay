import 'package:app/Model/RequestModel/BuyAirtimeRequestModel.dart';
import 'package:app/PinCofirmationPage.dart';
import 'package:app/Service/Authentication/Account.dart';
import 'package:app/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import 'Model/Account/Databundle.dart';
import 'Model/RequestModel/CheckTransactionPinModel.dart';
import 'Service/Authentication/Authentication.dart';
import 'Utility/Utility.dart';
import 'components/BalanceContainer.dart';
import 'components/my_button.dart';

class AirtimePage extends StatefulWidget {
  final double? balance;
  final String? firstname;
  final String? accountNumber;
  const AirtimePage({super.key, required this.balance, required this.firstname, required this.accountNumber, String? accountNumeber});

  @override
  State<AirtimePage> createState() => _AirtimePageState();
}

  

class _AirtimePageState extends State<AirtimePage> {
   final GlobalKey<FormState> formkey = GlobalKey();

   DataBundle? selectedDataBundle;
   void populateDropdown(String serviceProvider) async {
    if (await hasInternetConnection()) {
      var dataBundles = await GetDataBundle(serviceProvider);

      setState(() {
        DataDropdownItems = dataBundles!;
      });
    }
  }
  
  List<DataBundle> DataDropdownItems = [];
  TextEditingController amount = TextEditingController();
  TextEditingController pinInputController = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();

  bool enabled = false;

  String? dropdownValue = "Select One";
  String? pin = "";
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
                    balance: widget.balance!.toString(),
                    firstName: widget.firstname!,
                    accountNumber: widget.accountNumber!),
                SizedBox(height: getProportionateScreenHeight(31)),
                
            
                Padding(
                  padding:  EdgeInsets.only(left:getProportionateScreenWidth(27),
                  right: getProportionateScreenWidth(27)),
                  child: TextFormField(
                    controller: phoneNumber,
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
                      if(typeDropdownValue == "Data")
                      {
                        populateDropdown(dropdownValue!);
                      }
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

                      if(typeDropdownValue == "Data")
                      {
                        populateDropdown(dropdownValue!);
                      }
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

  //   return Padding(
  //                 padding:  EdgeInsets.only(left:getProportionateScreenWidth(27),
  //                 right: getProportionateScreenWidth(27)),
  //                 child: DropdownButtonFormField(
  //                 decoration: InputDecoration(
  //                   enabledBorder: UnderlineInputBorder(
  //                       borderSide: BorderSide(color: Color(0xff979797))),
  //                   focusedBorder: UnderlineInputBorder(
  //                     borderSide: BorderSide(color: Color(0xff979797)),
  //                   ),
  //                   filled: false,
  //                   labelText: "Select Type of Service",
  //                   labelStyle: TextStyle(color: Color(0xff979797)),
  //                 ),
  //                 //dropdownColor: Colors.blueAccent,
  //                 //value: dropdownValue,
  //                 onChanged: (String? newValue) {
  //                   setState(() {
  //                     typeDropdownValue= newValue!;
  //                   });
  //                 },
  //                 items: typeDropdownItems),

  //               );
  // }
    return Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(27),
                      right: getProportionateScreenWidth(27)),
                  child: DropdownButtonFormField<DataBundle>(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff979797))),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797)),
                      ),
                      filled: false,
                      labelText: "Select data bundle",
                      labelStyle: TextStyle(
                        color: Color(0xff979797),
                      ),
                    ),
                    isExpanded: true,
                    //dropdownColor: Colors.blueAccent,
                    value: selectedDataBundle,
                    onChanged: (newValue) async {
                      setState(() {
                        selectedDataBundle = newValue!;
                      });

                     

                      
                    },
                    items: DataDropdownItems!.map((DataBundle item) {
                      return DropdownMenuItem(
                        value: item,
                        child: AutoSizeText(
                          item.name!,
                          minFontSize: 6,
                          maxLines: 1,
                        ),
                      );
                    }).toList(),
                  ),
                );
                
  }

   void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                top: getProportionateScreenHeight(20),
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Center(
                child: Text(
                  'Enter PIN',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(5)),
              Text(
                'You are about to buy this airtime of this ${amount.text}',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getProportionateScreenHeight(40)),

              /// Transaction PIN Box
              Center(
                child: Pinput(
                  controller: pinInputController,
                  onCompleted: (value) {
                    setState(() {
                      pin = value;
                      //print(_otpController.text);
                    });
                  },
                  length: 4,

                  obscureText: true,
                  textInputAction: TextInputAction.done,

                  // focusedPinTheme: kFocusedPin(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(100)),
              MyButton(
                text: 'Continue',
                onTap: () async {
                  if (await hasInternetConnection()) {
                    var isPinValid = await CheckTransactionPanicPin(
                        new CheckTransactionPinModel(trxPin: pin!));
                    if (isPinValid!) {
                      String? latitude = await getLatitude();
                      String? longitude = await getLongitude();
                      BuyAirtimeData(new BuyAirtimeRequestModel(
                          
                          latitude: latitude!,
                          longitude: longitude!, amount: int.tryParse(amount.text!)!,  customer: phoneNumber.text,  transferAmount: 0, trxAmount: 0, type: 'AIRTIME'));
                      Navigator.pop(context);
                    }
                  }
                },
                enabled: true,
              ),
              SizedBox(height: getProportionateScreenHeight(20))
            ]),
          );
        });
  }

}