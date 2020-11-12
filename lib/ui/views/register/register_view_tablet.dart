import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furn_ra/ui/views/camera/camera_view.dart';
import 'package:furn_ra/ui/views/home/home_view.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';
import 'package:furn_ra/ui/views/register/register_view.dart';

import '../../../constants.dart';

class RegisterTablet extends StatelessWidget {
  const RegisterTablet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: orientation == Orientation.portrait
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //SizedBox(height: size.height * 0.01),
                  SvgPicture.asset(
                    "assets/icons/undraw_mobile_login_ikmv.svg",
                    height: size.height * 0.3,
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                      width: size.width * 0.7,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                      child: TextField(
                        cursorColor: colorScheme.primaryVariant,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.mail,
                            color: colorScheme.secondaryVariant,
                          ),
                          labelText: 'Email',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: colorScheme.primaryVariant)),
                        ),
                      )),
                  Container(
                      width: size.width * 0.7,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
                  SizedBox(height: size.height * 0.02),
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
                    child: Text(
                      "REGISTRARME",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "¿Ya tienes cuenta?",
                        style: TextStyle(
                          color: colorScheme.onPrimary,
                          fontSize: 18,
                        ),
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
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/icons/undraw_mobile_login_ikmv.svg",
                        height: size.height * 0.3,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: size.width * 0.4,
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                          child: TextField(
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              icon: Icon(Icons.mail),
                              labelText: 'Email',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: kPrimaryColor,
                              )),
                            ),
                          )),
                      Container(
                          width: size.width * 0.4,
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                          child: TextField(
                            cursorColor: kPrimaryColor,
                            decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: 'Usuario',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: kPrimaryColor,
                              )),
                            ),
                          )),
                      //SizedBox(height: size.height * 0.02),
                      Container(
                          width: size.width * 0.4,
                          padding:
                              EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                          child: TextField(
                            cursorColor: kPrimaryColor,
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              suffixIcon: Icon(Icons.visibility),
                              labelText: 'Contraseña',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: kPrimaryColor,
                              )),
                              helperText: '',
                            ),
                          )),
                      SizedBox(height: size.height * 0.02),
                      FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        minWidth: 200,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29)),
                        color: kPrimaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return CameraView();
                            }),
                          );
                        },
                        child: Text(
                          "REGISTRARME",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "¿Ya tienes cuenta?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
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
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
