import 'package:animations/animations.dart';
import 'package:app/IdentificationPage.dart';
import 'package:app/TermsAndConditions.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Policy_Dialog.dart';

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

  String? selectedState;
  String? selectedCity;

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  String gender = "";
  

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Select One"), value: "Select One"),
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
    ];
    return menuItems;
  }

  List<NigeriaLocation> nigeriaLocations = [
    NigeriaLocation(
      state: 'Abia',
      cities: ['Aba', 'Arochukwu', 'Umuahia'],
    ),
    NigeriaLocation(
      state: 'Adamawa',
      cities: ['Jimeta', 'Mubi', 'Numan', 'Yola'],
    ),
    NigeriaLocation(
      state: 'Akwa Ibom',
      cities: ['Ikot Abasi', 'Ikot Ekpene', 'Oron', 'Uyo'],
    ),
    NigeriaLocation(
      state: 'Anambra',
      cities: ['Awka', 'Onitsha'],
    ),
    NigeriaLocation(
      state: 'Bauchi',
      cities: ['Azare', 'Bauchi', 'Jama′are', 'Katagum', 'Misau'],
    ),
    NigeriaLocation(
      state: 'Bayelsa',
      cities: ['Brass'],
    ),
    NigeriaLocation(
      state: 'Benue',
      cities: ['Makurdi'],
    ),
    NigeriaLocation(
      state: 'Borno',
      cities: ['Biu', 'Dikwa', 'Maiduguri'],
    ),
    NigeriaLocation(
      state: 'Cross River',
      cities: ['Calabar', 'Ogoja'],
    ),
    NigeriaLocation(
      state: 'Delta',
      cities: ['Asaba', 'Burutu', 'Koko', 'Sapele', 'Ughelli', 'Warri'],
    ),
    NigeriaLocation(
      state: 'Ebonyi',
      cities: ['Abakaliki'],
    ),
    NigeriaLocation(
      state: 'Edo',
      cities: ['Benin City'],
    ),
    NigeriaLocation(
      state: 'Ekiti',
      cities: ['Ado-Ekiti', 'Effon-Alaiye', 'Ikere-Ekiti'],
    ),
    NigeriaLocation(
      state: 'Enugu',
      cities: ['Enugu', 'Nsukka'],
    ),
    NigeriaLocation(
      state: 'Federal Capital Territory',
      cities: ['Abuja'],
    ),
    NigeriaLocation(
      state: 'Gombe',
      cities: ['Deba Habe', 'Gombe', 'Kumo'],
    ),
    NigeriaLocation(
      state: 'Imo',
      cities: ['Owerri'],
    ),
    NigeriaLocation(
      state: 'Jigawa',
      cities: ['Birnin Kudu', 'Dutse', 'Gumel', 'Hadejia', 'Kazaure'],
    ),
    NigeriaLocation(
      state: 'Kaduna',
      cities: ['Jemaa', 'Kaduna', 'Zaria'],
    ),
    NigeriaLocation(
      state: 'Kano',
      cities: ['Kano'],
    ),
    NigeriaLocation(
      state: 'Katsina',
      cities: ['Daura', 'Katsina'],
    ),
    NigeriaLocation(
      state: 'Kebbi',
      cities: ['Argungu', 'Birnin Kebbi', 'Gwandu', 'Yelwa'],
    ),
    NigeriaLocation(
      state: 'Kogi',
      cities: ['Idah', 'Kabba', 'Lokoja', 'Okene'],
    ),
    NigeriaLocation(
      state: 'Kwara',
      cities: ['Ilorin', 'Jebba', 'Lafiagi', 'Offa', 'Pategi'],
    ),
    NigeriaLocation(
      state: 'Lagos',
      cities: [
        'Badagry',
        'Epe',
        'Ikeja',
        'Ikorodu',
        'Lagos',
        'Mushin',
        'Shomolu',
        'Lekki',
        'Ajah'
      ],
    ),
    NigeriaLocation(
      state: 'Nasarawa',
      cities: ['Keffi', 'Lafia', 'Nasarawa'],
    ),
    NigeriaLocation(
      state: 'Niger',
      cities: [
        'Agaie',
        'Baro',
        'Bida',
        'Kontagora',
        'Lapai',
        'Minna',
        'Suleja'
      ],
    ),
    NigeriaLocation(
      state: 'Ogun',
      cities: ['Abeokuta', 'Ijebu-Ode', 'Ilaro', 'Shagamu'],
    ),
    NigeriaLocation(
      state: 'Ondo',
      cities: ['Akure', 'Ikare', 'Oka-Akoko', 'Ondo', 'Owo'],
    ),
    NigeriaLocation(
      state: 'Osun',
      cities: [
        'Ede',
        'Ikire',
        'Ikirun',
        'Ila',
        'Ile-Ife',
        'Ilesha',
        'Ilobu',
        'Inisa',
        'Iwo',
        'Oshogbo'
      ],
    ),
    NigeriaLocation(
      state: 'Oyo',
      cities: ['Ibadan', 'Iseyin', 'Ogbomosho', 'Oyo', 'Saki'],
    ),
    NigeriaLocation(
      state: 'Plateau',
      cities: ['Bukuru', 'Jos', 'Vom', 'Wase'],
    ),
    NigeriaLocation(
      state: 'Rivers',
      cities: ['Bonny', 'Degema', 'Okrika', 'Port Harcourt'],
    ),
    NigeriaLocation(
      state: 'Sokoto',
      cities: ['Sokoto'],
    ),
    NigeriaLocation(
      state: 'Taraba',
      cities: ['Ibi', 'Jalingo', 'Muri'],
    ),
    NigeriaLocation(
      state: 'Yobe',
      cities: ['Damaturu', 'Nguru'],
    ),
    NigeriaLocation(
      state: 'Zamfara',
      cities: ['Gusau', 'Kaura Namoda'],
    ),
  ];


  List<DropdownMenuItem<String>> _buildStateDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (var location in nigeriaLocations) {
      final truncatedText = location.state.length > 7
          ? '${location.state.substring(0, 7)}...' // Truncate text if longer than 15 characters
          : location.state;

      items.add(
        DropdownMenuItem(
          value: location.state,
          child: Tooltip(
            message: location.state,
            child: Text(truncatedText),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<String>> _buildCityDropdownItems(String selectedState) {
    List<DropdownMenuItem<String>> items = [];
    for (var location in nigeriaLocations) {
      if (location.state == selectedState) {
        for (var city in location.cities) {
          final truncatedText = city.length > 8
              ? '${city.substring(0, 8)}...' // Truncate text if longer than 15 characters
              : city;

          items.add(
            DropdownMenuItem(
              value: city,
              child: Tooltip(
                message: city,
                child: Text(truncatedText),
              ),
            ),
          );
        }
        break;
      }
    }
    return items;
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
                    child: DropdownButtonFormField<String>(
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
                        onChanged: (String? value) {
                          setState(() {
                            selectedState = value;
                                selectedCity = null; 
                          });
                        },
                        items: _buildStateDropdownItems()),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(65),
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
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
                        items: selectedState != null
                                ? _buildCityDropdownItems(selectedState!)
                                : [],
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                    )
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
                      fontSize:16
                    ),
                    
                  ),
                  GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(
                      //   builder: (context) =>  TermsAndCondtions()));
                      //  TermsAndCondtions();
                       showModal(
                      context: context,
                      configuration: FadeScaleTransitionConfiguration(),
                      builder: (context) {
                        return PolicyDialog(
                          mdFileName: 'TermsCondition.md',
                        );
                      },
                    );
                    },
                    child: Text(
                          "terms and conditons",
                          style: TextStyle(
                              fontSize: 16,
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


class NigeriaLocation {
  final String state;
  final List<String> cities;

  NigeriaLocation({required this.state, required this.cities});
}