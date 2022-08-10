import 'package:flutter/material.dart';

import '../models/chamado_model.dart';

class ChamadoController extends ChangeNotifier {
 
  Chamado _chamado = new Chamado();

  Chamado get getChamado => _chamado;

  void renew() {
    _chamado = new Chamado();
    notifyListeners();
  }

  void set nome(String? nome) {
    _chamado.nome = nome;
    notifyListeners();
  }

  void set descricao(String? descricao) {
    _chamado.descricao = descricao;
    notifyListeners();
  }

  void set dia(DateTime? dia) {
    _chamado.dia = dia;
    notifyListeners();
  }

  void set hora(TimeOfDay? hora) {
    _chamado.hora = hora;
    notifyListeners();
  }

  void set duracao(double? duracao) {
    _chamado.duracao = duracao;
    notifyListeners();
  }

  void set tipo(String? tipo) {
    _chamado.tipo = tipo;
    notifyListeners();
  }

  void set importante(bool? importante) {
    _chamado.importante = importante;
    notifyListeners();
  }

  void set concluido(bool concluido) {
    _chamado.concluido = concluido;
    notifyListeners();
  }

  void set onChangeMateriais(String material){
    if(_chamado.materiais!.contains(material)){
      _chamado.materiais?.remove(material);
    }else{
      _chamado.materiais?.add(material);
    }
    notifyListeners();
  }

  void set materiais(List<String>? materiais){
    _chamado.materiais?.addAll(materiais!);
    notifyListeners();
  }

  String? get nome => _chamado.nome;
  String? get descricao => _chamado.descricao;
  DateTime? get dia => _chamado.dia;
  TimeOfDay? get hora => _chamado.hora;
  double? get duracao => _chamado.duracao;
  String? get tipo => _chamado.tipo;
  bool? get importante => _chamado.importante;
  bool get concluido => _chamado.concluido;
  List<String>? get materiais => _chamado.materiais;
}
