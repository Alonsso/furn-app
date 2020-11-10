import 'package:flutter/material.dart';
import 'package:furn_ra/ui/responsive/orientation_layout.dart';
import 'package:furn_ra/ui/responsive/screen_type_layout.dart';
import 'package:furn_ra/ui/views/camera/camera_view.dart';
import 'package:furn_ra/ui/views/home/home_view.dart';
import 'package:furn_ra/ui/views/welcome/welcome_view.dart';
import 'package:furn_ra/widgets/app_drawer/app_drawer_mobile.dart';
import 'package:furn_ra/widgets/app_drawer/app_drawer_tablet.dart';
import 'package:furn_ra/widgets/drawer_option/drawer_option.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AppDrawerMobile(),
      tablet: OrientationLayout(
        portrait: AppDrawerTabletPortrait(),
        landscape: AppDrawerTabletLandscape(),
      ),
    );
  }

  static List<Widget> getDrawerOptions(BuildContext context) {
    return [
      FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: DrawerOption(
          title: 'Cámara',
          iconData: Icons.camera_alt,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return CameraView();
            }),
          );
        },
      ),
      FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: DrawerOption(
          title: 'Salir',
          iconData: Icons.exit_to_app,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return WelcomeScreen();
            }),
          );
        },
      )
    ];
  }
}
