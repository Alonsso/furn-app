import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:furn_ra/ui/views/arelements/ar_view.dart';
import 'package:furn_ra/ui/views/home/home_view.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:furn_ra/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State {
  CameraController controller;
  int selectedCameraIndex;
  String imgPath;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      body: NativeDeviceOrientationReader(builder: (context) {
        NativeDeviceOrientation orientation =
            NativeDeviceOrientationReader.orientation(context);

        int turns;
        switch (orientation) {
          case NativeDeviceOrientation.landscapeRight:
            turns = 1;
            break;
          case NativeDeviceOrientation.portraitDown:
            turns = 2;
            break;
          default:
            turns = 0;
            break;
        }

        return RotatedBox(
          quarterTurns: turns,
          child: Transform.scale(
            scale: 1 / controller.value.aspectRatio,
            child: Center(
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
            ),
          ),
        );
      }),
      floatingActionButton: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //_cameraScroll(),
                      _cameraToggleRowWidget(),
                      _cameraControlWidget(context),
                      _cameraTogglePerfil(),
                    ],
                  ),
                ),
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  /// Display the control bar with buttons to take pictures
  Widget _cameraControlWidget(context) {
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
      ),
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).

  Widget _cameraScroll() {
    final barHeight = 90.0;
    final vertPadding = 10.0;
    return Container(
      height: barHeight,
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: ListView(
        //padding: EdgeInsets.symmetric(vertical: vertPadding),
        //shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 160.0,
            color: Colors.red,
          ),
          Container(
            width: 160.0,
            color: Colors.blue,
          )
        ],
        /*itemBuilder: (BuildContext context, int _) {
          return Container(
            padding: EdgeInsets.only(right: 5.0),
            width: 70.0,
            height: barHeight - vertPadding * 2,
            child: Image(
              image: NetworkImage(
                  'https://cdn1.iconfinder.com/data/icons/augmented-reality-ar/64/AR-augmented-reality-360-VR-virtual-512.png'),
              fit: BoxFit.cover,
            ),
          );
        },*/
      ),
    );
  }

  Widget _cameraToggleRowWidget() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: FlatButton.icon(
          onPressed: () {
            Navigator.push(this.context, MaterialPageRoute(
              builder: (context) {
                return ArView();
              },
            ));
          },
          icon: Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
            size: 45,
          ),
          label: Text(
            '',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  Widget _cameraTogglePerfil() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: FlatButton.icon(
          onPressed: () {
            Navigator.push(
              this.context,
              MaterialPageRoute(builder: (context) {
                return HomeView();
              }),
            );
          },
          icon: Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
          label: Text(
            ' ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  void _onCapturePressed(context) async {
    try {
      final path =
          join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');

      await controller.takePicture(path);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );

      print(path);
    } catch (e) {
      print(e);
    }
  }
}
