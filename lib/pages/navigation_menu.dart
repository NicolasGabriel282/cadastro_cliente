import 'package:cadastro_cliente/pages/enviados/enviados_page.dart';
import 'package:cadastro_cliente/pages/home/home_page.dart';
import 'package:cadastro_cliente/pages/pendentes/pendentes_page.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPage = 0;
   final List<Widget> pages = [
    HomePage(),
    EnviadosPage(),
    Pendentes(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: const Color.fromARGB(255, 141, 57, 1),
        selectedItemColor: const Color.fromARGB(255, 255, 123, 0),
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Clientes"),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: "Enviados"),
          BottomNavigationBarItem(
            icon: Icon(Icons.pending),
            label: "Pendentes",
          ),
        ],
      ),
    );
  }
}
