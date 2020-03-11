import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class DatabaseService{
  String ref = "users";
  final String uid;
  DatabaseService({ this.uid});
  Firestore _firestore = Firestore.instance;
  final CollectionReference usersCollection = Firestore.instance.collection('users');



  Future updateUSersData(String nombreUser ,
      String emailUser ,
      String passUser ,
      String direcUser ,
      String fechanac ,
      String celularUser,
      String pais,
      String ciudad,
      String cp) async{
    return await  usersCollection.document(uid).setData({
      'nombre': nombreUser,
      'correo': emailUser,
      'contraseña': passUser,
      'direccion': direcUser,
      'fechanac': fechanac,
      'id': uid,
      'celular': celularUser,
      'pais': ciudad,
      'ciudad': ciudad,
      'codigopost': cp
    });

  }

}
