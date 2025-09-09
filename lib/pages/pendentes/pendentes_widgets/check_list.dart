import 'dart:io';

import 'package:cadastro_cliente/model/checklist_model.dart';
import 'package:cadastro_cliente/pages/cadastro/cadastro_widgets/cadastro_appbar.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

class CheckListPage extends StatefulWidget {
  final ChecklistRepository repository;
  final int id;

  const CheckListPage({Key? key, required this.repository, required this.id})
    : super(key: key);

  @override
  _CheckListState createState() => _CheckListState();
}

class _CheckListState extends State<CheckListPage> {
  List<CheckListItem> items = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  _loadItems() {
    int id = widget.id;
    final savedItems = widget.repository.getAllItems(id);
    if (savedItems.isEmpty) {
      List<CheckListItem> items = [
        CheckListItem(title: "Ficha Cadastral Preenchida e Assinada"),
        CheckListItem(title: "Simulador de Preço"),
        CheckListItem(title: "Consulta SERASA"),
        CheckListItem(title: "Cartão CNPJ"),
        CheckListItem(title: "Cartão de Inscrição Estadual e Municipal"),
        CheckListItem(title: "Inscrição de Produtor Rural"),
        CheckListItem(title: "Contrato Social e Última Alteração Contratual"),
        CheckListItem(title: "Documentação dos Sócios"),
        CheckListItem(title: "Comprovante de Endereço"),
        CheckListItem(title:"Relação de faturamento dos últimos 12 meses(Assinada pelo contador)",),
        CheckListItem(title: "Relação de Bens e Frotas de Veículos (Próprios)"),
        CheckListItem(
          title: "Fotos do Tanque de Armazenamento e Infra-estrutura geral",
        ),
      ];
      for (var item in items) {
        widget.repository.saveChecklistItem(item, widget.id);
      }
    } else {
      items = savedItems;
    }
    setState(() {});
  }

  Future<void> _uploadFile(int index, File file) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName =
        '${items[index].title}_${DateTime.now().microsecondsSinceEpoch}';
    final savedFile = await file.copy('${appDir.path}/$fileName');

    setState(() {
      items[index].filePath = savedFile.path;
      items[index].isCompleted = true;
    });
    await widget.repository.saveChecklistItem(items[index], widget.id);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetCadastroAppBar(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ChecklistItemWidget(
            item: items[index],
            onUpload: (file) => _uploadFile(index, file),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final allCompleted = items.every((item) => item.isCompleted);
          if (allCompleted) {
            _showSuccessDialog();
          } else {
            _showIncompleteAlert();
          }
        },
        child: Icon(Icons.send),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Sucesso!"),
        content: Text("Todos os documentos foram enviados."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _showIncompleteAlert() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Atenção"),
        content: Text("Existem itens pendentes no check list."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ChecklistItemWidget extends StatelessWidget {
  final CheckListItem item;
  final Function(File) onUpload;
  ChecklistItemWidget({required this.item, required this.onUpload});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(value: item.isCompleted, onChanged: (value) {}),
        title: Text(item.title),
        subtitle: item.filePath != null
            ? Text(item.filePath!.split('/').last)
            : null,
        trailing: IconButton(
          icon: Icon(Icons.attach_file),
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result != null) {
              File file = File(result.files.single.path!);
              onUpload(file);
            }
          },
        ),
      ),
    );
  }
}
