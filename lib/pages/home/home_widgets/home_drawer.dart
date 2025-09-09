import 'package:flutter/material.dart';

Drawer getHomeDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color: Color.fromARGB(255, 196, 111, 0)),
          accountName: Text("Nicolas Gabriel"),
          accountEmail: Text("ti05@repelub.com.br"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text("NG",style: TextStyle(fontSize: 40),),
          ),
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: const Color.fromARGB(78, 73, 73, 73),
          ),
          title: Text("Configurações"),
        ),
                ListTile(
          leading: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(78, 73, 73, 73),
          ),
          title: Text("Sair"),
        ),
      ],
    ),

  );
}
