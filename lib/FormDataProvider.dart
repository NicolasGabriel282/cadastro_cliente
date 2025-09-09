import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_content_page_1.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_api/api_cep.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_api/api_cnpj.dart';

class FormDataProvider with ChangeNotifier {
  String _CNPJ = "";
  String _RazaoSocial = "";
  String _InscEsPro = "";
  String _InscMun = "";
  String _CEPCD = "";
  String _RuaCD = "";
  String _NumeroCD = "";
  String _BairroCD = "";
  String _CidadeCD = "";
  String _UfCD = "";
  String? _InfoCompleCD = "";
  String? _CEPCDInfCon = "";
  String? _RuaCDInfCon = "";
  String? _BairroCDInfCon = "";
  String? _CidadeCDInfCon = "";
  String? _UFCdInfCon = "";
  String? _NumeroCdInfCon = "";
  String? _InfoComCDCon = "";
  bool _isChecked = false;

  bool _isLoadingCNPJ = false;
  bool _isLoadingCEP = false;
  String? _errorMessageCNPJ;
  String? _errorMessageCEP;

  final TextEditingController cnpjController = TextEditingController();
  final TextEditingController razaoController = TextEditingController();
  final TextEditingController inscEsproController = TextEditingController();
  final TextEditingController inscMunController = TextEditingController();
  final TextEditingController cepController = TextEditingController();
  final TextEditingController ruaController = TextEditingController();
  final TextEditingController numeroController = TextEditingController();
  final TextEditingController bairroController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();
  final TextEditingController ufController = TextEditingController();
  final TextEditingController infoCompleCDController = TextEditingController();
  ////
  final TextEditingController ruaControllerLCD = TextEditingController();
  final TextEditingController bairroControllerLCD = TextEditingController();
  final TextEditingController cidadeControllerLCD = TextEditingController();
  final TextEditingController ufControllerLCD = TextEditingController();
  final TextEditingController numeroControllerLCD = TextEditingController();
  final TextEditingController cepControllerLCD = TextEditingController();
  final TextEditingController infoComCDConController = TextEditingController();
  final FocusNode focusNodeCNPJ = FocusNode();
  final FocusNode focusNodeCEP = FocusNode();

  String get razaoSocial => _RazaoSocial;
  String get cnpj => _CNPJ;
  String get inscEs => _InscEsPro;
  String get inscMun => _InscMun;
  String get cep => _CEPCD;
  String get rua => _RuaCD;
  String get numero => _NumeroCD;
  String get bairro => _BairroCD;
  String get cidade => _CidadeCD;
  String get uf => _UfCD;
  String? get infoComple => _InfoCompleCD;
  String? get ruaCD => _RuaCDInfCon;
  String? get bairroCD => _BairroCDInfCon;
  String? get cidadeCD => _CidadeCDInfCon;
  String? get ufCD => _UFCdInfCon;
  String? get numeroCD => _NumeroCdInfCon;
  String? get cepCD => _CEPCDInfCon;
  String? get infoCompleCD => _InfoComCDCon;
  bool get IsChecked => _isChecked;

  bool get isLoadingCNPJ => _isLoadingCNPJ;
  bool get isLoadingCEP => _isLoadingCEP;
  String? get errorMessageCNPJ => _errorMessageCNPJ;
  String? get errorMessageCEP => _errorMessageCEP;

  void setCNPJ(String value) {
    _CNPJ = value;
    notifyListeners();
  }

  void setRazaoSocial(String value) {
    _RazaoSocial = value;
    notifyListeners();
  }

  void setInscricaoEsta(String value) {
    _InscEsPro = value;
    notifyListeners();
  }

  void setInscricaoMun(String value) {
    _InscMun = value;
    notifyListeners();
  }

  void setInscEsPro(String value) {
    _InscEsPro = value;
    notifyListeners();
  }

  void setInscMun(String value) {
    _InscMun = value;
    notifyListeners();
  }

  void setCEP(String value) {
    _CEPCD = value;
    notifyListeners();
  }

  void setRua(String value) {
    _RuaCD = value;
    notifyListeners();
  }

  void setNumero(String value) {
    _NumeroCD = value;
    notifyListeners();
  }

  void setBairro(String value) {
    _BairroCD = value;
    notifyListeners();
  }

  void setCidade(String value) {
    _CidadeCD = value;
    notifyListeners();
  }

  void setUf(String value) {
    _UfCD = value;
    notifyListeners();
  }

  void setInfCom(String value) {
    _InfoCompleCD = value;
    notifyListeners();
  }

