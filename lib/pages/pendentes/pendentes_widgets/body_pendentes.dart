import 'package:cadastro_cliente/main.dart';
import 'package:cadastro_cliente/model/checklist_model.dart';
import 'package:cadastro_cliente/model/objectbox.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_page.dart';
import 'package:cadastro_cliente/pages/home/home_widgets/home_appbar.dart';
import 'package:cadastro_cliente/pages/home/home_widgets/home_list_item.dart';
import 'package:cadastro_cliente/pages/home/home_widgets/home_list_model.dart';
import 'package:cadastro_cliente/pages/pendentes/pendentes_widgets/check_list.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:provider/provider.dart';

class BodyPendentes extends StatefulWidget {
  const BodyPendentes({super.key});

  @override
  _HomePageContentStateState createState() => _HomePageContentStateState();
}

class _HomePageContentStateState extends State<BodyPendentes> {
  Future<List<Cliente>> _loadClientes() async {
    final store = Provider.of<Store>(context, listen: false);
    final clienteBox = store.box<Cliente>();
    return clienteBox.getAll();
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<ChecklistRepository>(context, listen: false);
    return Scaffold(
      body: FutureBuilder<List<Cliente>>(
        future: _loadClientes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Erro ao carregar clientes"));
          }
          final clientes = snapshot.data ?? [];
          if (clientes.isEmpty) {
            return Center(child: Text("Nenhum cliente cadastrado"));
          }
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: clientes.length,
            itemBuilder: (context, index) {
              final cliente = clientes[index];
              return Card(
                color: Color.fromARGB(255, 255, 255, 255),
                elevation: 4,
                margin: EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              cliente.RazaoSocial ?? "Sem nome",
                              style: TextStyle(),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            onPressed: () =>
                                _deletarCliente(cliente.id, context),
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      _buildInfRow('CNPJ: ', cliente.CNPJ),
                      _buildInfRow('Cidade: ', cliente.Cidade),
                      _buildInfRow('UF: ', cliente.UF),

                      if (cliente.produtos.isNotEmpty) ...[
                        SizedBox(height: 12),
                        Text("Produtos: ", style: TextStyle()),
                        SizedBox(height: 4),
                        Wrap(
                          spacing: 8,
                          children: cliente.produtos.map((produto) {
                            return Chip(
                              label: Text(produto.NomeProduto ?? 'Produto'),
                            );
                          }).toList(),
                        ),
                      ],
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckListPage(
                                      repository: repository,
                                      id: cliente.id,
                                    ),
                                  ),
                                );
                              },
                              child: Text('Ver Pendencias'),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>
                                  CadastroPage( id: cliente.id),
                                  ),
                                );
                              },
                              child: Text('Editar'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildInfRow(String label, String? value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text('$label'),
          Expanded(child: Text(value ?? "Não Informado")),
        ],
      ),
    );
  }

  void _deletarCliente(int id, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmar exclusão"),
          content: Text("Tem certeza que deseja excluir este cliente?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                final store = Provider.of<Store>(context, listen: false);
                final box = store.box<Cliente>();
                box.remove(id);
                setState(() {});
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Cliente removido com sucesso"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Text("Excluir"),
            ),
          ],
        );
      },
    );
  }
}
