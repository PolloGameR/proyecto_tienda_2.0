import 'package:flutter/material.dart';

class listviewhorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            img_location: 'imagenes/Iconos/Bolsas.png',
            img_caption: 'Bolsas',
          ),
          Category(
            img_location: 'imagenes/Iconos/Cepillos.png',
            img_caption: 'Cepillos',
          ),
          Category(
            img_location: 'imagenes/Iconos/Joyeria.png',
            img_caption: 'Joyeria',
          ),
          Category(
            img_location: 'imagenes/Iconos/Playeras.png',
            img_caption: 'Playeras',
          ),
          Category(
            img_location: 'imagenes/Iconos/Productos de cocina.png',
            img_caption: 'Cocina',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String img_location;
  final String img_caption;

  Category({this.img_location, this.img_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
              title: Image.asset(
                img_location,
                width: 80.0,
                height: 60.0,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  img_caption,
                  style: new TextStyle(fontSize: 12.0),
                ),
              )),
        ),
      ),
    );
  }
}