  void toggleCheckbox(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  void setCEPDf(String value) {
    _CEPCDInfCon = value;
    notifyListeners();
  }

  void setRuaDf(String value) {
    _RuaCDInfCon = value;
    notifyListeners();
  }

  void setBairroDf(String value) {
    _BairroCDInfCon = value;
    notifyListeners();
  }

  void setCidadeDf(String value) {
    _CidadeCDInfCon = value;
    notifyListeners();
  }

  void setUfDf(String value) {
    _UFCdInfCon = value;
    notifyListeners();
  }

  void setNumeroCdInfCon(String value) {
    _NumeroCdInfCon = value;
    notifyListeners();
  }

  void setInfoComCdCon(String value) {
    _InfoComCDCon = value;
    notifyListeners();
  }

  Future<void> buscarDados(String cnpj, BuildContext context) async {
    if (cnpj.isEmpty) return;
    if (cnpj.length < 14 ) return;
    _isLoadingCNPJ = true;
    _errorMessageCNPJ = null;
    notifyListeners();
    try {
      final dados = await fetchCNPJ(cnpj);
      razaoController.text = dados.razaoSocial;
      cepController.text = dados.CEP;
      ruaController.text = dados.Rua;
      numeroController.text = dados.Numero;
      bairroController.text = dados.Bairro;
      cidadeController.text = dados.Cidade;
      ufController.text = dados.UF;

      _RazaoSocial = dados.razaoSocial;
      _CEPCD = dados.CEP;
      _RuaCD = dados.Rua;
      _NumeroCD = dados.Numero;
      _BairroCD = dados.Bairro;
      _CidadeCD = dados.Cidade;
      _UfCD = dados.UF;
      _errorMessageCNPJ = null;
    } catch (e) {
      _errorMessageCNPJ = "Erro ao buscar CNPJ: $e";
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erro ao buscar CNPJ: $e")));
    } finally {
      _isLoadingCNPJ = false;
      notifyListeners();
    }
  }

  Future<void> buscarCEP(String cep, BuildContext context) async {
    if (cep.isEmpty) return;
    _isLoadingCEP = true;
    _errorMessageCEP = null;
    notifyListeners();
    try {
      final dados = await fetchCEP(cep);
      ruaControllerLCD.text = dados.rua;
      bairroControllerLCD.text = dados.bairro;
      cidadeControllerLCD.text = dados.cidade;
      ufControllerLCD.text = dados.uf;

      _RuaCDInfCon = dados.rua;
      _BairroCDInfCon = dados.bairro;
      _CidadeCDInfCon = dados.cidade;
      _UFCdInfCon = dados.uf;

      _errorMessageCEP = null;
    } catch (e) {
      _errorMessageCEP = "Erro ao buscar CEP: $e";
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erro ao buscar CEP: $e")));
    } finally {
      _isLoadingCEP = false;
      notifyListeners();
    }
  }

  ///////// PAGE 2 //////////////////////////////

  String _ruaLe = "";
  String _bairroLe = "";
  String _cidadeLe = "";
  String _estadoLe = "";
  String _numeroLe = "";
  String _cepLe = "";
  String? _infoCompleLe = "";
  String _ANPLe = "";
  String _freteLe = "";
  String _volumeEstimadoLe = "";
  String _volumePrevLe = "";
  String _capTanLe = "";
  String _horaLimEnLe = "";
  String _tipoLigaEletricaLe = "";
  String _respoRecLe = "";
  String _MangoLe = "";
  String _ClientePossBalanLe = "";
  String _tpEntregaLe = "";
  String _RepelubOuClieLe = "";
  String _TeleCelulaLe = "";
  String _TipoTamLe = "";
  String _ResCaminLe = "";
  bool _isLoadingCEPpage2 = false;
  String? _errorMessageCepPage2;

  final TextEditingController ruaControllerPage2 = TextEditingController();
  final TextEditingController bairroControllerPage2 = TextEditingController();
  final TextEditingController cidadeControllerPage2 = TextEditingController();
  final TextEditingController ufControllerPage2 = TextEditingController();
  final TextEditingController cepControllerPage2 = TextEditingController();
  final TextEditingController numeroControllerPage2 = TextEditingController();
  final TextEditingController infoComplControllerPage2 =
      TextEditingController();
  String? ANPLeControllerPage2;
  final TextEditingController freteLeControllerPage2 = TextEditingController();
  final TextEditingController volumeEstimadoLeControllerPage2 =
      TextEditingController();
  final TextEditingController volumePrevLeControllerPage2 =
      TextEditingController();
  final TextEditingController capTanLeControllerPage2 = TextEditingController();
  final TextEditingController horaLimEnLeControllerPage2 =
      TextEditingController();
  final TextEditingController tipoLigaEletricaControllerPage2 =
      TextEditingController();
  final TextEditingController responRecControllerPage2 =
      TextEditingController();
  final TextEditingController mangoteControllerPage2 = TextEditingController();
  String? clientePossuiBalancaPage2;
  String? tpEntregaControllerPage2;
  String? RepelubOuClienteControllerPage2;
  final TextEditingController TeleCelularControllerPage2 =
      TextEditingController();
  final TextEditingController tipoTamControllerPage2 = TextEditingController();
  final TextEditingController ResCaminControllerPage2 = TextEditingController();
  final FocusNode focusNodeCEPPage2 = FocusNode();

  String get ruaPage2 => _ruaLe;
  String get bairroPage2 => _bairroLe;
  String get cidadePage2 => _cidadeLe;
  String get estadoPage2 => _estadoLe;
  String get numeroPage2 => _numeroLe;
  String get cepLePage2 => _cepLe;
  String? get infoComplePage2 => _infoCompleLe;
  String get ANPPage2 => _ANPLe;
  String get FretePage2 => _freteLe;
  String get VolumeEstimadoPage2 => _volumeEstimadoLe;
  String get VolumePreviPage2 => _volumePrevLe;
  String get CapTanPage2 => _capTanLe;
  String get horaLimEnPage2 => _horaLimEnLe;
  String get tipoLigaEletricaPage2 => _tipoLigaEletricaLe;
  String get respoRecPage2 => _respoRecLe;
  String get MangoPage2 => _MangoLe;
  String get ClientePossuiBalanPage2 => _ClientePossBalanLe;
  String get tpEntregaPage2 => _tpEntregaLe;
  String get repelubOuClientePage2 => _RepelubOuClieLe;
  String get TeleCelularPage2 => _TeleCelulaLe;
  String get TipoTamPage2 => _TipoTamLe;
  String get ResCaminPage2 => _ResCaminLe;
  bool get isLoadingCepPage2 => _isLoadingCEPpage2;
  String? get erroMessageCepPage2 => _errorMessageCepPage2;

  void setCepPage2(String value) {
    _cepLe = value;
    notifyListeners();
  }

  void setRuaPage2(String value) {
    _ruaLe = value;
    notifyListeners();
  }

  void setBairroPage2(String value) {
    _bairroLe = value;
    notifyListeners();
  }

  void setCidadePage2(String value) {
    _cidadeLe = value;
    notifyListeners();
  }

  void setNumeroPage2(String value) {
    _numeroLe = value;
    notifyListeners();
  }

  void setEstadoPage2(String value) {
    _estadoLe = value;
    notifyListeners();
  }

  void setInfoComplPage2(String value) {
    _infoCompleLe = value;
    notifyListeners();
  }

  void setANPPage2(String value) {
    _ANPLe = value;
    notifyListeners();
  }

  void setFretePage2(String value) {
    _freteLe = value;
    notifyListeners();
  }

  void setVolumeEstimadoPage2(String value) {
    _volumeEstimadoLe = value;
    notifyListeners();
  }

  void setVolumePrevPage2(String value) {
    _volumePrevLe = value;
    notifyListeners();
  }

  void setCapTanPage2(String value) {
    _capTanLe = value;
    notifyListeners();
  }

  void setHorarioLimPage2(String value) {
    _horaLimEnLe = value;
    notifyListeners();
  }

  void setTipoLigaEletricaPage2(String value) {
    _tipoLigaEletricaLe = value;
    notifyListeners();
  }

  void setRespoRecPage2(String value) {
    _respoRecLe = value;
    notifyListeners();
  }

  void setMangoPage2(String value) {
    _MangoLe = value;
    notifyListeners();
  }

  void setClientePossuiBalancaPage2(String value) {
    _ClientePossBalanLe = value;
    notifyListeners();
  }

  void setTpEntregaPage2(String value) {
    _tpEntregaLe = value;
    notifyListeners();
  }

  void setrepelubOuClientePage2(String value) {
    _RepelubOuClieLe = value;
    notifyListeners();
  }

  void setTeleCelularPage2(String value) {
    _TeleCelulaLe = value;
    notifyListeners();
  }

  void setTipoTamPage2(String value) {
    _TipoTamLe = value;
    notifyListeners();
  }

  void setResCaminPage2(String value) {
    _ResCaminLe = value;
    notifyListeners();
  }

  Future<void> BuscarCEPPage2(String cep, BuildContext context) async {
    if (cep.isEmpty) return;
    _isLoadingCEPpage2 = true;
    _errorMessageCEP = null;
    notifyListeners();
    try {
      final dados = await fetchCEP(cep);
      ruaControllerPage2.text = dados.rua;
      bairroControllerPage2.text = dados.bairro;
      cidadeControllerPage2.text = dados.cidade;
      ufControllerPage2.text = dados.uf;

      _ruaLe = dados.rua;
      _bairroLe = dados.bairro;
      _cidadeLe = dados.cidade;
      _estadoLe = dados.uf;
      _errorMessageCepPage2 = null;
    } catch (e) {
      _errorMessageCEP = "Erro ao buscar CEP: $e";
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Erro ao buscar CEP: $e")));
    } finally {
      _isLoadingCEP = false;
      notifyListeners();
    }
  }

  /// PAGE 3

  final TextEditingController produtoControllerPage3 = TextEditingController();
  final TextEditingController precoLitroControllerPage3 =
      TextEditingController();
  final TextEditingController prazoPagControllerPage3 = TextEditingController();
  final TextEditingController infComplControllerPage3 = TextEditingController();
  final TextEditingController ApComControllerPage3 = TextEditingController();

  String? _InfCp;
  String? _ApCom;

  String? get InfComPage3 => _InfCp;
  String? get ApComerPage3 => _ApCom;

  final List<Map<String, String>> itens = [];

  void adicionarItem() {
    itens.add({
      "Produto": produtoControllerPage3.text,
      "PreçoPorLitro": precoLitroControllerPage3.text,
      "PrazoDePagamento": prazoPagControllerPage3.text,
    });
    notifyListeners();
    produtoControllerPage3.clear();
    precoLitroControllerPage3.clear();
    prazoPagControllerPage3.clear();
  }

  void setInfComPage3(String value) {
    _InfCp = value;
    notifyListeners();
  }

  void setApComPage3(String value) {
    _ApCom = value;
    notifyListeners();
  }

  void clear() {
    cnpjController.clear();
    razaoController.clear();
    inscEsproController.clear();
    inscMunController.clear();
    cepController.clear();
    ruaController.clear();
    numeroController.clear();
    bairroController.clear();
    cidadeController.clear();
    ufController.clear();
    infoCompleCDController.clear();
    ruaControllerLCD.clear();
    bairroControllerLCD.clear();
    cidadeControllerLCD.clear();
    ufControllerLCD.clear();
    numeroControllerLCD.clear();
    cepControllerLCD.clear();
    infoComCDConController.clear();
    ruaControllerPage2.clear();
    bairroControllerPage2.clear();
    cidadeControllerPage2.clear();
    ufControllerPage2.clear();
    cepControllerPage2.clear();
    numeroControllerPage2.clear();
    infoComplControllerPage2.clear();
    freteLeControllerPage2.clear();
    volumeEstimadoLeControllerPage2.clear();
    volumePrevLeControllerPage2.clear();
    capTanLeControllerPage2.clear();
    horaLimEnLeControllerPage2.clear();
    tipoLigaEletricaControllerPage2.clear();
    responRecControllerPage2.clear();
    mangoteControllerPage2.clear();
    TeleCelularControllerPage2.clear();
    tipoTamControllerPage2.clear();
    ResCaminControllerPage2.clear();
    itens.clear();
    produtoControllerPage3.clear();
    precoLitroControllerPage3.clear();
    prazoPagControllerPage3.clear();
    infComplControllerPage3.clear();
    ApComControllerPage3.clear();
  }

  @override
  void dispose() {
    cnpjController.dispose();
    razaoController.dispose();
    inscEsproController.dispose();
    inscMunController.dispose();
    cepController.dispose();
    ruaController.dispose();
    numeroController.dispose();
    bairroController.dispose();
    cidadeController.dispose();
    ufController.dispose();
    infoCompleCDController.dispose();
    ruaControllerLCD.dispose();
    bairroControllerLCD.dispose();
    cidadeControllerLCD.dispose();
    ufControllerLCD.dispose();
    numeroControllerLCD.dispose();
    cepControllerLCD.dispose();
    infoComCDConController.dispose();
    focusNodeCEP.dispose();
    focusNodeCNPJ.dispose();

    /////
    ruaControllerPage2.dispose();
    bairroControllerPage2.dispose();
    cidadeControllerPage2.dispose();
    ufControllerPage2.dispose();
    cepControllerPage2.dispose();
    numeroControllerPage2.dispose();
    infoComplControllerPage2.dispose();
    //ANPLeControllerPage2.dispose();
    freteLeControllerPage2.dispose();
    volumeEstimadoLeControllerPage2.dispose();
    volumePrevLeControllerPage2.dispose();
    capTanLeControllerPage2.dispose();
    horaLimEnLeControllerPage2.dispose();
    tipoLigaEletricaControllerPage2.dispose();
    responRecControllerPage2.dispose();
    mangoteControllerPage2.dispose();
    //clientePossuiBalancaPage2.dispose();
    //tpEntregaControllerPage2.dispose();
    //RepelubOuClienteControllerPage2.dispose();
    TeleCelularControllerPage2.dispose();
    tipoTamControllerPage2.dispose();
    ResCaminControllerPage2.dispose();
    focusNodeCEPPage2.dispose();
  }
}
