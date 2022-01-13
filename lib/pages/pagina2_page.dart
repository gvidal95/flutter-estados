import 'package:flutter/material.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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

                }
              ),
              MaterialButton(
                child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
                color: Colors.blue,
                onPressed: (){

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