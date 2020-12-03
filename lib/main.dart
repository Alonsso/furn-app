import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:furn_ra/constants.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'FURN',
      theme: _lightTheme(),
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
    primaryColor: kPrimaryColor,
  );
}

const ColorScheme _lightColorScheme = ColorScheme(
  primary: lightGreen100,
  primaryVariant: kPrimaryColor,
  secondary: lightGreen50,
  secondaryVariant: lightGreen300,
  surface: lightSurfaceWhite,
  background: lightBackgroundWhite,
  error: Colors.red,
  onPrimary: lightGreen900,
  onSecondary: lightGreen600,
  onSurface: lightGreen900,
  onBackground: lightGreen900,
  onError: Colors.red,
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
  );
}

ThemeData _obscureTheme() {
  return ThemeData(
    backgroundColor: Colors.black,
  );
}

const ColorScheme _darkColorScheme = ColorScheme(
  primary: lightGreen100,
  primaryVariant: lightGreen400,
  secondary: lightBackgroundWhite,
  secondaryVariant: lightBackgroundWhite,
  surface: lightGreen600,
  background: lightGreen900,
  error: Colors.red,
  onPrimary: Colors.white,
  onSecondary: lightGreen900,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.red,
  brightness: Brightness.dark,
);
