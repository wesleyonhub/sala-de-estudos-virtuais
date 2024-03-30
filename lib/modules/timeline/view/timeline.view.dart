import 'package:flutter/material.dart';
import 'package:app_tcc/modules/timeline/model/timeline.model.dart';
// sempre que for passar uma página como parametro para um rota, chamar a funçao rota no arquivo main.dart
// e usar o nome da primeira classe que aparece na página como parametro (no caso aqui é a classe InputPage)
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  TextEditingController textController = TextEditingController();
  PostagemModel _postagemModel = PostagemModel();

  void _submitData() async {
    String text = textController.text;
    bool success = await _postagemModel.sendDataToBackend(text);
    if (success) {
      print(_postagemModel.sendDataToBackend(text));
      // Data sent successfully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Postagem enviada com sucesso'),
        ),
      );
    } else {
      // Error sending data
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao enviar postagem'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postagens'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Insira sua postagem',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Postar'),
            ),
          ],
        ),
      ),
    );
  }
}