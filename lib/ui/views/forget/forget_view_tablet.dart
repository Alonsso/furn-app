import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furn_ra/constants.dart';
import 'package:furn_ra/ui/views/camera/camera_view.dart';
import 'package:furn_ra/ui/views/home/home_view.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';
import 'package:furn_ra/ui/views/register/register_view.dart';
import 'package:furn_ra/ui/views/welcome/welcome_view.dart';

class ForgetTabletView extends StatelessWidget {
  const ForgetTabletView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;
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
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                  SizedBox(height: size.height * 0.02),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    minWidth: 200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(29)),
                    color: kPrimaryColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return WelcomeScreen();
                        }),
                      );
                    },
                    child: Text("ENVIAR"),
                  ),
                  SizedBox(height: size.height * 0.02),
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
                        "FURN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                            decoration: TextDecoration.none),
                      ),
                      SizedBox(height: size.height * 0.3),
                      Container(
                          width: size.width * 0.7,
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                              return WelcomeScreen();
                            }),
                          );
                        },
                        child: Text("ENVIAR"),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
