import 'package:barberias/curved_navigation_bar.dart';
import 'package:barberias/usuario/bloc/bloc_usuario.dart';
import 'package:barberias/usuario/model/user.dart';
import 'package:barberias/usuario/ui/widgets/gradient_back_login.dart';
import 'package:barberias/usuario/ui/widgets/subtitulo_login.dart';
import 'package:barberias/usuario/ui/widgets/titulo_login.dart';
import 'package:barberias/widgets/button_general.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }
}

class _SignInScreen extends State<SignInScreen>{
  UsuarioBloc usuarioBloc;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    usuarioBloc = BlocProvider.of(context); //aqui estoy instanciando el objeto user, para poder usarlo
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: usuarioBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot- data - Object User
        if(!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return BottomNavBar();
        }
      },
    );

  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GradientBackLogin(null, "assets/images/fondo_loginDos.jpg"),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                SizedBox(
                  height: MediaQuery.of(context).size.height/3,
                  child: Column(
                    children: <Widget>[
                      TituloLogin("Bienvenido"),
                      SubTituloLogin("¿Q U I E R E S   V E R T E   B I E N?"),
                    ],
                  ),
                ),

                FittedBox(
                  child: Text(
                    "Reserva tu próxima cita",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: "Lato",
                      color: Color(0xffdbdbdb),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                ButtonGeneral(
                  width: screenWidth,
                  height: 50.0,
                  text: "Ingresa con gmail",
                  icon: "G",
                  onPressed: (){
                    usuarioBloc.signOut(); // esto es para forzar el cierre de sesion del usuario
                    usuarioBloc.signIn().then((FirebaseUser user) {
                      usuarioBloc.updateUserData(User(
                          uid: user.uid,
                          name: user.displayName,
                          email: user.email,
                          photoURL: user.photoUrl
                      ));
                    });
                  },
                ),
                SizedBox(height: 25,),

                Padding(
                  padding: EdgeInsets.only(right: 60, left: 60, bottom: 10,top: 30),
                  child: FittedBox(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Powered by Bimba Digital",
                      style: TextStyle(
                          color: Color(0xffdbdbdb),
                          fontSize: 12,
                          fontFamily: "Lato"),
                    ),
                  ),
                )

              ],
            )
          ],
      ),
    );
  }
}