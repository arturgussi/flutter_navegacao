import 'package:flutter/material.dart';
import 'dart:convert';

import '../app_bar/app_bar.dart';
import '../detalhes/detalhes.dart';
import '../../modelos/receita.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
      body: _construirListaCard(),
      appBar: const ApplicationToolbar(),
    );
  }

  Widget _construirListaCard() {
    return FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/receitas.json'),
        builder: (context, snapshot) {
          List<dynamic> receitas = json.decode(snapshot.data.toString());

          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                Receita receita = Receita.fromJson(receitas[index]);

                return _construirCard(receita);
              },
              itemCount: receitas.length);
        });
  }

  Widget _construirCard(receita) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Detalhes(key: Key(receita.titulo), receita: receita)));
      },
      child: SizedBox(
          height: 300,
          child: Center(
            child: Card(
                margin: const EdgeInsets.all(16),
                child: Column(children: <Widget>[
                  Stack(
                    children: [
                      _construirImagem(receita.foto),
                      _construirGradienteCard(),
                      _construirTextoCard(receita.titulo),
                    ],
                  )
                ])),
          )),
    );
  }

  Widget _construirGradienteCard() {
    return Container(
      height: 268,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
            Colors.transparent,
            Colors.deepOrange.withOpacity(0.7)
          ])),
    );
  }

  Widget _construirTextoCard(texto) {
    return Positioned(
        bottom: 10,
        left: 10,
        child: Text(texto,
            style: const TextStyle(fontSize: 20, color: Colors.white)));
  }

  Widget _construirImagem(imagem) {
    return Image.asset(
      imagem,
      fit: BoxFit.fill,
      height: 268,
    );
  }
}
