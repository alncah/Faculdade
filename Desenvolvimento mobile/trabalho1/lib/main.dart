import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'trabalho1',
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  final List<String> opcoes = ["pedra", "papel", "tesoura"];

  TelaInicial({super.key});

  void jogar(BuildContext context, String escolhaUsuario) {
    final escolhaApp = opcoes[Random().nextInt(3)];

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadoPage(
          escolhaUsuario: escolhaUsuario,
          escolhaApp: escolhaApp,
        ),
      ),
    );
  }

  Widget botaoEscolha(BuildContext context, String nomeImagem,
      {double size = 90}) {
    return GestureDetector(
      onTap: () => jogar(context, nomeImagem),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Image.asset("assets/$nomeImagem.png", width: size, height: size),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: AppBar(
        title: const Text(
          "Pedra, Papel, Tesoura",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Image.asset("assets/padrao.png", width: 140, height: 140),
          const SizedBox(height: 10),
          const Text(
            "Escolha do APP",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  botaoEscolha(context, "pedra"),
                  const SizedBox(width: 20),
                  botaoEscolha(context, "papel"),
                  const SizedBox(width: 20),
                  botaoEscolha(context, "tesoura"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class ResultadoPage extends StatelessWidget {
  final String escolhaUsuario;
  final String escolhaApp;

  const ResultadoPage({
    super.key,
    required this.escolhaUsuario,
    required this.escolhaApp,
  });

  String resultadoTexto() {
    if (escolhaUsuario == escolhaApp) return "Empate!";
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      return "Você venceu!";
    }
    return "Você perdeu!";
  }

  String imagemResultado() {
    if (escolhaUsuario == escolhaApp) return "empate.png";
    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      return "ganhou.png";
    }
    return "perdeu.png";
  }

  Widget mostrarEscolha(String titulo, String imagem) {
    return Column(
      children: [
        Image.asset(
          "assets/$imagem.png",
          width: 120,
        ),
        const SizedBox(height: 10),
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: AppBar(
        title: const Text(
          "Pedra,Papel, Tesoura",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mostrarEscolha("Escolha do APP", escolhaApp),

            const SizedBox(height: 50),

            mostrarEscolha("Sua Escolha", escolhaUsuario),

            const SizedBox(height: 40),

            // 🔥 AQUI ESTÁ A SOLUÇÃO 1
            SizedBox(
              width: 130,
              height: 130,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset("assets/${imagemResultado()}"),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              resultadoTexto(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                minimumSize: const Size(220, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Jogar novamente",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
