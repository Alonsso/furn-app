import 'package:flutter/material.dart';
import 'package:furn_ra/ui/responsive/orientation_layout.dart';
import 'package:furn_ra/ui/responsive/screen_type_layout.dart';
import 'package:furn_ra/ui/views/welcome/welcome_view_mobile.dart';
import 'package:furn_ra/ui/views/welcome/welcome_view_tablet.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: WelcomeMobilePortrait(),
        landscape: Container(),
      ),
      tablet: WelcomeTablet(),
    );
  }
}
