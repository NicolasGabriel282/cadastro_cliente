import 'package:cadastro_cliente/FormDataProvider.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_appbar.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_content_page_2.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_decoracao.dart';
import 'package:cadastro_cliente/pages/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:provider/provider.dart';

String? InfCp;
String? ApCom;

class Page3 extends StatefulWidget {
  final FormDataProvider provider;
  const Page3({required this.provider});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(20.0),
          child: Consumer<FormDataProvider>(
            builder: (context, provider, child) {
              return Container(
                child: Column(
                  children: <Widget>[
                    ProdutoField(provider),
                    SizedBox(height: 8),
                    PrecoLitroField(provider),
                    SizedBox(height: 8),
                    PrazoPagamentoField(provider),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => provider.adicionarItem(),
                      child: Text("Adicionar"),
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: provider.itens.length,
                        itemBuilder: (context, index) {
                          final item = provider.itens[index];
                          return Card(
                            child: ListTile(
                              title: Text(item["Produto"] ?? ""),
                              subtitle: Text(
                                "Preço por Litro:${item["PreçoPorLitro"]} \nPrazo de Pagamento:${item["PrazoDePagamento"]}",
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    InfComplCP(provider),
                    SizedBox(height: 10),
                    ApComCP(provider),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

ProdutoField(FormDataProvider provider) {
  return TextFormField(
    style: CorLetras(),
    controller: provider.produtoControllerPage3,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.text,
    decoration: InputDecorationCadastro("Digite o nome do produto"),
  );
}

PrecoLitroField(FormDataProvider provider) {
  return TextFormField(
    style: CorLetras(),
    controller: provider.precoLitroControllerPage3,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.text,
    decoration: InputDecorationCadastro("Prazo(s) de Pagamento"),
  );
}

PrazoPagamentoField(FormDataProvider provider) {
  return TextFormField(
    style: CorLetras(),
    textAlign: TextAlign.center,
    controller: provider.prazoPagControllerPage3,
    keyboardType: TextInputType.text,
    decoration: InputDecorationCadastro("Preço por Litro"),
  );
}

InfComplCP(FormDataProvider provider) {
  return TextFormField(
    style: CorLetras(),
    textAlign: TextAlign.center,
    controller: provider.infComplControllerPage3,
    keyboardType: TextInputType.text,
    decoration: InputDecorationCadastro("Informações Complementares"),
    onSaved: (String? value) {
      InfCp = value;
    },
  );
}

ApComCP(FormDataProvider provider) {
  return TextFormField(
    style: CorLetras(),
    controller: provider.ApComControllerPage3,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.text,
    decoration: InputDecorationCadastro("Apresentação Comercial"),
    onSaved: (String? value) {
      ApCom = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}
