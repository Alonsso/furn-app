import 'package:flutter/material.dart';
import 'package:furn_ra/constants.dart';
import 'package:furn_ra/ui/views/camera/camera_view_mobile.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 1;

  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1.0,
        shrinkWrap: true,
        children: List.generate(10, (index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: colorScheme.primary,
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.background,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          // Respond to item press.
          if (value == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CameraScreen();
            }));
          }
          if (value == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginView();
            }));
          }
          setState(() => _currentIndex = value);
        },
        items: [
          BottomNavigationBarItem(
            label: 'Cámara',
            icon: Icon(Icons.camera_alt_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            label: 'Salir',
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
