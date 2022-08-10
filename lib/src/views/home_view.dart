import 'package:aula03_chamados_power/src/components/my_menu_component.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Olá mundo - SI",
      home: Scaffold(
        appBar: AppBar(
          actions: [MyMenu()],
          title: Text("Cadastro de Chamados - Home"),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Column(
              children: [
                Text(
                  'Bem vindo',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Image.network(
                    'https://pasqualisolution.com.br/imagem/help-desk-infraestrutura.png',
                    height: 450),
                // Text(
                //   'Cadastro de Chamados',
                //   style: TextStyle(fontSize: 20, color: Colors.black38),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
