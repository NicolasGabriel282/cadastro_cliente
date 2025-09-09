import 'package:cadastro_cliente/pages/home/home_widgets/home_appbar.dart';
import 'package:cadastro_cliente/pages/home/home_widgets/home_content.dart';
import 'package:cadastro_cliente/pages/home/home_widgets/home_drawer.dart';
import 'package:cadastro_cliente/pages/home/home_widgets/home_fab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
     Scaffold( 
      appBar: getHomeAppBar(),
      drawer: getHomeDrawer(),
      floatingActionButton: getHomeFab(context),
      body: HomePageContent(),

    );
  }
}
