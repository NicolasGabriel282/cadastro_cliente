import 'package:cadastro_cliente/FormDataProvider.dart';
import 'package:cadastro_cliente/main.dart';
import 'package:cadastro_cliente/model/objectbox.dart';
import 'package:cadastro_cliente/objectbox.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InseriClientes {
  void Insert(FormDataProvider provider, BuildContext context) {

    final store = Provider.of<Store>(context, listen: false);
    final clienteBox = store.box<Cliente>();
    var cliente = Cliente(
      CNPJ: provider.cnpj,
      RazaoSocial: provider.razaoSocial,
      InscEstadual: provider.inscEs,
      InscMuni: provider.inscMun,
      CEP: provider.cep,
      Rua: provider.rua,
      Numero: provider.numero,
      Bairro: provider.bairro,
      Cidade: provider.cidade,
      UF: provider.uf,
      InforComple: provider.infoComple,
      CEPLCD: provider.cepCD,
      RuaLCD: provider.ruaCD,
      BairroLCD: provider.bairroCD,
      CidadeLCD: provider.cidadeCD,
      UFLCD: provider.ufCD,
      NumeroLCD: provider.numeroCD,
      InforCompleLCD: provider.infoCompleCD,
      CEPLE: provider.cepLePage2,
      RuaLE: provider.ruaPage2,
      NumeroLE: provider.numeroPage2,
      BairroLE: provider.bairroPage2,
      CidadeLE: provider.cidadePage2,
      UFLE: provider.estadoPage2,
      InforCompleLE: provider.infoComplePage2,
      Frete: provider.FretePage2,
      VolEstimado: provider.VolumeEstimadoPage2,
      VolPrevPedido: provider.VolumePreviPage2,
      CapaTanque: provider.CapTanPage2,
      HoraLimite: provider.horaLimEnPage2,
      TipoLigEle: provider.tipoLigaEletricaPage2,
      RespoPeloRece: provider.respoRecPage2,
      Mangote: provider.MangoPage2,
      CliPossuBalan: provider.clientePossuiBalancaPage2,
      TipoEntre: provider.tpEntregaPage2,
      RepeluOuClien: provider.repelubOuClientePage2,
      RegiANP: provider.ANPPage2,
      Tele: provider.TeleCelularPage2,
      ObsTipoTamanho: provider.TipoTamPage2,
      RestriCami: provider.ResCaminPage2,
      ApresComerciCP: provider.ApComerPage3,
    );
    final produtos = provider.itens.map((map) {
      return Produto(NomeProduto: map["Produto"],
       PrazoPagamento: map["PreçoPorLitro"],
        PrecoLitro: map["PrazoDePagamento"]);
    }).toList();
    cliente.produtos.addAll(produtos);
    clienteBox.put(cliente);
  }
}
