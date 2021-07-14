// To parse this JSON data, do
//
//   final item = itemFromJson(jsonString);

import 'dart:convert';
class CatalogModel {
  

   static List<Item> items;

   // Get by Id
   Item getById(int id) => items.firstWhere((element)=> element.id == id,orElse: null);

   //Get by Position
    Item getByPosition(int pos)=> items[pos];
}

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
     this.id,
     this.name,
     this.image,
     this.disc,
     this.color,
     this.price,
  });

  final int id;
  final String name;
  final String image;
  final String disc;
  final String color;
  final int price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        image: json["image"] == null ? null : json["image"],
        disc: json["disc"] == null ? null : json["disc"],
        color: json["color"] == null ? null : json["color"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "image": image == null ? null : image,
        "disc": disc == null ? null : disc,
        "color": color == null ? null : color,
        "price": price == null ? null : price,
      };
}
