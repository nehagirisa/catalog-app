import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/matterial/cart.dart';
import 'package:catalog_app/matterial/catalog.dart';
import 'package:catalog_app/widget/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
        shape: MaterialStateProperty.all(StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(MyTheme.lightColor),
      ),
      child: isInCart ? Icon(Icons.done) : "Add To Cart".text.make(),
    );
  }
}
