import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furn_ra/constants.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';
import 'package:furn_ra/ui/views/register/register_view.dart';

class WelcomeMobilePortrait extends StatelessWidget {
  const WelcomeMobilePortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "BIENVENIDO A FURN",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
                fontSize: 14,
                color: Colors.black,
                decoration: TextDecoration.none),
          ),
          SizedBox(height: size.height * 0.12),
          FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            minWidth: 200,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
            color: kPrimaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LoginView();
                }),
              );
            },
            child: Text("INGRESAR"),
          ),
          SizedBox(height: size.height * 0.03),
          FlatButton(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            minWidth: 200,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
            color: kPrimaryLightColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return RegisterView();
                }),
              );
            },
            child: Text("REGISTRARSE"),
          )
        ],
      ),
    );
  }
}
