

import 'package:http/http.dart' as http;
import 'dart:convert';

class PostagemModel {
  Future<bool> sendDataToBackend(String text) async {


    var url = Uri.parse('http://localhost/conn2tcc.php'); // coloque o endereço do arquivo do servidor backend php, se for local criá-lo no htdocs
    var response = await http.post(url, body: jsonEncode (<String, String>{'text': text})); // essa função http.post tranforma o dado recebido em formato JSON
    // para que o arquivo php possa ler
    return response.statusCode == 200;

  }
}
