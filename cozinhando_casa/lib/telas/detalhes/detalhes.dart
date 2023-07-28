import 'package:flutter/material.dart';

import '../app_bar/app_bar.dart';
import '../../modelos/receita.dart';

class Detalhes extends StatelessWidget {
  final Receita receita;

  Detalhes({required Key key, required this.receita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetalhes();
  }

  Widget _construirDetalhes() {
    return Scaffold(
      body: ListView(children: [
        _construirImagemDetalhes(receita.foto),
        _construirTituloDetalhes(receita.titulo),
        _construirLinhaIconesDetalhes(
            '${receita.porcoes} porções', receita.tempoPreparo),
        _construirSubtituloDetalhes('Ingredientes'),
        _construirTextoDetalhes(receita.ingredientes),
        _construirSubtituloDetalhes('Modo de Preparo'),
        _construirTextoDetalhes(receita.modoPreparo),
      ]),
      appBar: const ApplicationToolbar(),
    );
  }

  Widget _construirImagemDetalhes(imagem) {
    return Image.asset(imagem);
  }

  Widget _construirTituloDetalhes(titulo) {
    return Center(
        child: Text(
      titulo,
      style: TextStyle(color: Colors.deepOrange, fontSize: 30),
    ));
  }

  Widget _construirLinhaIconesDetalhes(rendimento, tempo_preparo) {
    return Row(
      children: <Widget>[
        _construirColunaDetalhes(Icons.restaurant, rendimento),
        _construirColunaDetalhes(Icons.timer, tempo_preparo),
      ],
    );
  }

  Widget _construirColunaDetalhes(icone, texto) {
    return Expanded(
        child: Column(children: <Widget>[
      Icon(icone, color: Colors.deepOrange),
      Text(
        texto,
        style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
      )
    ]));
  }

  Widget _construirSubtituloDetalhes(subtitulo) {
    return Center(
        child: Text(
      subtitulo,
      style: TextStyle(fontSize: 20),
    ));
  }

  Widget _construirTextoDetalhes(texto) {
    return Container(padding: EdgeInsets.all(16), child: Text(texto));
  }
}
