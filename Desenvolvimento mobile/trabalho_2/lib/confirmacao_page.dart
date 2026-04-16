import 'package:flutter/material.dart';

class ConfirmacaoPage extends StatelessWidget {
  final String nome;
  final String idade;
  final String email;
  final String sexo;
  final bool termos;

  ConfirmacaoPage({
    required this.nome,
    required this.idade,
    required this.email,
    required this.sexo,
    required this.termos,
  });

  Widget linha(String label, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text("$label: $valor", style: TextStyle(fontSize: 16)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirmação"), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            linha("Nome", nome),
            linha("Idade", idade),
            linha("Email", email),
            linha("Sexo", sexo),
            linha("Termos", termos ? "Sim" : "Não"),

            SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Voltar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Editar"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
