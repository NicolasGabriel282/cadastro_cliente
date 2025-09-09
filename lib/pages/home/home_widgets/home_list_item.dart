import 'package:cadastro_cliente/pages/home/home_widgets/home_list_model.dart';
import 'package:flutter/material.dart';

class HomeListItem extends StatefulWidget {
  
  HomeListModel? homeListModel;
  HomeListItem({this.homeListModel});

  @override
  State<HomeListItem> createState() => _HomeListItemState();
  
}

class _HomeListItemState extends State<HomeListItem> {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            height: 5,
            
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 219, 64, 2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),

              ),
              ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
              ),            
            child: Container( 
              padding: EdgeInsets.all(12),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                Row(
                  children: [
                    Icon(Icons.business),
                    Padding(padding: EdgeInsets.only(left: 15)),
                    Text(widget.homeListModel!.title ?? '', style: TextStyle(),),
                  ],
                ),
                

              ],
            ),
          ),
          ),
        ],
      ),
    );
  }
}
