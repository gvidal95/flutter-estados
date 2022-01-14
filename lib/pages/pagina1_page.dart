import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(), 
            icon: const Icon(Icons.exit_to_app)
          )
        ]
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      )
   );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: ( _ , state) { 
        print(state);

        //Preguntar si state es instancia de Usuario Inicial
        switch (state.runtimeType) {
          case UsuarioInitial: 
            return const Center(child: Text('No hay información del usuario'),);

          case UsuarioActivo: 
            return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);

          default:
            return Container();
        }

        //Preguntar si state es instancia de Usuario Inicial
        // if(state is UsuarioInitial){
        //   return const Center(
        //     child: Text('No hay información del usuario'),
        //   );
        // }else if (state is UsuarioActivo){
        //   return InformacionUsuario(usuario: state.usuario);
        // }else{
        //   return Container();
        // }
      },
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

    final profesiones = (usuario.profesiones != null) ? usuario.profesiones : [];

    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),
            ListTile( title: Text('Nombre: ${usuario.nombre} ',)),
            ListTile( title: Text('Edad: ${usuario.edad}',)),

            Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Divider(),

            ...profesiones!.map((profesion) => ListTile( title: Text(profesion), )).toList()
        ],
      ),
    );
  }
}