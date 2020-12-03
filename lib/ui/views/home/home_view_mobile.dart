import 'package:flutter/material.dart';
import 'package:furn_ra/ui/views/camera/camera_view_mobile.dart';
import 'package:furn_ra/ui/views/login/login_view.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

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
      appBar: AppBar(
        title: const Text('Fotos'),
        leading: new Container(),
        centerTitle: true,
        backgroundColor: colorScheme.onSecondary,
      ),
      /*
        GridView.count(
        crossAxisCount: 3,
        children: List.generate(20, (index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(0),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn1.iconfinder.com/data/icons/augmented-reality-ar/64/AR-augmented-reality-360-VR-virtual-512.png'),
                  fit: BoxFit.cover,
                ),
                color: colorScheme.primary,
              ),
            ),
          );
        }),
      ),
       */
      body: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(20, (index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(seconds: 3),
              columnCount: 3,
              child: ScaleAnimation(
                child: FadeInAnimation(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn1.iconfinder.com/data/icons/augmented-reality-ar/64/AR-augmented-reality-360-VR-virtual-512.png'),
                        fit: BoxFit.cover,
                      ),
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
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
