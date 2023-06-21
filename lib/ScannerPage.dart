import 'package:app/CameraScanPage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScannerPage extends StatelessWidget{
  ScannerPage({required this.cameras, required this.header, required this.IdNumber, required this.type});
  List<CameraDescription> cameras ;
  String header;
  String type;
  String IdNumber;
  @override
  
  Widget build(BuildContext context){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black
    ));
    
    return Scaffold(
      body: CameraScanPage(cameras: cameras,header: header, IdNumber: IdNumber, type: type,),
    );
  }
}