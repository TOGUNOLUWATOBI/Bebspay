import 'package:app/Model/Authentication/LoginRequestModel.dart';
import 'package:app/size_config.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'ForgotPasswordPage.dart';
import 'Service/Authentication/Authentication.dart';
import 'SignUp.dart';
import 'Utility/Utility.dart';
import 'components/BottomNavigationBar.dart';
import 'components/my_button.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final storage = new FlutterSecureStorage();  
  late bool isLoading = false;

  bool isVisible = false;
  List<CameraDescription>? cameras ;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    cameras = await availableCameras();
    FlutterNativeSplash.remove();
  }
  final GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    SizeConfig().init(context);
    
    
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Color(0XFFffffff),
      body: SingleChildScrollView(
        child: Container(
          
          padding: const EdgeInsets.only(left: 31, right: 31),
          child: Form(
            //yautovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: getProportionateScreenHeight(106)),
                Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                Text(
                  "Welcome Back, Sign in into your account",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff979797)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(101),
                ),
                TextFormField(
                  controller: email,
                  enableInteractiveSelection: true,
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
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty ) {
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
                  height: getProportionateScreenHeight(44),
                ),
                TextFormField(
                  controller: password,
                  enableInteractiveSelection: true,
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
                    }
                     else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(46),
                ),
                TextButton(
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff9766D5)),
                  ),
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()),
                    );
                    print("bbbbbb");
                  },
                ),
                SizedBox(
                  height: getProportionateScreenHeight(88),
                ),
                MyButton(text: "Sign In", onTap: () async{


                  


                  //todo: properly do validation
                  if(!formkey.currentState!.validate()) {
                     
                        setState(() {
                          isLoading = true;
                        });

                        if (await hasInternetConnection()) {
                          //push to home page OR LOGIN PAGE after creating the account

                          var loginResponseModel = await login(LoginRequestModel(
                              emailAddress: email.text,
                              password: password.text));
                            if(loginResponseModel != null)
                            {
                              storeToken(loginResponseModel!.accessToken!);
                              print(getToken());
                            }
                          
                        }
                        else {
                          setState(() {
                            isLoading = false;
                          });
                          // showErrorSnackBar(
                          //     "Failed to connect, Check your internet connection",
                          //     context);
                        }
                      }
                  
                  Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              ButtomNavBar(),
                        ),
                      );

                },enabled: true,),
                SizedBox(
                  height: getProportionateScreenHeight(140),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff979797)),
                    ),
                    TextButton(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff9766D5),
                            decoration: TextDecoration.underline),
                      ),
                      onPressed: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  SignUpPage(cameras: cameras!,)),
                  );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
