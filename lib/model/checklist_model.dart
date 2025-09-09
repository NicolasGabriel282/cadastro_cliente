import 'dart:io';
import 'package:cadastro_cliente/model/objectbox.dart';
import 'package:cadastro_cliente/objectbox.g.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

@Entity()
class CheckListItem {
  int id;
  final String title;
  bool isCompleted;
  String? filePath;
  DateTime? lastUpdated;
  final cliente = ToOne<Cliente>();

  CheckListItem({
    this.id = 0,
    required this.title,
    this.isCompleted = false,
    this.filePath,
    this.lastUpdated,
  });
}

class ChecklistRepository {
  late Store store;
  late Box<CheckListItem> box;
  late Box<Cliente> clientebox;

  ChecklistRepository(this.store) {
    box = store.box<CheckListItem>();
    clientebox = store.box<Cliente>();
  }

  Future<void> saveChecklistItem(CheckListItem item, id) async {
    final cliente = clientebox.get(id);
    if (cliente != null) {
      item.lastUpdated = DateTime.now();
      item.cliente.target = cliente;
      box.put(item);
    }
  }

  List<CheckListItem> getAllItems(int id) {
    return box.getAll();
  }

  CheckListItem? getChecklistItemByTitle(String title, int id) {
    final query = box.query(CheckListItem_.title.equals(title).and 
    (CheckListItem_.cliente.equals(id))).build();
    final result = query.findFirst();
    query.close();
    return result;
  }

  Future<void> deleteChecklistItem(int id) async {
    box.remove(id);
  }

  Future<void> clearAll() async {
    box.removeAll();
  }
}
