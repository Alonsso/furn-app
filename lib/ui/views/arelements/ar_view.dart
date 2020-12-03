import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ArView extends StatefulWidget {
  ArView({Key key}) : super(key: key);

  @override
  _ArViewState createState() => _ArViewState();
}

class _ArViewState extends State<ArView> {
  Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AR Items'),
        backgroundColor: colorScheme.onSecondary,
      ),
      body: MyStateFullWidget(),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.thumbnail,
    this.title,
    this.user,
    this.itemColor,
  });

  final Widget thumbnail;
  final String title;
  final String user;
  final String itemColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _VideoDescription(
              title: title,
              user: user,
              itemColor: itemColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key key,
    this.title,
    this.user,
    this.itemColor,
  }) : super(key: key);

  final String title;
  final String user;
  final String itemColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            user,
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            itemColor,
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStateFullWidget extends StatefulWidget {
  MyStateFullWidget({Key key}) : super(key: key);

  @override
  _MyStateFullWidgetState createState() => _MyStateFullWidgetState();
}

class _MyStateFullWidgetState extends State<MyStateFullWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        itemExtent: 106.0,
        children: <Widget>[
          AnimationConfiguration.staggeredList(
            duration: const Duration(seconds: 1),
            position: 0,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: CustomListItem(
                  user: 'Material: Madera',
                  itemColor: 'Colores: Nogal, Cerezo',
                  thumbnail: Image.asset("assets/images/mesa_centro.png"),
                  title: 'Mesa de centro',
                ),
              ),
            ),
          ),
          AnimationConfiguration.staggeredList(
            duration: const Duration(seconds: 1),
            position: 1,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: CustomListItem(
                  user: 'Material: Poliester',
                  itemColor: 'Colores: Azul, Verde',
                  thumbnail: Image.asset("assets/images/puff.png"),
                  title: 'Puff',
                ),
              ),
            ),
          ),
          AnimationConfiguration.staggeredList(
            duration: const Duration(seconds: 1),
            position: 2,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: CustomListItem(
                  user: 'Material: cuerso sintetico',
                  itemColor: 'Colores: Rojo, Negro',
                  thumbnail: Image.asset("assets/images/sofa_cama.png"),
                  title: 'Sofa cama',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
