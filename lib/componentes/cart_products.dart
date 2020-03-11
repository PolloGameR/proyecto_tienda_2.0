import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_cart = [
    {
      "name": "Collar minimalista",
      "picture": "imagenes/Productos/collar_minimalista.png",
      "precio": 110,
      "tamaño": "M",
      "color": "Grey",
      "cantidad": 1,
    },
    {
      "name": "Brazalete venado",
      "picture": "imagenes/Productos/brazalete_venado3.png",
      "precio": 120,
      "tamaño": "M",
      "color": "Grey",
      "cantidad": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_cart.length,
        itemBuilder: (context, index) {
          return new Single_cart_product(
            cart_prod_name: Products_on_cart[index]["name"],
            cart_prod_color: Products_on_cart[index]["color"],
            cart_prod_qty: Products_on_cart[index]["cantidad"],
            cart_prod_size: Products_on_cart[index]["tamaño"],
            cart_prod_price: Products_on_cart[index]["precio"],
            cart_prod_pic: Products_on_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_pic;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product(
      {this.cart_prod_name,
      this.cart_prod_pic,
      this.cart_prod_price,
      this.cart_prod_size,
      this.cart_prod_color,
      this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(
          cart_prod_pic,
          width: 60.0,
          height: 60.0,
        ),
        title: new Text(cart_prod_name),
//        imagenes

        subtitle: new Column(
          children: <Widget>[
            //row adentro de un column
            new Row(
              children: <Widget>[
                //Tamaño de los productos carrito
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Tamaño:"),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                  child: new Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
//              Color de los objetos carrito
                new Padding(
                  padding: const EdgeInsets.fromLTRB(.0, 8.0, 2.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: new Text(cart_prod_color,
                      style: TextStyle(color: Colors.red)),
                ),
                new Column(


                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                       child:  IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
                     ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    child: new Text("$cart_prod_qty"),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      child: IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
                    ),

                  ],
                )
              ],
            ),
//            precio del producto
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price}",
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ],
        ),







      ),
    );
  }
}
