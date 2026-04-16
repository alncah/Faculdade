import 'package:flutter/material.dart';
import 'confirmacao_page.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final emailController = TextEditingController();

  String? sexo;
  bool termosAceitos = false;

  void validarEEnviar() {
    try {
      if (nomeController.text.isEmpty) {
        throw "Nome não pode ser vazio";
      }

      if (idadeController.text.isEmpty) {
        throw "Idade não pode ser vazia";
      }

      int idade = int.parse(idadeController.text);
      if (idade < 18) {
        throw "Idade deve ser maior ou igual a 18";
      }

      if (emailController.text.isEmpty ||
          !emailController.text.contains("@") ||
          !emailController.text.contains(".")) {
        throw "Email inválido";
      }

      if (sexo == null) {
        throw "Selecione o sexo";
      }

      if (!termosAceitos) {
        throw "Aceite os termos de uso";
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmacaoPage(
            nome: nomeController.text,
            idade: idadeController.text,
            email: emailController.text,
            sexo: sexo!,
            termos: termosAceitos,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  InputDecoration campoDecoracao(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: Text("Cadastro de Usuário"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Preencha os campos abaixo",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                TextField(
                  controller: nomeController,
                  textInputAction: TextInputAction.next,
                  decoration: campoDecoracao("Nome"),
                ),
                SizedBox(height: 10),

                TextField(
                  controller: idadeController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: campoDecoracao("Idade"),
                ),
                SizedBox(height: 10),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: campoDecoracao("Email"),
                ),
                SizedBox(height: 10),

                DropdownButtonFormField<String>(
                  value: sexo,
                  hint: Text("Selecione o sexo"),
                  items: ["Masculino", "Feminino", "Outro"]
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      sexo = value;
                    });
                  },
                  decoration: campoDecoracao("Sexo"),
                ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Checkbox(
                      value: termosAceitos,
                      onChanged: (value) {
                        setState(() {
                          termosAceitos = value!;
                        });
                      },
                    ),
                    Expanded(child: Text("Aceito os termos de uso")),
                  ],
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  onPressed: validarEEnviar,
                  child: Text("Cadastrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
