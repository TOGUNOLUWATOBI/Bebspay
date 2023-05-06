import 'package:app/IdentificationPage.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key,required this.cameras});
  List<CameraDescription> cameras ;
  @override
  State<SignUpPage> createState() => _SignUpPageState(cameras: cameras);
}

class _SignUpPageState extends State<SignUpPage> {
  _SignUpPageState({required this.cameras});
  List<CameraDescription> cameras ;
  bool isVisible = false;
  bool isChecked =false;
  String? dropdownValue = "Select One";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Select One"), value: "Select One"),
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
    ];
    return menuItems;
  }

  Color getColor(Set<MaterialState> states) {
      Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xFF2D0051);
      }
      return Colors.transparent;
    }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(30.5),
            right: getProportionateScreenWidth(30.5)),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(47),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "SignUp",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        color: Color(0xFF2D0051)),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(28)),
              Text(
                "Welcome to Bebspay,",
                style: TextStyle(
                    color: Color(0xffA9A5AF),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Opensans',
                    fontSize: 24),
              ),
              Text(
                "Create a free account",
                style: TextStyle(
                    color: Color(0xffA9A5AF),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: getProportionateScreenHeight(45),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Firstname",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Lastname",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(46)),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return "Please enter a valid email";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "PhoneNumber",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(11)
                ],
                keyboardType: TextInputType.number,
              ),

              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              TextFormField(
                obscureText: !isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    color: Color(0xff979797),
                    icon: !isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return "Password must contain at least 8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              TextFormField(
                obscureText: !isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    color: Color(0xff979797),
                    icon: !isVisible
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: Color(0xff979797)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff979797)),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  }
                  if (!RegExp(
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                      .hasMatch(value)) {
                    return "Password must contain at least 8 characters, 1 uppercase, 1 lowercase, 1 number and 1 special character";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     hintText: "Gender",
              //       labelText: "Gender",
              //       labelStyle: TextStyle(color: Color(0xff979797)),
              //       enabledBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Color(0xff979797)),
              //       ),
              //       focusedBorder: UnderlineInputBorder(
              //         borderSide: BorderSide(color: Color(0xff979797)),
              //       ),
              //       suffixIcon: DropdownButtonFormField(

              //         onChanged: (String? newValue) {
              //           setState(() {
              //             dropdownValue = newValue;
              //           });
              //         },
              //         items: <String>["Select One","Male", "Female"]
              //             .map<DropdownMenuItem<String>>((String item) {
              //           return DropdownMenuItem<String>(
              //             value: item,
              //             child: Text(
              //               item,
              //               style: TextStyle(fontSize: 18,fontFamily: "Opensans",color: Color(0xff979797)),

              //             ),
              //           );
              //         }).toList(),
              //         value: dropdownValue,
              //       )),
              // ),
              // DropdownButton<String>(
              //   value: dropdownValue,

              //   items: <String>["Select One","Male", "Female"]
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(
              //         value,
              //         style: TextStyle(fontSize: 18,fontFamily: "Opensans"),
              //       ),
              //     );
              //   }).toList(),
              //   // Step 5.
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       dropdownValue = newValue!;
              //     });
              //   },
              // ),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff979797))),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff979797)),
                    ),
                    filled: false,
                    labelText: "Gender",
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

              SizedBox(
                height: getProportionateScreenHeight(46),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff979797))),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff979797)),
                          ),
                          filled: false,
                          labelText: "State",
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
                  SizedBox(
                    width: getProportionateScreenWidth(65),
                  ),
                  Expanded(
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff979797))),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff979797)),
                          ),
                          filled: false,
                          labelText: "LGA",
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
                ],
              ),

              SizedBox(
                height: getProportionateScreenHeight(64),
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        style: BorderStyle.solid,
                        ),
                      checkColor: Theme.of(context).primaryColor,
                      focusColor: Theme.of(context).primaryColor,
                      hoverColor: Theme.of(context).primaryColor,
                      activeColor: Colors.transparent,
                      //fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Text(
                    "I agree to the ",
                    style: TextStyle(
                      fontSize:18
                    ),
                    
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Text(
                          "terms and conditons",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff9766D5),
                              decoration: TextDecoration.underline),
                        ),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(46),),
              MyButton(text: ("Submit"), onTap: isChecked ? (){
                Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>  IdentificationPage(cameras: cameras,)));
              }:null,enabled: isChecked,)
            ],
          ),
        ),
      ),
    ));
  }
}
