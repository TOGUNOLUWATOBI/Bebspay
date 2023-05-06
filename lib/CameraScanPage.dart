import 'package:app/PreviewScreen.dart';
import 'package:app/components/my_button.dart';
import 'package:app/size_config.dart';
import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScanPage extends StatefulWidget {
  CameraScanPage({required this.cameras, required this.header});
  List<CameraDescription> cameras;
  String header;
  @override
  _CameraScanPage createState() =>
      _CameraScanPage(cameras: cameras, header: header);
}

class _CameraScanPage extends State<CameraScanPage> {
  _CameraScanPage({required this.cameras, required this.header});
  String header;
  late List<CameraDescription> cameras;
  late CameraController cameraController =
      CameraController(cameras[1], ResolutionPreset.high);

  late int selectedCameraIndex = 0;
  late String imgPath;

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 1;
        });
        _initCameraController(cameras[selectedCameraIndex]).then((void v) {});
      } else {
        print("No camera available");
      }
    }).catchError((err) {
      print('Error : ${err.code}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF493F5E),
      body: Container(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(13),
            right: getProportionateScreenWidth(13),
            top: getProportionateScreenHeight(46)),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                    width: getProportionateScreenWidth(100),
                  ),
                  Text(
                    header,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                        color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Center(
                child: Text(
                  "Adjust your face to fill the frame",
                  style: TextStyle(
                        fontSize: 24,
                        
                        fontFamily: "Inter",
                        color: Colors.white),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                padding: EdgeInsets.only(left:getProportionateScreenWidth(70), right:getProportionateScreenWidth(70), top: getProportionateScreenHeight(30), bottom: getProportionateScreenHeight(30) ),
                child: DottedBorder(
                  borderType: BorderType.Oval,
                  radius: Radius.circular(20),
                  strokeWidth: 3,
                  padding: EdgeInsets.zero,
                  color: Colors.white,
                  dashPattern: [100, 6],
                  child: Center(
                    child: SizedBox(
                      height: getProportionateScreenHeight(400),
                      //width: getProportionateScreenHeight(400),
                      child: ClipOval(
                        child: _cameraPreviewWidget(),
                      ),
                    ),
                  ),
                ),
              ),
              MyButton(
                  text: "Continue",
                  onTap: () {
                    _onCapturePressed(context);
                  },
                  enabled: true)
            ],
          ),
        ),
      ),
    );
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    if (cameraController.value.hasError) {
      print("Camera error ${cameraController.value.errorDescription}");
    }

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  ///display camera preview

  Widget _cameraPreviewWidget() {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Text("Loading",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.w900));
    }
    return AspectRatio(
      aspectRatio: cameraController.value.aspectRatio,
      child: CameraPreview(cameraController),
    );
  }

  ///display the control bar with buttons to take pictures

  Widget _cameraControlWidfet(context) {
    return Expanded(
        child: Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(
              Icons.camera,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            onPressed: () {
              _onCapturePressed(context);
            },
          )
        ],
      ),
    ));
  }

  Widget _cameraToggleRowWidget() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
        child: Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton.icon(
          onPressed: _onSwitchCamera,
          icon: Icon(_getCameraIcon(lensDirection)),
          label: Text(
            '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          )),
    ));
  }

  void _showCameraException(CameraException e) {
    String errorText = "Error : ${e.code}\n Error Message : ${e.description}";
    print(errorText);
  }

  void _onCapturePressed(context) async {
    try {
      final path =
          join((await getTemporaryDirectory()).path, '${(DateTime.now())}.png');

      var pic = await cameraController.takePicture();

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PreviewScreen(
                  imgPath: pic.path,
                )),
      );
      print(pic.path);
    } on CameraException catch (e) {
      _showCameraException(e);
    }
  }

  void _onSwitchCamera() {
    selectedCameraIndex =
        selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;

    CameraDescription selectedCamera = cameras[selectedCameraIndex];

    _initCameraController(selectedCamera);
  }

  _buttonPreview(double _height, double _width) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      minimumSize: Size(_width, _height),
      backgroundColor: Colors.grey,
      padding: EdgeInsets.all(0),
    );
    return TextButton(
      style: flatButtonStyle,
      onPressed: () {},
      child: Text(
        "some text",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  _getCameraIcon(CameraLensDirection lensDirection) {
    switch (lensDirection) {
      case (CameraLensDirection.back):
        return Icons.flip_camera_ios;

      case (CameraLensDirection.front):
        return Icons.flip_camera_ios;

      case CameraLensDirection.external:
        return Icons.photo_camera;
      default:
        return Icons.device_unknown;
    }
  }
}
