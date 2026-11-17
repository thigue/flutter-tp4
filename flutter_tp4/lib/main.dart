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
  final List<PontoTuristico> _pontos = [
    PontoTuristico(
      'Monte Serrat',
      'Santos',
      'Mirante com vista panorâmica de Santos, acessível pelo bondinho ou pela escadaria. No alto fica o Santuário de Nossa Senhora do Monte Serrat.',
      'assets/imagens/monte_serrat.jpg',
    ),
    PontoTuristico(
      'Museu do Café',
      'Santos',
      'Localizado na antiga Bolsa Oficial de Café, no Centro Histórico de Santos, apresenta a história do café e sua importância para o Brasil.',
      'assets/imagens/museu_do_cafe.jpg',
    ),
    PontoTuristico(
      'Portinho Ézio Dall’Acqua',
      'Praia Grande',
      'Área de lazer às margens do Mar Pequeno, com píer e espaços para passeios em família. É um dos locais tradicionais de Praia Grande.',
      'assets/imagens/portinho.jpg',
    ),
    PontoTuristico(
      'Emissário Submarino de Santos',
      'Santos',
      'Localizado na praia do José Menino, tem uma área de lazer sobre o emissário, com vista para o mar e a escultura de Tomie Ohtake.',
      'assets/imagens/emissario.jpg',
    ),
    PontoTuristico(
      'Aquário Municipal de Santos',
      'Santos',
      'Localizado na Ponta da Praia, reúne animais aquáticos e permite conhecer mais sobre a vida marinha.',
      'assets/imagens/aquario.jpg',
    ),
    PontoTuristico(
      'Praia de Pitangueiras',
      'Guarujá',
      'Praia na região central do Guarujá, conhecida pela faixa de areia, pelo movimento na orla e pela proximidade de lojas e restaurantes.',
      'assets/imagens/pitangueiras.jpg',
    ),
    PontoTuristico(
      'Cama de Anchieta',
      'Itanhaém',
      'Formação rochosa à beira-mar associada às histórias sobre o padre José de Anchieta, em um cenário de costões e ondas.',
      'assets/imagens/cama_de_anchieta.jpg',
    ),
    PontoTuristico(
      'Ilha Porchat',
      'São Vicente',
      'Um dos cartões-postais de São Vicente, com vista para as praias da região e o Monumento dos 500 Anos do Brasil, projetado por Oscar Niemeyer.',
      'assets/imagens/ilha_porchat.jpg',
    ),
  ];

  void _alterarFavorito(PontoTuristico ponto) {
    setState(() {
      ponto.favorito = !ponto.favorito;
    });
  }

  void _alterarVisitado(PontoTuristico ponto) {
    setState(() {
      ponto.visitado = !ponto.visitado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(Principal.nomeAluno, style: TextStyle(fontSize: 18)),
      ),
      body: Column(
        children: [
          _construirCabecalho(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _pontos.length,
              itemBuilder: (context, indice) {
                return _construirPonto(_pontos[indice]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirCabecalho() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: const Column(
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
    );
  }

  Widget _construirPonto(PontoTuristico ponto) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        children: [
          Image.asset(
            ponto.imagem,
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  ponto.nome,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on_outlined, size: 18),
                    const SizedBox(width: 4),
                    Text(ponto.cidade),
                  ],
                ),
                const SizedBox(height: 8),
                Text(ponto.descricao, textAlign: TextAlign.center),
                const SizedBox(height: 8),
                _construirMarcacoes(ponto),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirMarcacoes(PontoTuristico ponto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: ponto.favorito,
          onChanged: (valor) => _alterarFavorito(ponto),
        ),
        const Flexible(child: Text('Favorito', textAlign: TextAlign.center)),
        const SizedBox(width: 16),
        Checkbox(
          value: ponto.visitado,
          onChanged: (valor) => _alterarVisitado(ponto),
        ),
        const Flexible(child: Text('Visitado', textAlign: TextAlign.center)),
      ],
    );
  }
}
