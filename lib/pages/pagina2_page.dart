import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioCubit =  context.read<UsuarioCubit>(); 

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
                  final Usuario usuario = Usuario(
                    nombre: "Gabriel",
                    edad: 20,
                    profesiones: ['Developer', 'Ingeniero'] 
                  );
                  usuarioCubit.seleccionarUsuario(usuario);
                }
              ),
              MaterialButton(
                child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  usuarioCubit.cambiarEdad(30);
                }
              ),
              MaterialButton(
                child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  usuarioCubit.agregarProfesion();
                }
              ),
            ],
          ),
        ),
      ),
   );
  }
}