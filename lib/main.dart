import 'package:flutter/material.dart';
import 'package:proyecto_tienda/db/auth.dart';
import 'home.dart';
import 'package:proyecto_tienda/pages/login.dart';
import 'package:carousel_pro/carousel_pro.dart';
void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(213, 82, 82, 1),
        ),
        home: Login()
      ),
  );
}




