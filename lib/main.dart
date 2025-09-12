import 'dart:io';

import 'package:cadastro_cliente/FormDataProvider.dart';
import 'package:cadastro_cliente/model/checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login/login_screen.dart';
import 'objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

late final Admin _admin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await openStore();
  //final myBox = store.box<CheckListItem>();
  //myBox.removeAll();
  if (Admin.isAvailable()) {
    _admin = Admin(store);
  }
  runApp(Provider<Store>.value(value: store, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store>(context,listen: false);
    return MultiProvider(
      providers: [
        Provider<Store>.value(value: store),
        Provider<ChecklistRepository>(
          create: (_) => ChecklistRepository(store),
        ),
        ChangeNotifierProvider(create: (_) => FormDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter App',
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 31, 31, 31),
        ),
        initialRoute: '/',
        routes: {'/': (context) => LoginScreen()},
      ),
    );
  }
}

void deleteDbFiles() async {
  Directory docDir = await getApplicationDocumentsDirectory();
  Directory(docDir.path + '/CheckListItem').delete();
}
