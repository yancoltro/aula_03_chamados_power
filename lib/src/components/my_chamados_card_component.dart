import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/chamado_model.dart';

class MyChamadoCard extends StatelessWidget {
  late Chamado chamado;
  late void Function() onLongPress;
  late void Function() onDoubleTap;

  MyChamadoCard(
      {required this.chamado,
      required this.onLongPress,
      required this.onDoubleTap});

  @override
  Widget build(BuildContext context) {
    late IconData iconType = Icons.device_unknown;
    late Color? colorType = chamado.importante != null && chamado.importante!
        ? chamado.concluido != null && chamado.concluido
            ? Colors.grey
            : Colors.red
        : chamado.concluido != null && chamado.concluido
            ? Colors.grey
            : Colors.blue;

    if (chamado.tipo == 'Concerto') {
      iconType = Icons.build;
    } else if (chamado.tipo == 'Manutenção') {
      iconType = Icons.manage_history_outlined;
    } else if (chamado.tipo == 'Instalação') {
      iconType = Icons.install_desktop;
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onDoubleTap: onDoubleTap,
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Deseja remover?"),
                  content: Text("Content"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancelar")),
                    TextButton(
                        onPressed: () {
                          onLongPress.call();
                          Navigator.of(context).pop();
                        },
                        child: Text("Ok"))
                  ],
                );
              });
        },
        child: Card(
            elevation: 10,
            shadowColor: Colors.grey[300],
            color: colorType,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: chamado.concluido
                      ? Icon(Icons.check_circle, color: Colors.green, size: 55)
                      : Icon(Icons.notification_important,
                          color: Colors.yellow, size: 55),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(iconType, size: 25,),
                      ),
                      Text(
                        chamado.tipo.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                     
                      Text(chamado.nome.toString()),
                      Text(chamado.descricao.toString()),
                      Text(
                          '${chamado.dia!.day}/${chamado.dia!.month}/${chamado.dia!.year}/'),
                      Text('${chamado.hora!.hour}:${chamado.hora!.minute}'),
                      Text('${chamado.duracao} minutos'),
                      Text('Não esqueça de levar', style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('${chamado.materiais.toString()}', style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
