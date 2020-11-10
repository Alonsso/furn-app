import 'package:flutter/material.dart';
import 'package:furn_ra/enums/device_screen_type.dart';
import 'package:furn_ra/ui/responsive/responsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const ScreenTypeLayout({
    Key key,
    this.mobile,
    this.tablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
          if (tablet != null) {
            return tablet;
          }
        }
        return mobile;
      },
    );
  }
}
