import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    // print(Get.arguments['nombre']);

    final usuarioCtrl = Get.find<UsuarioController>();

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
                  usuarioCtrl.cargarUsuario(Usuario(nombre: 'Gabriel', edad: 25));
                  Get.snackbar(
                    'Usuario Establecido', 
                    'Nuevo usuario establecido correctamente', 
                    backgroundColor: Colors.white,
                    boxShadows: const [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 10
                      )
                    ] 
                  );
                }
              ),
              MaterialButton(
                child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  usuarioCtrl.cambiarEdad(30);
                }
              ),
              MaterialButton(
                child: const Text('Añadir Profesión', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  usuarioCtrl.agregarProfesion('Profesión #${usuarioCtrl.profesionesCount + 1}');
                }
              ),
              MaterialButton(
                child: const Text('Cambiar Tema', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){
                  Get.changeTheme( Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                }
              ),
            ],
          ),
        ),
      ),
   );
  }
}