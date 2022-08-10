import 'package:aula03_chamados_power/src/components/my_chamados_card_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/chamados_controller.dart';

class ChamadosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
        appBar: AppBar(
          title: Text("Listagem de chamados"),
        ),
        body: Consumer<ChamadosController>(builder: (context, chamados, child) {
          return SingleChildScrollView(
            child: Column(
              children: 
               chamados.chamados!
                  .map((chamado) => MyChamadoCard(chamado: chamado, onLongPress: () { chamados.remove(chamado); }, onDoubleTap: (){chamados.toggleConcluido(chamado);},))
                  .toList(),
            ),
          );
        }));
  }
}
