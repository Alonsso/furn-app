import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furn_ra/ui/views/camera/camera_view.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';

class RegisterMobilePortrait extends StatefulWidget {
  const RegisterMobilePortrait({Key key}) : super(key: key);

  @override
  _RegisterMobilePortraitState createState() => _RegisterMobilePortraitState();
}

class _RegisterMobilePortraitState extends State<RegisterMobilePortrait>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(
      duration: new Duration(seconds: 2),
      vsync: this,
    )..addListener(() {
        setState(() {
          //_controller.forward();
        });
      });
    super.initState();
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
              //SizedBox(height: size.height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/text824.png",
                    height: size.height * 0.3,
                  ),
                ],
              ),
              Container(
                width: size.width * 0.6,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Form(
                  //key: super.key,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        cursorColor: colorScheme.primaryVariant,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 50,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.mail,
                            color: colorScheme.secondaryVariant,
                          ),
                          counterText: '',
                          labelText: 'Email',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: colorScheme.primaryVariant,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        cursorColor: colorScheme.primaryVariant,
                        keyboardType: TextInputType.text,
                        maxLength: 50,
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: colorScheme.secondaryVariant,
                          ),
                          counterText: '',
                          labelText: 'Usuario',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: colorScheme.primaryVariant,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        cursorColor: colorScheme.primaryVariant,
                        obscureText: true,
                        maxLength: 50,
                        textAlign: TextAlign.left,
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
                          counterText: '',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: colorScheme.primaryVariant,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              FlatButton(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                minWidth: 200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: colorScheme.onSecondary,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CameraView();
                    }),
                  );
                },
                child: Text("REGISTRARME"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "¿Ya tienes cuenta?",
                    style: TextStyle(color: colorScheme.onPrimary),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginView();
                        }),
                      );
                    },
                    child: Text(
                      " Ingresar",
                      style: TextStyle(
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
