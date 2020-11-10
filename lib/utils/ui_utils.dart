import 'package:flutter/widgets.dart';
import 'package:furn_ra/enums/device_screen_type.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.shortestSide;

  if (deviceWidth >= 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
