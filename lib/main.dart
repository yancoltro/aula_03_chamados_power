// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:aula03_chamados_power/src/controller/chamado_controller.dart';
import 'package:aula03_chamados_power/src/models/chamado_model.dart';
import 'package:aula03_chamados_power/src/controller/chamados_controller.dart';
import 'package:aula03_chamados_power/src/views/cadastro_view.dart';
import 'package:aula03_chamados_power/src/views/chamados_view.dart';
import 'package:aula03_chamados_power/src/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ChamadoController()),
          ChangeNotifierProvider(create: (context) => ChamadosController())
        ],
        child: AppChamados()),
  );
}

class AppChamados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chamados",
      home: HomeView(),
      // initialRoute: "/home",
      routes: {
        "/home": (context) => HomeView(),
        "/cadastro": (context) => CadastroView(),
        "/chamados": (context) => ChamadosView()
      },
    );
  }
}
