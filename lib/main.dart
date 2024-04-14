import 'package:barberias/usuario/bloc/bloc_usuario.dart';
import 'package:barberias/usuario/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SignInScreen(),
          theme: ThemeData(
              scaffoldBackgroundColor: Color(0xffdbdbdb)
          ),
        ),
        bloc: UsuarioBloc());
  }
}

