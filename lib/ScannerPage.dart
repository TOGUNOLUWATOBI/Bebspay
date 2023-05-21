import 'package:app/CameraScanPage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScannerPage extends StatelessWidget{
  ScannerPage({required this.cameras, required this.header});
  List<CameraDescription> cameras ;
  String header;
  @override
  
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black
    ));
    
    return Scaffold(
      body: CameraScanPage(cameras: cameras,header: header,),
    );
  }
}