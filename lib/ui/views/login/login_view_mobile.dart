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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //SizedBox(height: size.height * 0.01),
            SvgPicture.asset(
              "assets/icons/undraw_thought_process_67my.svg",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * 0.05),
            Container(
                width: size.width * 0.7,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
                width: size.width * 0.7,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
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
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),

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
                  style: TextStyle(color: Colors.black),
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
                      color: kPrimaryColor,
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
