import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/matterial/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Cart"),
        ),
        body: Column(
          children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ]));
  }
}

class _CartTotal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         VxBuilder(
           mutations: {RemoveMutation},
            // ignore: non_constant_identifier_names
           builder: (Context , _ ,Store)
           {return 
            "\$${_cart.totalPrice}"
                  .text
                  .xl3
                  .color(context.theme.accentColor)
                  .make();
                  },
          ),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not spported yet".text.make(),
                    ));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  child: "Buy".text.make())
              .w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Noting to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                   onPressed: () => RemoveMutation(_cart.items[index]),
                   ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
