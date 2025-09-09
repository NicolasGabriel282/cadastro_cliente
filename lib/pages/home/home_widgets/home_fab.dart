import 'package:cadastro_cliente/pages/cadastro/cadastro_page.dart';
import 'package:flutter/material.dart';

FloatingActionButton getHomeFab(context) {
  return FloatingActionButton(onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CadastroPage()),
                    );
  },
  child: Text("+",
   style:
    TextStyle(fontSize: 25),
  ),
  
  );
}
