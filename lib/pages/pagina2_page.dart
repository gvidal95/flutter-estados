import 'package:estados/bloc/user/user_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Página 2'),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  final newUser = Usuario(nombre: 'Gabriel', edad: 33, profesiones: ['full Stack developer']);
                  userBloc.add(ActivateUser(newUser));
                }
              ),
              MaterialButton(
                child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  userBloc.add(ChangeUserAge(20));      
                }
              ),
              MaterialButton(
                child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  userBloc.add(AddProfesion('Profesion'));      
                }
              ),
            ],
          ),
        ),
      ),
   );
  }
}