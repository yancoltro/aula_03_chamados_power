import 'package:aula03_chamados_power/src/controller/chamado_controller.dart';
import 'package:aula03_chamados_power/src/models/chamado_model.dart';
import 'package:aula03_chamados_power/src/controller/chamados_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_menu_component.dart';

class CadastroView extends StatelessWidget {
  static const List<String> materiais = [
    'Notebook',
    'HD',
    'Crimpador',
    'Multímetro'
  ];

  static const List<String> tipo = ['Concerto', 'Manutenção', 'Instalação'];

    final textFieldNomeController = TextEditingController();
    final textFieldDescricaoController = TextEditingController();
    final textFieldDuracaoController = TextEditingController();
 
 
  void clearText() {
    textFieldNomeController.clear();
    textFieldDescricaoController.clear();
    textFieldDuracaoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Chamados"),
        actions: [MyMenu()],
      ),
      body: Consumer<ChamadoController>(builder: (context, chamado, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: textFieldNomeController,
                  decoration: InputDecoration(
                      hintText: "Insira o nome do chamado",
                      label: Text("Nome")),
                  onChanged: (_nome) {
                    chamado.nome = _nome;
                  },
                ),
                TextField(
                  controller: textFieldDescricaoController,
                  minLines: 3,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: "Insira a descrição do chamado",
                      label: Text("Descrição")),
                  onChanged: (_descricao) {
                    chamado.descricao = _descricao;
                  },
                ),
                Text(
                  "Horários",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        child: Text("Data do Chamado"),
                        onPressed: () async {
                          DateTime? dia = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (dia != null) {
                            chamado.dia = dia;
                          }
                        }),
                  ),
                  Text(
                    (chamado.dia == null)
                        ? 'O chamado não tem data'
                        : '${chamado.dia?.day}-${chamado.dia?.month}-${chamado.dia?.year}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ]),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          child: Text("Hora da Chamado"),
                          onPressed: () async {
                            TimeOfDay? _hora = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (_hora != null) {
                              chamado.hora = _hora;
                            }
                          }),
                    ),
                    Text(
                      (chamado.hora == null)
                          ? 'O chamado não tem hora'
                          : '${chamado.hora?.hour}:${chamado.hora?.minute}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        children: [
                          Text(
                            "Materiais",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                              children: materiais
                                  .map(
                                    (material) => Row(
                                      children: [
                                        Checkbox(
                                          value: chamado.materiais
                                              ?.contains(material.toString()),
                                          onChanged: (value) {
                                            chamado.onChangeMateriais =
                                                material.toString();
                                          },
                                        ),
                                        Text(material)
                                      ],
                                    ),
                                  )
                                  .toList()),
                          Text(
                            '${chamado.materiais.toString()}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      // alignment: AlignmentDirectional.topStart,
                      child: Column(
                        children: [
                          Text(
                            "Tipo",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30),
                            child: DropdownButton<String>(
                                isExpanded: true,
                                value: chamado.tipo,
                                items: tipo.map((e) {
                                  return DropdownMenuItem<String>(
                                    child: Text(e),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (_tipo) {
                                  chamado.tipo = _tipo;
                                }),
                          ),
                          Row(children: [
                            Text("Importante: "),
                            Switch(
                                value: chamado.importante ?? false,
                                onChanged: (_importante) {
                                  chamado.importante = _importante;
                                }),
                          ]),
                          Row(
                            children: [
                              Text("Duração: "),
                              Container(
                                width: 90,
                                child: TextField(
                                  controller: textFieldDuracaoController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (duracao) {
                                    double? _duracao = double.tryParse(duracao);
                                    if (_duracao != null) {
                                      chamado.duracao = _duracao;
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ElevatedButton(child: Text("Cadastrar"), onPressed: (){
                  Provider.of<ChamadosController>(context,listen: false).add = chamado.getChamado;
                  chamado.renew();
                  clearText();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Chamado cadastrado com sucesso"))
                  );
                }),
              ],
            ),
          ),
        );
      }),
    );
  }
}
