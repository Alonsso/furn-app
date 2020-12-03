import 'dart:math';

import 'package:flutter/material.dart';
import 'package:furn_ra/ui/views/camera/camera_view.dart';
import 'package:furn_ra/ui/views/register/register_view.dart';
import 'package:flutter/animation.dart';

class LoginMobilePortrait extends StatefulWidget {
  const LoginMobilePortrait({Key key}) : super(key: key);

  @override
  _LoginMobilePortraitState createState() => _LoginMobilePortraitState();
}

class _LoginMobilePortraitState extends State<LoginMobilePortrait>
    with SingleTickerProviderStateMixin {
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
      curve: Curves.easeInOutCirc,
      reverseCurve: Curves.easeInCirc,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * pi,
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
    Size size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Transform.rotate(
                angle: animation.value,
                child: Image.asset(
                  "assets/images/text824.png",
                  height: size.height * 0.25,
                ),
              ),

              //SizedBox(height: size.height * 0.01),

              //SizedBox(height: size.height * 0.05),
              Container(
                  width: size.width * 0.7,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: TextField(
                    cursorColor: colorScheme.primaryVariant,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: colorScheme.secondaryVariant,
                      ),
                      labelText: 'Usuario',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: colorScheme.primaryVariant,
                      )),
                    ),
                  )),
              //SizedBox(height: size.height * 0.02),
              Container(
                  width: size.width * 0.7,
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: TextField(
                    cursorColor: colorScheme.primaryVariant,
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: colorScheme.secondaryVariant,
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: colorScheme.secondaryVariant,
                      ),
                      labelText: 'Contraseña',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: colorScheme.primaryVariant,
                      )),
                      helperText: '',
                    ),
                  )),

              FlatButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                minWidth: 200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29)),
                color: colorScheme.onSecondary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CameraView();
                    }),
                  );
                },
                child: Text("INGRESAR"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "¿No tienes cuenta?",
                    style: TextStyle(color: colorScheme.onPrimary),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return RegisterView();
                        }),
                      );
                    },
                    child: Text(
                      " Regístrate",
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              /*
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ForgetView();
                  }),
                );
              },
              child: Text(
                "¿Olvidaste tu contraseña?",
                style: TextStyle(color: colorScheme.onPrimary, fontSize: 14),
              ),
            ),*/
            ],
          ),
        ),
      ),
    );
  }
}
