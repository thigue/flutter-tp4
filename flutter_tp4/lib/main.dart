//THIAGO GUERRA SOARES
import 'package:flutter/material.dart';

void main() => runApp(const AplicativoTurismo());

class AplicativoTurismo extends StatelessWidget {
  const AplicativoTurismo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roteiro da Baixada',
      debugShowCheckedModeBanner: false,
      home: const Principal(),
    );
  }
}

class PontoTuristico {
  PontoTuristico(this.nome, this.cidade, this.descricao, this.imagem);
  final String nome;
  final String cidade;
  final String descricao;
  final String imagem;
  bool favorito = false;
  bool visitado = false;
}

class Principal extends StatefulWidget {
  //THIAGO GUERRA SOARES
  const Principal({super.key});
  static const nomeAluno = 'THIAGO GUERRA SOARES';

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Principal.nomeAluno, style: TextStyle(fontSize: 18)),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Pontos turísticos da Baixada Santista',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 8),
              Text(
                'Conheça os pontos turísticos da nossa região.',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
