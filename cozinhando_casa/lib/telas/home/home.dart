import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _construirHome();
  }

  Widget _construirHome() {
    return Scaffold(
      body: _construirCard(),
      appBar: ApplicationToolbar(),
    );
  }

  Widget _construirCard() {
    return SizedBox(
        height: 300,
        child: Center(
          child: Card(
              margin: const EdgeInsets.all(16),
              child: Column(children: <Widget>[
                Stack(
                  children: [
                    _construirImagem(),
                    _construirTextCard(),
                  ],
                )
              ])),
        ));
  }

  Widget _construirTextCard() {
    return const Positioned(
        bottom: 10,
        left: 10,
        child: Card(
            margin: EdgeInsets.all(0),
            color: Colors.white,
            child: Text('Bolo de Laranja', style: TextStyle(fontSize: 20))));
  }

  Widget _construirImagem() {
    return Image.network(
      'https://t1.gstatic.com/licensed-image?q=tbn:ANd9GcR8C8noXy-gngMs_Kyw1_Nrqj5LaTElvn6lpwAj47fLPmdpPyagoZkpYZCLAs0riqs1',
      fit: BoxFit.fill,
      height: 268,
    );
  }
}

class ApplicationToolbar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: const Text('Cozinhando em Casa'));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
