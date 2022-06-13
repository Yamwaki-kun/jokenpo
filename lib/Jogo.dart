import 'dart:math';

import 'package:flutter/material.dart';
class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _mensagem = "Escolha uma opção a baixo";
  var _imagemApp = AssetImage("Images/padrao.png");
  void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print(escolhaApp);
    _imagemApp = AssetImage("Images/"+opcoes[numero]+".png");

    if  ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ){
    _mensagem = "Voce ganhou! :)";
    }else if(
        (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra"))
    {
      _mensagem = "Voce perdeu! :(";
    }
    else{
      _mensagem = "Empate!!!";
    }

    setState((){});

  }
  void _reeet(){
    _imagemApp = AssetImage("Images/padrao.png");
    _mensagem = "Escolha uma opção a baixo";
    setState((){});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("JokenPo"),
    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 32,bottom: 16),
            child: Text("Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
          ),
          //imagem
          GestureDetector(
            onTap: () => _reeet(),
            child: Image(image: this._imagemApp,),
          ),

          //text resultado
          Padding(padding: EdgeInsets.only(top: 32,bottom: 16),
            child: Text(this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          //linha 3 imagens
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("Images/pedra.png", height: 100, )
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset("Images/papel.png", height: 100),
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset("Images/tesoura.png", height: 100),
              ),



              ],
            )
        ],
      ),
    );
  }
}
