import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyecto_tienda/db/auth.dart';
import 'package:proyecto_tienda/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_tienda/pages/login.dart';
import 'package:proyecto_tienda/provider/user_provider.dart';
import '../db/users.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _direccionController = TextEditingController();
  TextEditingController _fechanacController = TextEditingController();
  TextEditingController _telefonoController = TextEditingController();
  TextEditingController _ciudadController = TextEditingController();
  TextEditingController _paisController = TextEditingController();
  TextEditingController _cpController = TextEditingController();
  String nombreUser;
  String ciudadUser;
  String paisUser;
  String cpUser;
  String direcUser;
  String fechanacUser;
  String celularUser;
  String error = '';
  String email;
  String password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool hidePass = true;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'imagenes/Fondito.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'imagenes/Logo_trans.png',
                width: 280.0,
                height: 240.0,
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Form(
                    key: _formKey,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _nameTextController,
                                decoration: InputDecoration(
                                    hintText: "Nombre Completo",
                                    icon: Icon(Icons.person_outline),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "El nombre no puede ir vacio";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _emailTextController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    icon: Icon(Icons.alternate_email),
                                    border: InputBorder.none),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'El correo no puede ir vacio';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _passwordTextController,
                                  obscureText: hidePass,
                                  decoration: InputDecoration(
                                      hintText: "Contraseña",
                                      icon: Icon(Icons.lock_outline),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "La contraseña no puede ir vacia";
                                    } else if (value.length < 6) {
                                      return "the password has to be at least 6 characters long";
                                    }
                                    return null;
                                  },
                                ),
                                trailing: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      setState(() {
                                        hidePass = false;
                                      });
                                    }),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _direccionController,
                                  decoration: InputDecoration(
                                      hintText: "Dirección",
                                      icon: Icon(Icons.home),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "La dirección no puede ir vacia";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _fechanacController,
                                  keyboardType: TextInputType.datetime,
                                  decoration: InputDecoration(
                                      hintText: "Fecha de nacimiento",
                                      icon: Icon(Icons.calendar_today),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "La fecha de naciemiento no puede ir vacia";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _telefonoController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      hintText: "Celular",
                                      icon: Icon(Icons.phone_iphone),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "El celular no puede ir vacio";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ), Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _ciudadController,

                                  decoration: InputDecoration(
                                      hintText: "Ciudad",
                                      icon: Icon(Icons.location_city),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "La ciudad no puede ir vacio";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _paisController,

                                  decoration: InputDecoration(
                                      hintText: "País",
                                      icon: Icon(Icons.location_city),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "El país no puede ir vacio";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: _cpController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: "Código Postal",
                                      icon: Icon(Icons.keyboard),
                                      border: InputBorder.none),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return "El código postal no puede ir vacio";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.shade700,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: () async {validateForm();},
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Registrar cuenta",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.blue),
                                ))),
                      ],
                    )),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future validateForm() async {
    FormState formState = _formKey.currentState;
    email = _emailTextController.text.trim();
    password = _passwordTextController.text.trim();
    String nameuser = _nameTextController.text;
    String direcuser = _emailTextController.text;
    String fechanacimiento = _fechanacController.text;
    String telefonouser = _telefonoController.text;
    String ciudaduser = _ciudadController.text;
    String paisuser = _paisController.text;
    String cpuser = _cpController.text;



    if (formState.validate()) {
      formState.reset();
      FirebaseUser user = await _auth.currentUser();
      if (user == null) {
        FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((currentUser)=>Firestore.instance.collection("users").document(user.uid).setData({
                    "nombre": nameuser,
                     "correo": email,
                    "contraseña": password,
                     "dorección": direcuser,
                     "fechanac": fechanacimiento,
                     "celular": telefonouser,
                     "ciudad": ciudaduser,
                     "pais":  paisuser,
                     "codigopost":  cpuser,
                      "id":user.uid
        })).catchError((err) => {print(err.toString())});

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      }
    }
  }
        //        _auth.createUserWithEmailAndPassword(email: email, password: password).then((user) =>
//        {
//                  UserServices().uploadUsers
//                    (
//                      nombreUser: nameuser,
//                      emailUser: email,
//                      passUser: password,
//                      direcUser: direcuser,
//                      fechanac: fechanacimiento,
//                      celularUser: telefonouser,
//                      ciudadUser: ciudaduser,
//                      pasiUser:  paisuser,
//                      cpUser:  cpuser
//
//                  )
//        })


  Future registrar() async {
    email = _emailTextController.text.trim();
    password = _passwordTextController.text;
    nombreUser = _nameTextController.text;
    direcUser = _direccionController.text;
    fechanacUser= _fechanacController.text;
    celularUser = _telefonoController.text;
    ciudadUser = _ciudadController.text;
    paisUser = _paisController.text;
    cpUser = _cpController.text;
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      dynamic result = await registerWithEmailAndPassword(
          email, password);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      if (result == null) {
        Fluttertoast.showToast(msg: 'No se pudo iniciar con esas credenciales');
      }
      formState.reset();
    }
  }
  Future registerWithEmailAndPassword(String email, String password) async{
    try{

      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid).updateUSersData(nombreUser, email, password, direcUser, fechanacUser, celularUser, paisUser, ciudadUser, cpUser);

      return _user(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }
  User _user(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }
}
