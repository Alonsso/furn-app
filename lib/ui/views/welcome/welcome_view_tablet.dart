import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furn_ra/constants.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';
import 'package:furn_ra/ui/views/register/register_view.dart';

class WelcomeTablet extends StatelessWidget {
  const WelcomeTablet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: orientation == Orientation.portrait
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "BIENVENIDO A FURN",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: size.height * 0.08),
                  SvgPicture.asset(
                    "assets/icons/undraw_augmented_reality_heuy.svg",
                    height: size.height * 0.3,
                  ),
                  SizedBox(height: size.height * 0.08),
                  Text(
                    "Diseñe sus espacios con AR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 28,
                        color: Colors.black,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: size.height * 0.12),
                  FlatButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                    minWidth: 350,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29)),
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginView();
                        }),
                      );
                    },
                    child: Text(
                      "INGRESAR",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  FlatButton(
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                    minWidth: 350,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29)),
                    color: kPrimaryLightColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return RegisterView();
                        }),
                      );
                    },
                    child: Text(
                      "REGISTRARSE",
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  )
                ],
              ),
            )
          : Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/icons/undraw_augmented_reality_heuy.svg",
                        height: size.height * 0.3,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "BIENVENIDO A FURN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(height: size.height * 0.3),
                      FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                        minWidth: 350,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29)),
                        color: kPrimaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return LoginView();
                            }),
                          );
                        },
                        child: Text(
                          "INGRESAR",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                        minWidth: 350,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(29)),
                        color: kPrimaryLightColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return RegisterView();
                            }),
                          );
                        },
                        child: Text(
                          "REGISTRARSE",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
