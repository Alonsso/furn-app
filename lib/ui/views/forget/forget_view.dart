import 'package:flutter/material.dart';
import 'package:furn_ra/ui/responsive/screen_type_layout.dart';
import 'package:furn_ra/ui/views/forget/forget_view_mobile.dart';
import 'package:furn_ra/ui/views/forget/forget_view_tablet.dart';

class ForgetView extends StatelessWidget {
  const ForgetView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ForgetMobileView(),
      tablet: ForgetTabletView(),
    );
  }
}
