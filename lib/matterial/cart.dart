
import 'package:velocity_x/velocity_x.dart';

import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/matterial/catalog.dart';

class CartModel {


  //catalog fild
  CatalogModel _catalog;

//catalog ids -store ids of each item
  final List<int> _itemIds = [];

//get catalog
 CatalogModel get catalog => _catalog;

 set catalog(CatalogModel newCatalog){
   assert (newCatalog != null);
   _catalog= newCatalog;
 }
  //get item in the cart
List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

//get total price
num get totalPrice => 
    items.fold(0,(total, current) => total+ current.price);   
}


class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(
    this.item
  );
  @override
  
  perform() {
    store.cart._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(
    this.item
  );
  @override
  
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}
