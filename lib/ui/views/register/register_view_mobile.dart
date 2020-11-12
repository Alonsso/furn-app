import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furn_ra/constants.dart';
import 'package:furn_ra/ui/views/camera/camera_view.dart';
import 'package:furn_ra/ui/views/home/home_view.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';
import 'package:furn_ra/ui/views/register/register_view.dart';

class RegisterMobilePortrait extends StatelessWidget {
  const RegisterMobilePortrait({Key key}) : super(key: key);

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
              "assets/icons/undraw_mobile_login_ikmv(1).svg",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.05),
            Container(
                width: size.width * 0.7,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                      color: colorScheme.primaryVariant,
                    )),
                  ),
                )),
            Container(
                width: size.width * 0.7,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
              child: Text("REGISTRARME"),
            ),
            SizedBox(height: size.height * 0.02),
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
    );
  }
}
