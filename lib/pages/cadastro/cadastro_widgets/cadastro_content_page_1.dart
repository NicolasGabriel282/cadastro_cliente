import 'package:cadastro_cliente/FormDataProvider.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_api/api_cep.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_api/api_cnpj.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_appbar.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_decoracao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:brasil_fields/brasil_fields.dart';

String? razaoSocial;
String? cnpj;
String? inscEst;
String? ruaAv;
String? bairro;
String? cidade;
String? estado;
String? numero;
String? cep;
String? inscMun;
String? infComple;
String? cepCb;
String? ruaCb;
String? bairroCb;
String? cidadeCb;
String? infComCb;
String? estadoCb;
String? numeroCb;

class Page1 extends StatelessWidget {
  final FormDataProvider provider;
  const Page1({required this.provider});
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
                provider.focusNodeCNPJ.addListener(() {
                  if (!provider.focusNodeCNPJ.hasFocus &&
                      provider.cnpjController.text.isNotEmpty) {
                    provider.buscarDados(provider.cnpjController.text, context);
                  }
                });
                provider.focusNodeCEP.addListener(() {
                  if (!provider.focusNodeCEP.hasFocus &&
                      provider.cepControllerLCD.text.isNotEmpty) {
                    provider.buscarCEP(provider.cepControllerLCD.text, context);
                  }
                });
                return Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        child: Text(
                          "INFORMAÇÕES CADASTRAIS",
                          style: TextStyle(
                            color: const Color.fromARGB(255, 230, 85, 2),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      Column(
                        children: <Widget>[
                          CNPJField(context, provider),
                          const SizedBox(height: 8),
                          razaoSocialField(provider.razaoController),
                          const SizedBox(height: 8),
                          InscEstProField(provider.inscEsproController),
                          const SizedBox(height: 8),
                          InscMunField(provider.inscMunController),
                          const SizedBox(height: 8),
                          CEPField(provider.cepController),
                          const SizedBox(height: 10),

                          Row(
                            children: [
                              RuaAvField(provider.ruaController),
                              const SizedBox(width: 31),
                              NumeroField(provider.numeroController),
                            ],
                          ),
                          const SizedBox(height: 15),

                          BairroField(provider.bairroController),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              CidadeField(provider.cidadeController),
                              const SizedBox(width: 31),
                              EstadoField(provider.ufController),
                            ],
                          ),
                          const SizedBox(height: 8),
                          InfCompleField(provider.infoComCDConController),
                          const SizedBox(height: 8),

                          CheckboxListTile(
                            activeColor: const Color.fromARGB(255, 255, 123, 0),
                            checkColor: Colors.white,
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(
                              "Local de cobrança diferente",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 244, 146, 54),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            value: provider.IsChecked,
                            onChanged: (bool? value) {
                              if(value != null)
                              {
                              provider.toggleCheckbox(value);
                              }
                            },
                          ),
                          if (provider.IsChecked) ...{
                            CepCBField(
                              enabled: provider.IsChecked,
                              context: context,
                              provider: provider,
                            ),
                            const SizedBox(height: 8),
                            RuaCBField(
                              enabled: provider.IsChecked,
                              ruaControllerLCD: provider.ruaControllerLCD,
                            ),
                            const SizedBox(height: 8),
                            BairroCBField(
                              enabled: provider.IsChecked,
                              bairroControllerLCD: provider.bairroControllerLCD,
                            ),

                            const SizedBox(height: 8),
                            Row(
                              children: [
                                CidadeCBField(
                                  enabled: provider.IsChecked,
                                  cidadeControllerLCD:
                                      provider.cidadeControllerLCD,
                                ),
                                const SizedBox(width: 7),
                                estadoCBField(
                                  enabled: provider.IsChecked,
                                  ufControllerLCD: provider.ufControllerLCD,
                                ),
                                const SizedBox(width: 4),
                                numeroCBField(
                                  enabled: provider.IsChecked,
                                  numeroControllerLCD:
                                      provider.numeroControllerLCD,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            infComCBField(
                              enabled: provider.IsChecked,
                              infoComCDConController:
                                  provider.infoComCDConController,
                            ),
                          },
                        ],
                      ),
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

Widget razaoSocialField(razaoController) {
  return SizedBox(
    child: TextFormField(
      maxLines: 2,
      controller: razaoController,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Razão Social"),
      onSaved: (String? value) {
        razaoSocial = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget CNPJField(BuildContext context, FormDataProvider provider) {
  return SizedBox(
    child: TextFormField(
      controller: provider.cnpjController,
      focusNode: provider.focusNodeCNPJ,
      style: CorLetras(),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecorationCadastro("CNPJ ou CPF"),
      onSaved: (String? value) {
        cnpj = value;
      },
      onChanged: (value) {
        provider.setCNPJ(value);
      },
      onEditingComplete: () {
        provider.buscarDados(provider.cnpjController.text, context);
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget InscEstProField(inscEsproController) {
  return SizedBox(
    child: TextFormField(
      style: CorLetras(),
      controller: inscEsproController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Insc. Estadual/Produtor"),
      onSaved: (String? value) {
        inscEst = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget InscMunField(inscMunController) {
  return SizedBox(
    child: TextFormField(
      style: CorLetras(),
      controller: inscMunController,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Insc. Municipal"),
      onSaved: (String? value) {
        inscMun = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget RuaAvField(ruaController) {
  return SizedBox(
    width: 200,
    child: TextFormField(
      controller: ruaController,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Rua/Av"),
      onSaved: (String? value) {
        ruaAv = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget BairroField(bairroController) {
  return SizedBox(
    child: TextFormField(
      controller: bairroController,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Bairro"),
      onSaved: (String? value) {
        bairro = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget CidadeField(cidadeController) {
  return SizedBox(
    width: 200,
    child: TextFormField(
      controller: cidadeController,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Cidade"),
      onSaved: (String? value) {
        cidade = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget EstadoField(ufcontroller) {
  return SizedBox(
    width: 100,
    child: TextFormField(
      controller: ufcontroller,
      maxLength: 2,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("UF"),
      onSaved: (String? value) {
        estado = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget NumeroField(numeroController) {
  return SizedBox(
    width: 100,
    child: TextFormField(
      controller: numeroController,
      style: CorLetras(),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      decoration: InputDecorationCadastro("Numero"),
      onSaved: (String? value) {
        numero = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget CEPField(cepController) {
  return SizedBox(
    child: TextFormField(
      controller: cepController,
      style: CorLetras(),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecorationCadastro("CEP"),
      onSaved: (String? value) {
        cep = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget InfCompleField(infoComCDConController) {
  return SizedBox(
    width: 250,
    child: TextFormField(
      style: CorLetras(),
      controller: infoComCDConController,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Informações Complementares"),
      onSaved: (String? value) {
        infComple = value;
      },
    ),
  );
}

Widget CepCBField({
  bool enabled = true,
  required BuildContext context,
  required FormDataProvider provider,
}) {
  return SizedBox(
    child: TextFormField(
      controller: provider.cepControllerLCD,
      focusNode: provider.focusNodeCEP,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      enabled: enabled,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("CEP"),
      onSaved: (String? value) {
        cepCb = value;
      },
      onChanged: (value) {
        provider.setCEP(value);
      },
      onEditingComplete: () {
        provider.buscarCEP(provider.cepControllerLCD.text, context);
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget RuaCBField({bool enabled = true, ruaControllerLCD}) {
  return SizedBox(
    child: TextFormField(
      controller: ruaControllerLCD,
      enabled: enabled,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Rua"),
      onSaved: (String? value) {
        ruaCb = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget BairroCBField({bool enabled = true, bairroControllerLCD}) {
  return SizedBox(
    child: TextFormField(
      controller: bairroControllerLCD,
      enabled: enabled,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Bairro"),
      onSaved: (String? value) {
        bairroCb = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget CidadeCBField({bool enabled = true, cidadeControllerLCD}) {
  return SizedBox(
    width: 160,
    child: TextFormField(
      controller: cidadeControllerLCD,
      enabled: enabled,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Cidade"),
      onSaved: (String? value) {
        cidadeCb = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget infComCBField({bool enabled = true, infoComCDConController}) {
  return TextFormField(
    enabled: enabled,
    controller: infoComCDConController,
    style: CorLetras(),
    textAlign: TextAlign.center,
    keyboardType: TextInputType.text,
    decoration: InputDecorationCadastro("Informações Complementares"),
    onSaved: (String? value) {
      infComCb = value;
    },
  );
}

Widget estadoCBField({bool enabled = true, ufControllerLCD}) {
  return SizedBox(
    width: 60,
    child: TextFormField(
      controller: ufControllerLCD,
      enabled: enabled,
      maxLength: 2,
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("UF"),
      onSaved: (String? value) {
        estadoCb = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}

Widget numeroCBField({bool enabled = true, numeroControllerLCD}) {
  return SizedBox(
    width: 100,
    child: TextFormField(
      controller: numeroControllerLCD,
      enabled: enabled,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: CorLetras(),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.text,
      decoration: InputDecorationCadastro("Numero"),
      onSaved: (String? value) {
        numeroCb = value;
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo Obrigatorio";
        }
      },
    ),
  );
}
