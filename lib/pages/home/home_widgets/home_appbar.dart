import 'package:flutter/material.dart';

AppBar getHomeAppBar() {
  return AppBar(
    title: Text(""), titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
    centerTitle: true,
    backgroundColor: Color.fromARGB(255, 196, 111, 0),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded,color: Colors.white,))
    ],
  );
}
