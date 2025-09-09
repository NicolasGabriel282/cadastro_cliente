import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<BuscarCEP> fetchCEP(cep) async {
  final response = await http.get(
    Uri.parse("https://viacep.com.br/ws/${cep}/json/"),
  );
  if (response.statusCode == 200) {
    return BuscarCEP.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  } else {
    throw Exception("Falha");
  }
}

class BuscarCEP {
  final String rua;
  final String bairro;
  final String cidade;
  final String uf;

  const BuscarCEP({
    required this.rua,
    required this.bairro,
    required this.cidade,
    required this.uf,
  });
  factory BuscarCEP.fromJson(Map<String, dynamic> json) {
    return BuscarCEP(
      rua: json["logradouro"]??'',
      bairro: json["bairro"]??"",
      cidade: json["localidade"]??"",
      uf: json['uf']??"",
    );
  }
}
