import 'package:catalog_app/matterial/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, this.item})
   // ignore: unnecessary_null_comparison
   : assert(item != null),
    super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
           onTap: (){
        print("${item.name}pressed");
      },
        leading: Image.network(
          item.image,   
        ),
        title: Text(item.name),
        subtitle: Text(item.disc),
        trailing: Text("\$${item.price}",
        style: TextStyle(
          fontWeight:FontWeight.bold,
        ),
        ),
        
      ),
    );
  }
}