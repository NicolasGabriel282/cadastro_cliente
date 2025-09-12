import 'package:brasil_fields/brasil_fields.dart';
import 'package:cadastro_cliente/FormDataProvider.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_api/api_cep.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_appbar.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_decoracao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

String? ruaLe;
String? bairroLe;
String? cidadeLe;
String? estadoLe;
String? numeroLe;
String? cepLe;
String? infoCompleLe;
String? ANPLe;
String? freteLe;
String? volumeEstimadoLe;
String? volumePrevLe;
String? capTanLe;
String? horaLimEnLe;
String? tipoLigaEletricaLe;
String? respoRecLe;
String? MangoLe;
String? ClientePossBalanLe;
String? tpEntregaLe;
String? RepelubOuClieLe;
String? TeleCelulaLe;
String? TipoTamLe;
String? ResCaminLe;

class Page2 extends StatelessWidget {
  final FormDataProvider provider;
  const Page2({required this.provider});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: Consumer<FormDataProvider>(
              builder: (context, provider, child) {
                provider.focusNodeCEPPage2.addListener(() {
                  if (!provider.focusNodeCEPPage2.hasFocus &&
                      provider.cepControllerPage2.text.isNotEmpty) {
                    provider.BuscarCEPPage2(
                      provider.cepControllerPage2.text,
                      context,
                    );
                  }
                });
                return Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Text(
                        "LOCAL DE ENTREGA",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 230, 85, 2),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 8),
                      CepLEField(context, provider),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ruaLEField(provider.ruaControllerPage2),
                          const SizedBox(width: 31),
                          numeroLEField(provider.numeroControllerPage2),
                        ],
                      ),
                      const SizedBox(height: 8),
                      bairroLEField(provider.bairroControllerPage2),
                      const SizedBox(height: 8),

                      Row(
                        children: [
                          cidadeLEField(provider.cidadeControllerPage2),
                          const SizedBox(width: 31),
                          estadoLEField(provider.ufControllerPage2),
                        ],
                      ),
                      const SizedBox(height: 8),
                      InfoCompleLEField(provider.infoComplControllerPage2),
                      const SizedBox(height: 30),
                      FreteLE(provider.freteLeControllerPage2),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: VolumeEstimadoLe(
                              provider.volumeEstimadoLeControllerPage2,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: VolumePrevLe(
                              provider.volumePrevLeControllerPage2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: CapacidadeTanqLe(
                              provider.capTanLeControllerPage2,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: HorarioLimEnLe(
                              provider.horaLimEnLeControllerPage2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TipoLigEletricaLe(
                        provider.tipoLigaEletricaControllerPage2,
                      ),
                      const SizedBox(height: 8),
                      ResponsavelReceLe(provider.responRecControllerPage2),
                      const SizedBox(height: 8),
                      MangoteLe(provider.mangoteControllerPage2),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(child: ClienteBalancaLe(provider)),
                          const SizedBox(width: 8),
                          Expanded(child: TipoDeEntregaLe(provider)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(child: RepelubOuClienteLe(provider)),
                          const SizedBox(width: 8),
                          Expanded(child: TemRegistroAnpLe(provider)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TelCelLe(provider.TeleCelularControllerPage2),
                      const SizedBox(height: 8),
                      ObsTipoTamLe(provider.tipoTamControllerPage2),
                      const SizedBox(height: 8),
                      RestricaoCaminLe(provider.ResCaminControllerPage2),
                      const SizedBox(height: 8),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

Widget ruaLEField(cidadeController) {
  return SizedBox(
    width: 200,
    child: TextFormField(
      controller: cidadeController,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Rua"),
      onSaved: (String? value) {
        ruaLe = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget bairroLEField(bairroController) {
  return SizedBox(
    child: TextFormField(
      controller: bairroController,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Bairro"),
      onSaved: (String? value) {
        bairroLe = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget cidadeLEField(cidadeController) {
  return SizedBox(
    width: 200,
    child: TextFormField(
      controller: cidadeController,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Cidade"),
      onSaved: (String? value) {
        cidadeLe = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget estadoLEField(ufController) {
  return SizedBox(
    width: 100,
    child: TextFormField(
      controller: ufController,
      style: CorLetras(),
      textAlign: TextAlign.center,
      maxLength: 2,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("UF"),
      onSaved: (String? value) {
        estadoLe = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget numeroLEField(numeroControllerPage2) {
  return SizedBox(
    width: 100,
    child: TextFormField(
      controller: numeroControllerPage2,
      style: CorLetras(),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Numero"),
      onSaved: (String? value) {
        numeroLe = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget CepLEField(BuildContext context, FormDataProvider provider) {
  return SizedBox(
    child: TextFormField(
      focusNode: provider.focusNodeCEPPage2,
      controller: provider.cepControllerPage2,
      style: CorLetras(),
      textAlign: TextAlign.center,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("CEP"),
      onSaved: (String? value) {
        cepLe = value;
      },
      onChanged: (value) {
        provider.setCepPage2(value);
      },
      onEditingComplete: () {
        provider.BuscarCEPPage2(provider.cepControllerPage2.text, context);
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget InfoCompleLEField(infoComplControllerPage2) {
  return SizedBox(
    child: TextFormField(
      style: CorLetras(),
      controller: infoComplControllerPage2,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Informações Complementares"),
      onSaved: (String? value) {
        infoCompleLe = value;
      },
    ),
  );
}

Widget FreteLE(freteLeControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    controller: freteLeControllerPage2,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    decoration: InputDecorationCadastro("Frete(Distancia em Km)"),
    onSaved: (String? value) {
      freteLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}

Widget VolumeEstimadoLe(volumeEstimadoLeControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    textAlign: TextAlign.center,
    controller: volumeEstimadoLeControllerPage2,
    keyboardType: TextInputType.number,
    decoration: InputDecorationCadastro("Vol. estimado por Mês"),
    onSaved: (String? value) {
      volumeEstimadoLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}

Widget VolumePrevLe(volumeEstimadoLeControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    controller: volumeEstimadoLeControllerPage2,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    decoration: InputDecorationCadastro("Vol. previsto por Pedido"),
    onSaved: (String? value) {
      volumePrevLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}

Widget CapacidadeTanqLe(capTanLeControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    textAlign: TextAlign.center,
    controller: capTanLeControllerPage2,
    keyboardType: TextInputType.number,
    decoration: InputDecorationCadastro("Capacidade de Tanque(s)"),
    onSaved: (String? value) {
      capTanLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}

Widget HorarioLimEnLe(horaLimEnLeControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    textAlign: TextAlign.center,
    controller: horaLimEnLeControllerPage2,
    keyboardType: TextInputType.text,
    maxLength: 5,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly,HoraInputFormatter()],
    decoration: InputDecorationCadastro("Horario Limite de Entega"),
    onSaved: (String? value) {
      horaLimEnLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}

Widget TipoLigEletricaLe(tipoLigaEletricaControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    textAlign: TextAlign.center,
    controller: tipoLigaEletricaControllerPage2,
    keyboardType: TextInputType.text,
    decoration: InputDecorationCadastro("Tipo de Ligação Eletrica"),
    onSaved: (String? value) {
      tipoLigaEletricaLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}

Widget ResponsavelReceLe(responRecControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    textAlign: TextAlign.center,
    controller: responRecControllerPage2,
    keyboardType: TextInputType.text,
    decoration: InputDecorationCadastro("Responsavel Pelo Recebimento"),
    onSaved: (String? value) {
      respoRecLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}

Widget MangoteLe(mangoteControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    textAlign: TextAlign.center,
    controller: mangoteControllerPage2,
    keyboardType: TextInputType.text,
    decoration: InputDecorationCadastro("Mangote"),
    onSaved: (String? value) {
      MangoLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}

Widget ClienteBalancaLe(FormDataProvider provider) {
  return DropdownButtonFormField<String>(
    style: CorLetras(),
    decoration: InputDecorationCadastro("Cliente Possui Balança?"),
    items: [
      DropdownMenuItem(
        value: "Sim",
        child: Text("Sim", style: TextStyle()),
      ),
      DropdownMenuItem(value: "Nao", child: Text("Não")),
      DropdownMenuItem(value: "", child: Text(""))
    ],
    value: provider.clientePossuiBalancaPage2,
    onChanged: (value) {
      provider.clientePossuiBalancaPage2 = value;
    },
    onSaved: (String? value) {
      provider.clientePossuiBalancaPage2 = value;
    },
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Selecione uma opção";
      }
      return null;
    },
  );
}

Widget TipoDeEntregaLe(FormDataProvider provider) {
  return DropdownButtonFormField(
    style: CorLetras(),
    decoration: InputDecorationCadastro("Tipo de entrega / retirada"),
    items: [
      DropdownMenuItem(value: "CIF", child: Text("CIF")),
      DropdownMenuItem(value: "FOB", child: Text("FOB")),
      DropdownMenuItem(value: "", child: Text(""))
    ],
    value: provider.tpEntregaControllerPage2,
    onChanged: (value) {
      provider.tpEntregaControllerPage2 = value;
    },
    onSaved: (String? value) {
      provider.tpEntregaControllerPage2 = value;
    },
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Selecione uma opção";
      }
      return null;
    },
  );
}

Widget RepelubOuClienteLe(FormDataProvider provider) {
  return DropdownButtonFormField(
    style: CorLetras(),
    decoration: InputDecorationCadastro("Repelub ou Cliente?"),
    items: [
      DropdownMenuItem(value: 'REPELUB', child: Text("REPELUB")),
      DropdownMenuItem(value: "Cliente", child: Text("Cliente")),
      DropdownMenuItem(value: "", child: Text(""))
    ],
    value: provider.RepelubOuClienteControllerPage2,
    onChanged: (value) {
      provider.RepelubOuClienteControllerPage2 = value;
    },
    onSaved: (String? value) {
      provider.RepelubOuClienteControllerPage2 = value;
    },
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Selecione uma opção";
      }
      return null;
    },
  );
}

Widget TemRegistroAnpLe(FormDataProvider provider) {
  return DropdownButtonFormField<String>(
    style: CorLetras(),
    decoration: InputDecorationCadastro("Tem registro ANP?"),
    items: [
      DropdownMenuItem(value: "Sim", child: Text("Sim")),
      DropdownMenuItem(value: "Não", child: Text("Não")),
      DropdownMenuItem(value: "", child: Text(""))
    ],
    value: provider.ANPLeControllerPage2,
    onChanged: (value) {
      provider.ANPLeControllerPage2 = value;
    },
    onSaved: (value) {
      provider.ANPLeControllerPage2 = value;
    },
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Selecione uma opção";
      }
      return null;
    },
  );
}

Widget TelCelLe(TeleCelularControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    controller: TeleCelularControllerPage2,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly,TelefoneInputFormatter()],
    textAlign: TextAlign.center,
    keyboardType: TextInputType.phone,
    decoration: InputDecorationCadastro("Telefones / Celulares"),
    onSaved: (String? value) {
      TeleCelulaLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}

Widget ObsTipoTamLe(tipoTamControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    controller: tipoTamControllerPage2,
    textAlign: TextAlign.center,
    keyboardType: TextInputType.text,
    decoration: InputDecorationCadastro("Obs: Tipo e Tamanho"),
    onSaved: (String? value) {
      TipoTamLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}

RestricaoCaminLe(ResCaminControllerPage2) {
  return TextFormField(
    style: CorLetras(),
    textAlign: TextAlign.center,
    keyboardType: TextInputType.text,
    controller: ResCaminControllerPage2,
    decoration: InputDecorationCadastro("Restrição de Caminhão"),
    onSaved: (String? value) {
      ResCaminLe = value;
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Campo Obrigatorio";
      }
    },
  );
}
