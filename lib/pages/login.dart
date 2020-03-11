import 'package:flutter/material.dart';
import 'package:proyecto_tienda/db/auth.dart';
import 'package:proyecto_tienda/db/users.dart';
import 'package:proyecto_tienda/pages/registrar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto_tienda/home.dart';


class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  TextEditingController _emailTextontroller = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;
  bool sesioniniciada = false;
  String email;
  String password;
  UserServices _userServices = UserServices();



  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    await firebaseAuth.currentUser().then((user){
      if(user != null){
        setState(()=>isLogedin = true);
      }
    });

    preferences = await SharedPreferences.getInstance();
    isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'imagenes/Fondito.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'imagenes/Logo_trans.png',
              width: 150.0,
              height: 150,
            ),
            color: Colors.grey.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Center(
              child: Form(
                  key: formkey,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(

                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),

                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextontroller,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
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
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: _passwordTextController,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                icon: Icon(Icons.lock),
                                border: InputBorder.none,
                              ),
                              validator: (value) {
                                if (value.isNotEmpty) {
                                  return "LA contraseña no puede ir vacia";
                                } else if (value.length < 6) {
                                  return "la contraseña no puede ser menor a 8 caracteres";
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
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromRGBO(213, 82, 82, 1).withOpacity(0.8),
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {
                              ValidateAndSubmit();
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,

                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(12.0, 5.0, 8.0, 0.0),
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                            },
                            child: Text("Registrate!",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red),)),
                      ),



                    ],
                  )),
            ),
          ),
          Visibility(
              visible: loading ?? true,
              child: Container(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.7),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
              ))
        ],

      ),

    );
  }



  void ValidateAndSubmit() async{
    try{

  FirebaseUser user = ( await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextontroller.text, password: _passwordTextController.text)).user;
      Fluttertoast.showToast(msg: 'Bienvenido:${_emailTextontroller.text}');

      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
      }
    catch(e){
      print('Error: $e');
    }
  }
  Future registrar() async{
    FormState formState = formkey.currentState;
    if (formState.validate()) {
      dynamic result = await _userServices.registerWithEmailAndPassword(email, password);
      if(result==null){
        Fluttertoast.showToast(msg: 'No se pudo iniciar con esas credenciales');

      }
      formState.reset();
    }
  }


}
