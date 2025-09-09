import 'dart:ui';

import 'package:cadastro_cliente/FormDataProvider.dart';
import 'package:cadastro_cliente/model/insertCliente.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_api/api_cep.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_api/api_cnpj.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_appbar.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_content_page_1.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_content_page_2.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_content_page_3.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_decoracao.dart';
import 'package:cadastro_cliente/pages/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
int currentPage = 0;

class CadastroContent extends StatefulWidget {
  const CadastroContent({super.key});
  @override
  State<CadastroContent> createState() => _CadastroContentState();
}

class _CadastroContentState extends State<CadastroContent> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FormDataProvider>(context);
    final List<Widget> pages = [
      Page1(provider: provider),
      Page2(provider: provider),
      Page3(provider: provider),
    ];
    return Scaffold(
      appBar: GetCadastroAppBar(),
      body: Form(
        key: _formKey,
        child: IndexedStack(index: currentPage, children: pages),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color.fromARGB(255, 141, 57, 1),
        selectedItemColor: const Color.fromARGB(255, 255, 123, 0),
        selectedFontSize: 12,
        unselectedFontSize: 11,

        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Infor. Cadastrais",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Local de Entrega",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: "Comp. de preços",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            InseriClientes classe = InseriClientes();
            classe.Insert(provider, context);
            provider.clear();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavigationMenu()),
            );
          }
        },
      ),
    );
  }
}
