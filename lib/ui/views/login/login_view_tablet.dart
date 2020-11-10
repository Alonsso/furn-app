import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furn_ra/constants.dart';
import 'package:furn_ra/ui/views/camera/camera_view.dart';
import 'package:furn_ra/ui/views/forget/forget_view.dart';
import 'package:furn_ra/ui/views/home/home_view.dart';
import 'package:furn_ra/ui/views/register/register_view.dart';

class LoginTablet extends StatelessWidget {
  const LoginTablet({Key key}) : super(key: key);

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
                    //SizedBox(height: size.height * 0.01),
                    SvgPicture.asset(
                      "assets/icons/undraw_thought_process_67my.svg",
                      height: size.height * 0.3,
                    ),
                    SizedBox(height: size.height * 0.05),
                    Container(
                        width: size.width * 0.5,
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 10),
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
                        width: size.width * 0.5,
                        padding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 10),
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
                    SizedBox(height: size.height * 0.02),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 100),
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
                        "INGRESAR",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "¿No tienes cuenta?",
                          style: TextStyle(color: Colors.black, fontSize: 18),
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
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                          "assets/icons/undraw_thought_process_67my.svg",
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
                          "INICIA SESIÓN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(height: size.height * 0.07),
                        Container(
                            width: size.width * 0.4,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 5),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 5),
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
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 100),
                          minWidth: 350,
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
                            "INGRESAR",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "¿No tienes cuenta?",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
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
              ));
  }
}
