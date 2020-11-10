import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:furn_ra/ui/responsive/orientation_layout.dart';
import 'package:furn_ra/ui/responsive/screen_type_layout.dart';
import 'package:furn_ra/ui/views/camera/camera_view_mobile.dart';
import 'package:furn_ra/main.dart';
import 'package:furn_ra/ui/views/camera/camera_view_tablet.dart';

class CameraView extends StatelessWidget {
  const CameraView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CameraScreen();
  }
}
