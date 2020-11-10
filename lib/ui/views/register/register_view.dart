import 'package:flutter/material.dart';
import 'package:furn_ra/ui/responsive/orientation_layout.dart';
import 'package:furn_ra/ui/responsive/screen_type_layout.dart';
import 'package:furn_ra/ui/views/register/register_view_mobile.dart';
import 'package:furn_ra/ui/views/register/register_view_tablet.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: RegisterMobilePortrait(),
        landscape: Container(),
      ),
      tablet: RegisterTablet(),
    );
  }
}
