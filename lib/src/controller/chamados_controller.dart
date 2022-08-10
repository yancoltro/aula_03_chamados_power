import 'package:aula03_chamados_power/src/models/chamado_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChamadosController extends ChangeNotifier{


  List<Chamado>? _chamados = [];  

  ChamadosController(){
    Chamado chamado = Chamado();
    chamado.nome = "Troca de monitor";
    chamado.descricao = "Monitor está piscando quando liga";
    chamado.dia = DateTime.now();
    chamado.hora = TimeOfDay.now();
    chamado.duracao = 10.0;
    chamado.importante = true;
    chamado.tipo = "Concerto";
    chamado.concluido = false;
    chamado.materiais = <String>['Notebook'];

    _chamados?.add(chamado);
  }

  void set add(Chamado chamado){
    Chamado _chamado = chamado;
    _chamados?.add(_chamado);
    notifyListeners();
  }

  void remove(Chamado chamado){
    _chamados?.remove(chamado);
    notifyListeners();
  }

  void toggleConcluido(Chamado chamado){
    chamado.concluido = !chamado.concluido;
    notifyListeners();
  }

  List<Chamado>? get chamados => _chamados;

}