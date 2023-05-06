import 'package:app/components/my_button.dart';
import 'package:app/main.dart';
import 'package:app/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CompletePage extends StatelessWidget {
  String title;
  String Message;
  CompletePage({super.key, required this.title,required this.Message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 17,right: 17),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: [
              SizedBox(height: getProportionateScreenHeight(56)),
             
              SizedBox(height: getProportionateScreenHeight(108)),
              
              Image.asset("assets/images/completelogo.png",
              height: 100,
              width: 100,) ,
    
              // Image.network('https://drive.google.com/uc?export=view&id=1NkqUZvdyP88aVf_cDVYyJpNrD4UDRbr1'),

              // CachedNetworkImage(  imageUrl: 'https://drive.google.com/uc?id=1kAyjiNbeurmmKwKTpqfMCJEWlQ-xm9sN',
              // progressIndicatorBuilder: (context, url, progress) => Center(
              //     child: CircularProgressIndicator(
              //       value: progress.progress,
              //     ),
              //   ),
              // height: 100,
              // width: 100,),
              
              
              SizedBox(height: getProportionateScreenHeight(66),),
              
              Text(title,
              style: TextStyle(color: Color(0xFF2D0051),
              fontSize: 24,
              fontWeight: FontWeight.bold),),
              SizedBox(height: getProportionateScreenHeight(15),),
              Text(Message,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xff2F3930)
              ),),
              SizedBox(height: getProportionateScreenHeight(43),),
              MyButton(text:"Continue", onTap: (() {
                Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            //todo: change the message here
                            builder: (context) => MyApp()
                        ),
                        (r)
                        {
                          return false;
                        },
                        );
              
              }),enabled: true,
          )],
          ),
        ),
      ),
    );
  }
}
