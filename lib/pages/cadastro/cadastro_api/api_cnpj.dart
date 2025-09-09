import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_content.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

Future<BuscaCNPJ> fetchCNPJ(cnpj) async {
  final response = await http.get(
    Uri.parse("https://brasilapi.com.br/api/cnpj/v1/${cnpj}"),
  );

  if (response.statusCode == 200) {
    return BuscaCNPJ.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  } else {
    throw Exception("Falha");
  }
}

class BuscaCNPJ {
  final String razaoSocial;
  final String CEP;
  final String Rua;
  final String Numero;
  final String Bairro;
  final String Cidade;
  final String UF;

  const BuscaCNPJ({
    required this.razaoSocial,
    required this.CEP,
    required this.Rua,
    required this.Numero,
    required this.Bairro,
    required this.Cidade,
    required this.UF,
  });

  factory BuscaCNPJ.fromJson(Map<String, dynamic> json) {
    return BuscaCNPJ(
      razaoSocial: json['razao_social']??'', 
      CEP: json['cep']??"",
      Rua: json['logradouro']??'',
      Numero: json['numero']??"",
      Bairro: json['bairro']??'',
      Cidade: json['municipio']??"",
      UF: json['uf']??''
      );
  }
}



