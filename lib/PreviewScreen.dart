import 'dart:io';

import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class PreviewScreen extends StatefulWidget{
  String imgPath;

  PreviewScreen({required this.imgPath});

  @override
  _PreviewScreenState createState ()=> _PreviewScreenState();


}

class _PreviewScreenState extends State<PreviewScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
     
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 9,
              child: Image.file(File(widget.imgPath),fit: BoxFit.fill,),
              
            ),
            //
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.black,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.share,color: Colors.white,),
                    onPressed: (() {
                      getBytes().then((bytes){
                        Share.file("Share via", basename(widget.imgPath), bytes.buffer.asUint8List(), "image/path");
                      });
                    }),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<ByteData> getBytes() async{
    Uint8List bytes = File(widget.imgPath).readAsBytesSync() as Uint8List;

    return ByteData.view(bytes.buffer);
  }
}