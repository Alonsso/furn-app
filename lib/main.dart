import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:furn_ra/constants.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';
import 'package:splashscreen/splashscreen.dart';

List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> animation;

  @override
  void initState() {
    _controller = new AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
      reverseCurve: Curves.bounceIn,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SplashScreen(
          seconds: 10,
          navigateAfterSeconds: new AfterSplash(),
        ),
        Center(
          child: Positioned(
            child: logo(),
          ),
        ),
      ],
    );
  }

  Widget logo() {
    Size size = MediaQuery.of(context).size;
    return Transform.scale(
      alignment: Alignment.center,
      scale: animation.value,
      child: Image.asset(
        "assets/images/text824.png",
        height: size.height * 0.15,
      ),
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
