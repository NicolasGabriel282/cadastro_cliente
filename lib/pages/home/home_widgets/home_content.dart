import 'package:cadastro_cliente/main.dart';
import 'package:cadastro_cliente/model/objectbox.dart';
import 'package:cadastro_cliente/pages/home/home_widgets/home_appbar.dart';
import 'package:cadastro_cliente/pages/home/home_widgets/home_list_item.dart';
import 'package:cadastro_cliente/pages/home/home_widgets/home_list_model.dart';
import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:provider/provider.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  _HomePageContentStateState createState() => _HomePageContentStateState();
}

class _HomePageContentStateState extends State<HomePageContent> {
  Future<List<Cliente>> _loadClientes() async {
    final store = Provider.of<Store>(context, listen: false);
    final clienteBox = store.box<Cliente>();
    return clienteBox.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }


}
