import 'package:camera/camera.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furn_ra/constants.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';
import 'package:furn_ra/ui/views/welcome/welcome_view.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,*/
      debugShowCheckedModeBanner: false,
      title: 'FURN',
      theme: _darkTheme(),
      home: LoginView(),
    );
  }
}

/*
 * LIGHT THEME
 * 
 * Tema default de la aplicacion con base al tema light propuesto por Flutter,
 * realizando las mofificaciones necesarias.
 * 
 */

ThemeData _lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: _lightColorScheme,
    textTheme: _lightTextTheme(base.textTheme),
    primaryColor: kPrimaryColor,
  );
}

TextTheme _lightTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Consolas',
        displayColor: lightGreen900,
        bodyColor: lightGreen900,
      );
}

const ColorScheme _lightColorScheme = ColorScheme(
  primary: lightGreen100,
  primaryVariant: kPrimaryColor,
  secondary: lightGreen50,
  secondaryVariant: lightGreen300,
  surface: lightSurfaceWhite,
  background: lightBackgroundWhite,
  error: lightErrorRed,
  onPrimary: lightGreen900,
  onSecondary: lightGreen600,
  onSurface: lightGreen900,
  onBackground: lightGreen900,
  onError: lightErrorRed,
  brightness: Brightness.light,
);

/**
 *  DARK THEME  
 * 
 * Tema oscurso modificado en base al tema oscuro de flutter. 
 */
ThemeData _darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: _darkColorScheme,
    textTheme: _lightTextTheme(base.textTheme),
    primaryColor: kPrimaryColor,
    backgroundColor: darkBackgroundColor,
  );
}

TextTheme _darkTextTheme(TextTheme base) {
  return base
      .copyWith(
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
        button: base.button.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: defaultLetterSpacing,
        ),
      )
      .apply(
        fontFamily: 'Consolas',
        displayColor: lightGreen900,
        bodyColor: lightGreen900,
      );
}

const ColorScheme _darkColorScheme = ColorScheme(
  primary: lightGreen100,
  primaryVariant: kPrimaryColor,
  secondary: lightGreen50,
  secondaryVariant: lightGreen900,
  surface: lightSurfaceWhite,
  background: lightBackgroundWhite,
  error: lightErrorRed,
  onPrimary: lightGreen900,
  onSecondary: lightGreen600,
  onSurface: lightGreen900,
  onBackground: lightGreen900,
  onError: lightErrorRed,
  brightness: Brightness.light,
);
