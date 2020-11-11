import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furn_ra/constants.dart';
import 'package:furn_ra/ui/views/camera/camera_view.dart';
import 'package:furn_ra/ui/views/camera/camera_view_mobile.dart';
import 'package:furn_ra/ui/views/forget/forget_view.dart';
import 'package:furn_ra/ui/views/home/home_view.dart';
import 'package:furn_ra/ui/views/register/register_view.dart';

class LoginMobilePortrait extends StatelessWidget {
  const LoginMobilePortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: size.height * 0.01),
            SvgPicture.asset(
              "assets/icons/undraw_discoverable_xwsc.svg",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.05),
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
            ),

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
          ],
        ),
      ),
    );
  }
}
