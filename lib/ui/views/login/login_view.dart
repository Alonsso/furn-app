import 'package:flutter/material.dart';
import 'package:furn_ra/ui/responsive/orientation_layout.dart';
import 'package:furn_ra/ui/responsive/screen_type_layout.dart';
import 'package:furn_ra/ui/views/login/login_view_mobile.dart';
import 'package:furn_ra/ui/views/login/login_view_tablet.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: LoginMobilePortrait(),
        landscape: Container(),
      ),
      tablet: LoginTablet(),
    );
  }
}
