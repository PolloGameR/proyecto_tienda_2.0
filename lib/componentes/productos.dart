import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:proyecto_tienda/pages/detalles_producto.dart';

class Productos extends StatefulWidget {

  @override
  _ProductosState createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {


  var product_list = [
    {
      "name": "Anillo Luna",
      "picture": "imagenes/Productos/anillo_luna_luminosa1.png",
      "old_precio": 120,
      "precio": 100,
    },
    {
      "name": "Aretes bici",
      "picture": "imagenes/Productos/aretes_bici.png",
      "old_precio": 120,
      "precio": 100,
    },
    {
      "name": "Aretes perro",
      "picture": "imagenes/Productos/aretes_huella_perro.png",
      "old_precio": 100,
      "precio": 85,
    },
    {
      "name": "Aretes olivo",
      "picture": "imagenes/Productos/aretes_olivo.png",
      "old_precio": 100,
      "precio": 85,
    },
    {
      "name": "Bolsa",
      "picture": "imagenes/Productos/bolsas_cahuameras.png",
      "old_precio": 100,
      "precio": 85,
    },
    {
      "name": "Bote termico",
      "picture": "imagenes/Productos/termo_simple.png",
      "old_precio": 100,
      "precio": 85,
    },

  ];

  @override
  Widget build(BuildContext context) {
    final databaseReference = Firestore.instance;


    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_pic: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_precio'],
              prod_price: product_list[index]['precio'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pic;
  final prod_old_price;
  final prod_price;

  Single_prod(
      {this.prod_name, this.prod_pic, this.prod_old_price, this.prod_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  //Pasando los valores a los productos para los detalles
                  builder: (context) => new ProductDetails(
                        product_detail_name: prod_name,
                        product_detail_new_price: prod_price,
                        product_detail_old_price: prod_old_price,
                        product_detail_picture: prod_pic,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: new Row(children: <Widget>[
                      Expanded(
                        child: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ),
                      new Text("\$${prod_price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)
                    ],
                    )
                  ),
                  child: Image.asset(
                    prod_pic,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }

}
