import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';


class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final usuarioCtrl = Get.put( UsuarioController() );

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Obx(() => usuarioCtrl.existeUsuario.value
        ? InformacionUsuario(usuario: usuarioCtrl.usuario.value,)
        : const NoInfo()
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.accessibility_new),
        // onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        // onPressed: () => Get.to(Pagina2Page()),
        onPressed: () => Get.toNamed('pagina2', arguments: {
          'nombre': 'Gabriel',
          'edad' : 23
        }),
      )
   );
  }
}

class NoInfo extends StatelessWidget {
  const NoInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  Text('No hay usuario seleccionado'),
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario({
    Key? key, required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
            const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ListTile( title: Text('Nombre: ${usuario.nombre}',)),
            ListTile( title: Text('Edad: ${usuario.edad}',)),

            const Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Divider(),
            ...usuario.profesiones.map((profesion) => ListTile(title: Text(profesion),)).toList()
        ],
      ),
    );
  }
}