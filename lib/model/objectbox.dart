import 'package:cadastro_cliente/model/checklist_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Cliente {
  int id;
  String CNPJ;
  String RazaoSocial;
  String InscEstadual;
  String InscMuni;
  String CEP;
  String Rua;
  String Numero;
  String Bairro;
  String Cidade;
  String UF;
  String? InforComple;
  bool? check;
  String? CEPLCD;
  String? RuaLCD;
  String? BairroLCD;
  String? CidadeLCD;
  String? UFLCD;
  String? NumeroLCD;
  String? InforCompleLCD;

  String CEPLE;
  String RuaLE;
  String NumeroLE;
  String BairroLE;
  String CidadeLE;
  String UFLE;
  String? InforCompleLE;
  String Frete;
  String VolEstimado;
  String VolPrevPedido;
  String CapaTanque;
  String HoraLimite;
  String TipoLigEle;
  String RespoPeloRece;
  String Mangote;
  String? CliPossuBalan;
  String? TipoEntre;
  String? RepeluOuClien;
  String? RegiANP;
  String Tele;
  String ObsTipoTamanho;
  String RestriCami;
  String? InfoCompleCP;
  String? ApresComerciCP;
  final produtos = ToMany<Produto>();
  @Backlink('cliente')
  final documentos = ToMany<CheckListItem>();
  Cliente({
    this.id = 0,
    required this.CNPJ,
    required this.RazaoSocial,
    required this.InscEstadual,
    required this.InscMuni,
    required this.CEP,
    required this.Rua,
    required this.Numero,
    required this.Bairro,
    required this.Cidade,
    required this.UF,
    this.InforComple,
    this.CEPLCD,
    this.RuaLCD,
    this.BairroLCD,
    this.CidadeLCD,
    this.UFLCD,
    this.NumeroLCD,
    this.InforCompleLCD,
    this.check,

    required this.CEPLE,
    required this.RuaLE,
    required this.NumeroLE,
    required this.BairroLE,
    required this.CidadeLE,
    required this.UFLE,
    this.InforCompleLE,
    required this.Frete,
    required this.VolEstimado,
    required this.VolPrevPedido,
    required this.CapaTanque,
    required this.HoraLimite,
    required this.TipoLigEle,
    required this.RespoPeloRece,
    required this.Mangote,
    this.CliPossuBalan,
    this.TipoEntre,
    this.RepeluOuClien,
    this.RegiANP,
    required this.Tele,
    required this.ObsTipoTamanho,
    required this.RestriCami,
    this.InfoCompleCP,
    required this.ApresComerciCP,
  });
}

@Entity()
class Produto {
  int id;
  String? NomeProduto;
  String? PrazoPagamento;
  String? PrecoLitro;
  Produto({
    this.id = 0,
    this.NomeProduto,
    this.PrazoPagamento,
    this.PrecoLitro,
  });
}
