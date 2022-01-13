import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
              ? Text(snapshot.data!.nombre)
              : usuarioService.existeUsuario 
                ? Text(usuarioService.usuario!.nombre)
                : const Text('Página 2');
          },
        ),
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
                  final nuevoUsuario = Usuario(nombre: 'Gabriel', edad: 22);
                  usuarioService.cargarUsuario(nuevoUsuario);
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

                }
              ),
            ],
          ),
        ),
      ),
   );
  }
}