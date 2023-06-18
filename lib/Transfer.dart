import 'package:app/Model/Account/TransferRequestModel.dart';
import 'package:app/Model/Account/VerifyAccountUserRequestModel.dart';
import 'package:app/Model/Account/VerifyAccountUserResponseModel.dart';
import 'package:app/Service/Authentication/Authentication.dart';
import 'package:app/Utility/Utility.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:app/components/pin_modal_sheet.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'Model/Account/Banks.dart';
import 'PinCofirmationPage.dart';
import 'Service/Authentication/Account.dart';
import 'components/BalanceContainer.dart';

class TransferPage extends StatefulWidget {
  final String? firstName;
  final String? accountNumeber;
  final double? balance;

  const TransferPage(
      {super.key,
      required this.firstName,
      required this.accountNumeber,
      required this.balance});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController amount = TextEditingController();
  TextEditingController accountNumber = TextEditingController();
  TextEditingController description= TextEditingController();
  TextEditingController pinController = TextEditingController();
  bool enabled = false;
  VerifyAccountUserResponseModel? accountBeneficiary;
  String? accountName;
  Bank? dropdownValue;
  double? fee;
  int? intamount;

  List<Bank>? dropdownItems = [];

  void populateDropdown() async {
    if (await hasInternetConnection()) {
      var banks = await GetBanks();

      setState(() {
        dropdownItems = banks;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    populateDropdown();
  }

  @override
  Widget build(BuildContext context) {
    if (dropdownItems!.isEmpty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
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
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(5)),
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
                    balance: widget.balance!.toString(),
                    firstName: widget.firstName!,
                    accountNumber: widget.accountNumeber!),
                SizedBox(height: getProportionateScreenHeight(31)),
                TextButton(
                  child: Text(
                    "Select Beneficiary",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9766D5)),
                  ),
                  onPressed: () {},
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(27),
                      right: getProportionateScreenWidth(27)),
                  child: TextFormField(
                    controller: accountNumber,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      labelText: "Enter the account number",
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
                        return "Please enter the account number";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(41)),
                Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(27),
                      right: getProportionateScreenWidth(27)),
                  child: DropdownButtonFormField<Bank>(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff979797))),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797)),
                      ),
                      filled: false,
                      labelText: "Select Bank",
                      labelStyle: TextStyle(
                        color: Color(0xff979797),
                      ),
                    ),
                    isExpanded: true,
                    //dropdownColor: Colors.blueAccent,
                    value: dropdownValue,
                    onChanged: (newValue) async {
                      accountBeneficiary = await VerifyAccount(
                          new VerifyAccountUserRequestModel(
                              accountNumber: accountNumber.text,
                              bankName: newValue!.bankName!));
                      
                      setState(() {
                        dropdownValue = newValue!;
                      });

                      if (accountBeneficiary != null) {
                        setState(() {
                          accountName = accountBeneficiary!.accountName;
                        });
                      }
                      else
                      {
                        setState(() {
                          accountName ="";
                        });
                      }
                    },
                    items: dropdownItems!.map((Bank item) {
                      return DropdownMenuItem(
                        value: item,
                        child: AutoSizeText(
                          item.bankName!,
                          minFontSize: 6,
                          maxLines: 1,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Text(accountName ?? ""),
                SizedBox(height: getProportionateScreenHeight(41)),

                Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(27),
                      right: getProportionateScreenWidth(27)),
                  child: FocusScope(
                    child: TextFormField(
                      controller: amount,
                      enableInteractiveSelection: true,
                      decoration: InputDecoration(
                        counter: Offstage(),
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
                    //TODO: ask chizaram how to go about this: the button should become enabled once it has a value >=100
                    onFocusChange: (value) async{
                      intamount = int.tryParse(amount.text);
                      if (intamount != null) {
                        if (accountName == "" ||
                            accountName == null ||
                            intamount! < 100) {
                          setState(() {
                            enabled = false;
                          });
                        } else  {
                          fee = await GetFeeAmount(intamount!);
                          setState(()  {
                            enabled = true;
                            
                          });
                        }
                      }
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(41)),
                Padding(
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(27),
                      right: getProportionateScreenWidth(27)),
                  child: TextFormField(
                    controller: description,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                      labelText: "Enter a description",
                      labelStyle: TextStyle(color: Color(0xff979797)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797)),
                      ),
                    ),
                    
                    validator: (value) {
                      //TODO: ask chizaram how to go about this
                      if (value!.isEmpty) {
                        return "Please enter a description";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(90)),

                //TODO: ask chizaram perform validation to make the button active
                MyButton(
                    text: "Continue",
                    onTap: () async {
                      
                      _showModalBottomSheet(context);
                    },
                    //TODO: change this to the enabled parameter
                    enabled: enabled)
              ]),
            )));
  }

  // Transaction PIN Modal Sheet
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
                'You are about to transfer ${amount.text} to ${accountName} with a fee of $fee ',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: getProportionateScreenHeight(40)),

              /// Transaction PIN Box
              Center(
                child: Pinput(
                  controller: pinController,
                  // onCompleted: (value) {
                  //   setState(() {
                  //     //_otpController.text = value;
                  //     //print(_otpController.text);
                  //   });
                  // },
                  length: 4,

                  obscureText: true,
                  textInputAction: TextInputAction.done,

                  // focusedPinTheme: kFocusedPin(context),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(100)),
              MyButton(
                text: 'Continue',
                onTap: () async{
                  
                  String? latitude = await getLatitude();
                  String? longitude = await getLongitude();
                  InitiateTransfer(new TransferRequestModel(amount: intamount!, trxAmount: (intamount! + fee!), description: description.text, beneficiaryName: accountName!, beneficiaryAccountNumber: accountNumber.text, beneficiaryBank: dropdownValue!.bankName!, beneficiaryBankCode: dropdownValue!.bankCode!, latitude: latitude!, longitude: longitude!));
                  Navigator.pop(context);
                },
                enabled: true,
              ),
              SizedBox(height: getProportionateScreenHeight(20))
            ]),
          );
        });
  }
}
