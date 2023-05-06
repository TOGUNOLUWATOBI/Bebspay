import 'package:app/IdDocumentFirstPage.dart';
import 'package:app/size_config.dart';
import 'package:camera/camera.dart';
import "package:flutter/material.dart";

class IdentificationPage extends StatelessWidget {
  List<CameraDescription> cameras ;
  IdentificationPage({super.key, required this.cameras});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(23),
              right: getProportionateScreenWidth(29)),
          child: Center(
              child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(60),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Identity Verification",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: "Inter",
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(60),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("We need your preferred document to verify your identity. This document should match the sign-up form's information. Selecting a document helps us verify your e-wallet account.",
                style: Theme.of(context).textTheme.bodyText2,),
              ),
              SizedBox(height: getProportionateScreenHeight(34),),
              Container(
                padding: EdgeInsets.only(left: 24,right: 22,top: 19,bottom: 18),
                decoration: BoxDecoration(
                  color: Color(0XFFEDF1F9),
                  
                ),
                child: Row(
                  
                  children: [
                    Image.asset("assets/images/credit-card.png"),
                    SizedBox(width: getProportionateScreenWidth(18),),
                    Text("National ID Card",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 14,fontFamily: "Inter",fontWeight: FontWeight.bold),),
                    Spacer(),
                    IconButton(
                      color: Color(0xff979797),
                      icon: Icon(Icons.arrow_forward_outlined),
                      onPressed: (() {
                        Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>  IdDocumentFirstPage(textMessgae: "NIN number",cameras: cameras,)));
                      })
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(26),),
              Container(
                padding: EdgeInsets.only(left: 24,right: 22,top: 19,bottom: 18),
                decoration: BoxDecoration(
                  color: Color(0XFFEDF1F9),
                  
                ),
                child: Row(
                  
                  children: [
                    Image.asset("assets/images/earth.png"),
                    SizedBox(width: getProportionateScreenWidth(18),),
                    Text("International Passport",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 14,fontFamily: "Inter",fontWeight: FontWeight.bold),),
                    Spacer(),
                    IconButton(
                      color: Color(0xff979797),
                      icon: Icon(Icons.arrow_forward_outlined),
                      onPressed: null
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(26),),
              Container(
                padding: EdgeInsets.only(left: 24,right: 22,top: 19,bottom: 18),
                decoration: BoxDecoration(
                  color: Color(0XFFEDF1F9),
                  
                ),
                child: Row(
                  
                  children: [
                    Image.asset("assets/images/credit-card.png"),
                    SizedBox(width: getProportionateScreenWidth(18),),
                    Text("Drivers License",style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 14,fontFamily: "Inter",fontWeight: FontWeight.bold),),
                    Spacer(),
                    IconButton(
                      color: Color(0xff979797),
                      icon: Icon(Icons.arrow_forward_outlined),
                      onPressed: null
                    ),
                    
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(45),),
              Text("Dont have any means of Identification",
              style: TextStyle(
                color: Color(0xff979797),
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: "Inter"
              ),),
              SizedBox(height: getProportionateScreenHeight(15),),
              GestureDetector(
                onTap: null,
                child: Text("Click Here",style: TextStyle(color: Color(0xff9766D5),fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: "Inter"),),
              )
            ],
          )),
        ),
      ),
    );
  }
}
