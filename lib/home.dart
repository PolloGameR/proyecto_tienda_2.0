import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:proyecto_tienda/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import mios
import 'package:proyecto_tienda/componentes/Listview_horizontal.dart';
import 'package:proyecto_tienda/componentes/productos.dart';
import 'package:proyecto_tienda/pages/cart.dart';

//class HomePage extends StatelessWidget {
//  @override
// Widget build(BuildContext context) {
//    return Container(
//        color: Colors.deepPurple,
//        child: Text('Hola',style: TextStyle(color: Colors.white),)
//   );
//   }
//}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final Firestore _firestore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;


  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {

  Widget imag_carousel = new Container(
    height: 200.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('imagenes/Productos/collar_girasol_holandes.png'),
        AssetImage('imagenes/Productos/anillo_luna_luminosa2.png'),
        AssetImage('imagenes/Productos/brazalete_venado.png'),
        AssetImage('imagenes/Productos/pulsera_sistemasolar.png'),
        AssetImage('imagenes/Productos/collar_minimalista.png'),

      ],
      autoplay: false,
      //animationCurve: Curves.fastOutSlowIn,
      //animationDuration: Duration(microseconds: 1000),
      dotSize: 4.0,
      indicatorBgPadding: 6.0,
      dotBgColor: Colors.transparent,
    ),
  );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(213, 82, 82, 1),
        title: Text('Red Casttle'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //Header

            new UserAccountsDrawerHeader(
                accountName: Text("${user?.uid}"),
                accountEmail: Text("${user?.email}"),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundColor: Colors.grey,
                child: new Icon(Icons.person, color: Colors.white,),
              ),
            ),
            decoration: new BoxDecoration(
              color: Color.fromRGBO(213, 82, 82, 1)
            ),
            ),
            //Body

            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mi cuenta'),
                leading: Icon(Icons.person, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Mis ordenes'),
                leading: Icon(Icons.shopping_basket, color: Colors.red,),
              ),
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new Cart()));
              },
              child: ListTile(
                title: Text('Carrito de compra'),
                leading: Icon(Icons.shopping_cart, color: Colors.red,),

              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favoritos'),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ),

            Divider(),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Configuración'),
                leading: Icon(Icons.settings),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Acerca'),
                leading: Icon(Icons.help, color: Colors.blueAccent,),
              ),
            ),
            InkWell(
              onTap: (){
    FirebaseAuth.instance.signOut().then((value) {
      setState(() {

      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
              });
              },
              child: ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.phonelink_erase, color: Colors.redAccent,),
              ),
            )
          ],
        ),
      ),
      
      body: new Column(
        children: <Widget>[
          //carousel imagenes
          imag_carousel,
          //padding wirget
          new Padding(padding: const EdgeInsets.all(4.0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: new Text('Categorías')),),

          //lista horizontal, aqui empeiza wuuu
        listviewhorizontal(),
          //padding wirget
          Divider(),
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Productos')),),
          
          Flexible(child: Productos()),
          
          
        ],
      ),
    );
  }
}
