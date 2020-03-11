import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:proyecto_tienda/core/productoModel.dart';
import 'package:proyecto_tienda/home.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture, Product product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(

        backgroundColor: Color.fromRGBO(213, 82, 82, 1),
        title: InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));},
            child: Text('Red Casttle')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(
                     widget.product_detail_picture,),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_old_price}",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      )),
                      Expanded(
                          child: new Text(
                        "\$${widget.product_detail_new_price}",
                        style: TextStyle(color: Color.fromRGBO(213, 82, 82, 1)),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          //Primeros botones
          Row(
            children: <Widget>[
              //Boton tamaño
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                    builder: (context){
                      return new AlertDialog(
                        title: new Text("Size"),
                        content: new Text("Escoge el tamaño"),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context );
                          },
                          child: new Text("close"),)
                        ],
                      );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Size")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              //Boton lateral
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context ){
                          return new AlertDialog(
                            title: new Text("Color"),
                            content: new Text("Escoge el color"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context );
                              },
                                child: new Text("close"),)
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Color")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),

              //Boton lateral
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(context: context,
                        builder: (context ){
                          return new AlertDialog(
                            title: new Text("Cantidad"),
                            content: new Text("Escoge la cantidad"),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context );
                              },
                                child: new Text("close"),)
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Canti")),
                      Expanded(child: new Icon(Icons.arrow_drop_down)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              //Boton lateral
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Comprar ahora")),
                    ],
                  ),
                ),
              ),
              new IconButton(icon: Icon(Icons.add_shopping_cart),color: Colors.red, onPressed: (){}),
              new IconButton(icon: Icon(Icons.favorite_border),color: Colors.red, onPressed: (){})
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Detalles del producto"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text("Nombre del producto", style: TextStyle(color: Colors.grey),),),
              Padding(padding: EdgeInsets.all(5.0),
              child: new Text(widget.product_detail_name),),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Marca del producto", style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Marca x"),)
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Condición del producto", style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                child: new Text("Nuevo"),)
            ],
          ),
        
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Productos similares",style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          //Similar products section
          new Container(
            height: 340.0,
            child: Similar_products(),
          )
        ],
      ),
    );
  }
}
class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {


  var product_list = [
    {
      "name": "Collar minimalista",
      "picture": "imagenes/Productos/collar_minimalista.png",
      "old_precio": 120,
      "precio": 100,
    },
    {
      "name": "Brazalete venado",
      "picture": "imagenes/Productos/brazalete_venado3.png",
      "old_precio": 120,
      "precio": 100,
    },
    {
      "name": "Aretes huella perro",
      "picture": "imagenes/Productos/aretes_huella_perro.png",
      "old_precio": 100,
      "precio": 85,
    },
    {
      "name": "Collar huella perro",
      "picture": "imagenes/Productos/collar_huella_perro2.png",
      "old_precio": 100,
      "precio": 85,
    },


  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_single_prod(
            prod_name: product_list[index]['name'],
            prod_pic: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_precio'],
            prod_price: product_list[index]['precio'],
          );
        });
  }
}

class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_pic;
  final prod_old_price;
  final prod_price;

  Similar_single_prod(
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

