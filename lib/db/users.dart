import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_tienda/db/auth.dart';
import 'package:proyecto_tienda/provider/user_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices{

  DatabaseService databaseService = DatabaseService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";
  final String uid;
  UserServices({ this.uid});
  Firestore _firestore = Firestore.instance;
  final CollectionReference usersCollection = Firestore.instance.collection('users');
  createUser(Map value){

    String id = value["UserId"];

    _database.reference().child(ref).child(id).set(
      value
    ).catchError((e) => {print(e.toString())});
  }
  User _user(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  void uploadUsers({
      String nombreUser ,
      String emailUser ,
      String passUser ,
      String direcUser ,
      String fechanac ,
      String celularUser,
      String ciudadUser,
      String pasiUser,
      String cpUser
  }) {

    _firestore.collection(ref).document(uid).setData({
      'nombre': nombreUser,
      'corre': emailUser,
      'contraseña': passUser,
      'dirección': direcUser,
      'fechanac': fechanac,
      'id': uid,
      'celular': celularUser,
      'Ciudad': ciudadUser,
      'Pais': pasiUser,
      'CodigoPostal': cpUser
    });
  }
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

  Future registerWithEmailAndPassword(String email, String password) async{
    try{

      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;



      return _user(user);
} catch(e){
      print(e.toString());
      return null;
    }
  }


}