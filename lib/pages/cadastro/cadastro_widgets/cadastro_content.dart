import 'dart:ui';

import 'package:cadastro_cliente/FormDataProvider.dart';
import 'package:cadastro_cliente/model/insertCliente.dart';
import 'package:cadastro_cliente/model/objectbox.dart';
import 'package:cadastro_cliente/objectbox.g.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_api/api_cep.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_api/api_cnpj.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_appbar.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_content_page_1.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_content_page_2.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_content_page_3.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_decoracao.dart';
import 'package:cadastro_cliente/pages/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

///
int currentPage = 0;

class CadastroContent extends StatefulWidget {
  final int? id;

  const CadastroContent({Key? key, this.id});
  State<CadastroContent> createState() => _CadastroContentState();
}

class _CadastroContentState extends State<CadastroContent> {
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final provider = Provider.of<FormDataProvider>(context);
    final store = Provider.of<Store>(context, listen: false);
    Cliente? cliente;

    if (widget.id != null) {
      final clientebox = store.box<Cliente>();
      int id = widget.id ?? 0;
      cliente = clientebox.get(id);
      if (cliente != null) {
        provider.setCNPJ(cliente.CNPJ);
        provider.setRazaoSocial(cliente.RazaoSocial);
        provider.setInscricaoEsta(cliente.InscEstadual);
        provider.setInscricaoMun(cliente.InscMuni);
        provider.setCEP(cliente.CEP);
        provider.setRua(cliente.Rua);
        provider.setNumero(cliente.Numero);
        provider.setBairro(cliente.Bairro);
        provider.setCidade(cliente.Cidade);
        provider.setUf(cliente.UF);
        provider.setInfCom(cliente.InforComple);
        provider.toggleCheckbox(cliente.check ?? false);
        provider.setCEPDf(cliente.CEPLCD ?? "");
        provider.setRuaDf(cliente.RuaLCD ?? "");
        provider.setBairroDf(cliente.BairroLCD ?? "");
        provider.setCidadeDf(cliente.CidadeLCD ?? "");
        provider.setUfDf(cliente.UFLCD ?? "");
        provider.setNumeroCdInfCon(cliente.NumeroLCD ?? "");
        provider.setInfoComCdCon(cliente.InforCompleLCD ?? "");

        provider.setCepPage2(cliente.CEPLE);
        provider.setRuaPage2(cliente.RuaLE);
        provider.setNumeroPage2(cliente.NumeroLE);
        provider.setBairroPage2(cliente.BairroLE);
        provider.setCidadePage2(cliente.CidadeLE);
        provider.setEstadoPage2(cliente.UFLE);
        provider.setInfoComplPage2(cliente.InforCompleLE ?? "");
        provider.setFretePage2(cliente.Frete);
        provider.setVolumeEstimadoPage2(cliente.VolEstimado);
        provider.setVolumePrevPage2(cliente.VolPrevPedido);
        provider.setCapTanPage2(cliente.CapaTanque);
        provider.setHorarioLimPage2(cliente.HoraLimite);
        provider.setTipoLigaEletricaPage2(cliente.TipoLigEle);
        provider.setRespoRecPage2(cliente.RespoPeloRece);
        provider.setMangoPage2(cliente.Mangote);
        provider.setClientePossuiBalancaPage2(cliente.CliPossuBalan ?? "");
        provider.setTpEntregaPage2(cliente.TipoEntre ?? "");
        provider.setrepelubOuClientePage2(cliente.RepeluOuClien ?? "");
        provider.setANPPage2(cliente.RegiANP ?? "");
        provider.setTeleCelularPage2(cliente.Tele);
        provider.setTipoTamPage2(cliente.ObsTipoTamanho);
        provider.setResCaminPage2(cliente.RestriCami);
      }
    }
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
