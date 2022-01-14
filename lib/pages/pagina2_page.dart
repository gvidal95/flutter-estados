import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(usuarioService.existeUsuario ? usuarioService.usuario!.nombre : 'Página 2'),
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
                  usuarioService.usuario = Usuario(
                    nombre: 'Gabriel', 
                    edad: 20,
                    profesiones: ['Developer', 'Ingeniero']
                  );

                }
              ),
              MaterialButton(
                child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                   usuarioService.cambiarEdad(25);
                }
              ),
              MaterialButton(
                child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                    usuarioService.agregarProfesion();
                }
              ),
            ],
          ),
        ),
      ),
   );
  }
}