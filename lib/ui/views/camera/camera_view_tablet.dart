import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:furn_ra/main.dart';

class CameraScreenTablet extends StatefulWidget {
  @override
  _CameraScreenStateTablet createState() => _CameraScreenStateTablet();
}

class _CameraScreenStateTablet extends State {
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
                //_onCapturePressed(context);
              },
            )
          ],
        ),
      ),
    );
  }

  /// Display a row of toggle to select the camera (or a message if no camera is available).

  Widget _cameraToggleRowWidget() {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: FlatButton.icon(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[Text('Mueble 1')],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[Text("Mueble 2")],
                      )
                    ],
                  ),
                );
              },
            );
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
          onPressed: () {},
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
  /*
  void _onCapturePressed(context) async {
    try {
      final path =
          join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
      await controller.takePicture(path);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    } catch (e) {
      _showCameraException(e);
    }
  }
  */
}
