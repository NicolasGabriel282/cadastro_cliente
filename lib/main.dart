import 'package:cadastro_cliente/FormDataProvider.dart';
import 'package:cadastro_cliente/model/checklist_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/login/login_screen.dart';
import 'objectbox.g.dart';

late final Store store;
late final Admin _admin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final store = await openStore();
  if (Admin.isAvailable()) {
    _admin= Admin(store);
  }
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store store;
  const MyApp({Key? key, required this.store}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
